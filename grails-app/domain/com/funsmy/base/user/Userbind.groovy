package com.funsmy.base.user
import java.util.Date;

class Userbind {
	/**
	 * 这个是 本站用户和 外站用户的关联
	 * 一个用户可以有多个外站帐号
	 * 同一个外站帐号只能绑定到一个用户上
	 * @author qingfeng
	 * modify log:
	 */
	//基本字段
	static belongsTo =[user:User]
	//String name //名称
	String provider //哪个平台提供的 inlist【qqt,sinat,qqc, qqz等】
	String uidstr//外站帐号的唯一标识
	
	String accesstoken//获取的授权
	Date lasttokentime
	int expiresin=0//授权过期时间
	

	//字段约束
	static constraints = {
		user()
		provider()
		uidstr(blank:false,unique:true)
		accesstoken(blank:false)
		lasttokentime( )
		expiresin()
		//name(nullable: false, blank: false, unique: true,email:true,size:1..50)
	}
 

	/**
	 * 对象显示为字符串
	 * @author qingfeng
	 */
	String toString(){
		//格式 那种类型的+uidstr
		return provider.toString()+':'+uidstr
	}


	/**
	 * 方法描述
	 * @author qingfeng
	 * modify log:
	 * 
	 */
	String doSomething(){
		// TODO: make me interesting
	}



}
