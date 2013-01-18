package com.funsmy.base.user

import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.AuthenticationException
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.web.util.SavedRequest
import org.apache.shiro.web.util.WebUtils
import org.apache.shiro.grails.ConfigUtils
import org.apache.commons.lang.RandomStringUtils
import org.h2.command.ddl.CreateLinkedTable;

import com.funsmy.base.user.Userbind
class AuthController {
    def shiroSecurityManager

    def index = { redirect(action: "login", params: params) }

	//war D:/dev/devtools/apache-tomcat-7.0.34/webapps/funsmy.war
	/**
	 * 显示登录页面
	 */
    def login = {
		session['targetUri'] = [controller:'user']
        println        session['targetUri']
		genVerifycode();
        return [ username: params.username, rememberme: (params.rememberme != null), targetUri: params.targetUri ]
    }

	/**
	 * 登录页面使用用户名和密码登录系统
	 * 
	 */
    def signIn = {
		 
		//验证码输对了没？
		if(params.verifycode!=session["verifycode"]){
			flash.message='验证码错误或过期，区分大小写哦'
			redirect(action: "login", params: params)
			return 
		} 
		session["verifycode"] = null;
		 
        def authToken = new UsernamePasswordToken(params.username, params.password as String)

        // Support for "remember me"
        if (params.rememberme) {
            authToken.rememberMe = true
        }
        
        // If a controller redirected to this page, redirect back
        // to it. Otherwise redirect to the root URI.
        def targetUri = params.targetUri ?: "/"
        
        // Handle requests saved by Shiro filters.
        def savedRequest = WebUtils.getSavedRequest(request)
        if (savedRequest) {
            targetUri = savedRequest.requestURI - request.contextPath
            if (savedRequest.queryString) targetUri = targetUri + '?' + savedRequest.queryString
        }
        
        try{
            // Perform the actual login. An AuthenticationException
            // will be thrown if the username is unrecognised  
            // or the password is incorrect.
			SecurityUtils.subject.login(authToken)

            log.info "Redirecting to '${targetUri}'."
            redirect(uri: targetUri)
        } catch (AuthenticationException ex){
            // Authentication failed, so display the appropriate message
            // on the login page.
            log.info "Authentication failure for user '${params.username}'."
            flash.message = message(code: "auth.signin.fail")  + params.username + params.password

            // Keep the username and "remember me" setting so that the
            // user doesn't have to enter them again.
            def m = [ username: params.username ]
            if (params.rememberme) {
                m["rememberme"] = true
            }

            // Remember the target URI too.
            if (params.targetUri) {
                m["targetUri"] = params.targetUri
            }

            // Now redirect back to the login page.
            redirect(action: "login", params: m)
        }
    }

	/**
	 * 退出动作
	 */
    def signOut = {
        // Log the user out of the application.
        def principal = SecurityUtils.subject?.principal
        SecurityUtils.subject?.logout()
        // For now, redirect back to the home page.
        if (ConfigUtils.getCasEnable() && ConfigUtils.isFromCas(principal)) {
            redirect(uri:ConfigUtils.getLogoutUrl())
        }else {
            redirect(uri: "/")
        }
        ConfigUtils.removePrincipal(principal)
    }

    
	
	/**
	 * 注册页面
	 * 网页
	 * 还有弹出框式的呢？
	 * 验证码 怎么弄
	 */
	def regist = { 
		switch (request.method) {
			case 'GET':
			    //注册成功之后呢 跳转到用户列表
			session['targetUri'] = createLink(controller:'user')		
			    genVerifycode();
				[userInstance:new User(params)]
				break
			case 'POST':
			    def userInstance = new User(params)
			    //密码是否一致
			    if(params.passwordhash!=params.repasswordhash){ 
					return [userInstance: userInstance, repassworderror:'密码不一致']
				}
			    //验证码输对了没？
				if(params.verifycode!=session["verifycode"]){
					flash.message='验证码输入错误,区分大小写' 
					return [userInstance: userInstance, verifycodeerror:'验证码输入错误,区分大小写']
			    }
				
				if (!userInstance.save(flush: true)) {
					render view: 'regist', model: [userInstance: userInstance]
					return
				}
				session["verifycode"] = null;
				flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.username])
				redirect controller:'user',action: 'show', id: userInstance.id
				break
			} 
	}
	
	/**
	 * 换一个验证码
	 */
	def getverify = {
		    return genVerifycode()
	} 
	
	
	def oauthbind = {
		 def targetUri = session.targetUri ?: "/"
		 def accesstokenstr = (session[params.provider + ':oasAccessToken'])?.getRawResponse()?:false
		 if(!accesstokenstr){
			 redirect (action:'login')
		 }
		 def bind = parseaccesstokenRespone(accesstokenstr)
		 
		 //能到这个页面说明获取到了授权  
		 switch (request.method) {
			 case 'GET'://显示绑定页面
			     //如果已经绑定了 则跳转至 targetUri，否则显示 绑定页面
			     /*解析 原始response：access_token=0681ca90161bcfb7c1b43717b8504fae
                         &expires_in=1209600
                         &refresh_token=2e2bc6c24a96a9ee3795795e9c97e5d8
                         &openid=2eb90c6b3e8238ee80e01839a94ce7f6
                         &name=jinxing05
                         &nick=曾庆峰
                         &state=4334443		*/
			      
			     if (needbind(bind)){				 				
			          [bind:bind,oauthalias:grailsApplication.config.oauth.providers[params.provider]['alias']]
				 }else{ 
				      session.targetUri = null //目标网址跳过了就 释放
				      redirect(url:targetUri)
				 }
			     //获取用户的信息
				 break
			 case 'POST'://绑定帐号 
				 [userinput:params]
				 break
			 } 
	 }
	 
	 /**
	  * 登录或授权失败
	  */
	def unauthorized = {
		 render "You do not have permission to access this page."
	 }
	 
	 /**
	  * 解析获取授权时返回的字符串
	  * @param rawresponse
	  * @return 键值对
	  */
	 private Map parseaccesstokenRespone(String rawresponse){ 
		 Map bind = [:]
		 def rawarrays = rawresponse.split('&')//一次分割
		 rawarrays.each {entry->
			 entry = entry.split('=') //二次分割
			 bind.put(entry[0],entry[1])
		 }
		 rawarrays = null 
		 return bind
	 }
		  
	 /**
	  * 判断外站用户是否需要绑定本站帐号
	  * @param outaccount
	  * @return
	  */
	 private boolean needbind(Map outaccount){
		 boolean need = true 
		 //查询是否已经绑定了 
		 def userbind = Userbind.findByUidstr(outaccount['openid'])//动态方法
		 if (userbind){//已经绑定 
			 //更新openuser表使 token刷新
			 userbind.lasttokentime = new Date()
			 userbind.accesstoken = outaccount['access_token']
			 userbind.expiresin = outaccount['expires_in'] as Integer
			 userbind.save()
			 
			 
			 //将该用户登录
			 
			 
			 
			 session['user'] = userbind.user
			 need = false	 
		 }else{
		     //否则		 
		 }
		 return need
	 }
	 
	 /**
	  * 生成验证码
	  */
	 private String genVerifycode(){
		 session["verifycode"] = session["verifycode"]?:RandomStringUtils.randomAlphanumeric(6);
		 return session["verifycode"]
	 }
}
