import com.funsmy.base.metadata.Permission
import com.funsmy.base.open.Openid
import com.funsmy.base.user.Role
import com.funsmy.base.user.User
import org.apache.shiro.crypto.hash.Sha512Hash

class BootStrap {

	def init = { servletContext ->

		def privilegeall = new Permission(name: 'all', privilege:'*:*',description:'全部权限')
		privilegeall.save()

		def adminRole = new Role(name: 'Admin',alias:'管理员')
		adminRole.addToPermissions(privilegeall)
		adminRole.save()

		def user = new User(
				email:'fuck@u.com',
				username: "mm",
				passwordhash: '123123',
				sex:1
				);
		user.addToRoles(adminRole)
		user.save();

		def openplatform = new Openid(
				platform:'qqt',
				alias:'腾讯微博',
				isout:1,
				apibaseuri:'https://open.t.qq.com/',
				oauthuri:'https://open.t.qq.com/cgi-bin/oauth2/authorize'
				)
		openplatform.save()
		openplatform = new Openid(
				platform:'sinat',
				alias:'新浪微博',
				isout:1,
				apibaseuri:'https://api.weibo.com/2/',
				oauthuri:'https://api.weibo.com/oauth2/authorize'
				)
		openplatform.save()
		if(openplatform.hasErrors()){
			println openplatform.errors
		}
	}
	def destroy = {
	}
}
