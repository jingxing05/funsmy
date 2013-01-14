package com.funsmy.base.open

class Openid {

	String platform//平台
	String alias   //显示名称
	int   isout = 1  //是否是站外
	String apibaseuri   //api调用基地址
	String oauthuri     //申请授权的地址
	String appkey       //应用key
	String appsecrets //应用密钥

	static constraints = {
		alias   (nullable: false, blank: false)
		platform(nullable: false, blank: false, unique: true) 
		isout(inList:[0,1])//默认为站外
		apibaseuri(nullable: false, blank: false,url:true)//api地址 
		oauthuri(nullable: false, blank: false,url:true)//获取授权地址
		appkey()
		appsecrets()
	}

	static mapping = {
	}
	
	
	String toString(){
		return alias;
	}
}
