package com.funsmy.base.user

import org.apache.shiro.crypto.hash.Sha512Hash

class User {
	String email
    String username
    String passwordhash
	int sex = 0  // 0 女 1 男   默认 女
	
    static hasMany = [roles:Role]

	//字段验证
    static constraints = {
		email(nullable: false, blank: false, unique: true,email:true)
        username(nullable: false, blank: false, unique: true,size:2..40) 
		passwordhash(nullable: false, blank: false, password: true,minSize:6)
		sex(inList:[0,1])
    }
	
	def beforeInsert = {
		    passwordhash = new Sha512Hash(passwordhash).toHex()
		}
	
	/**
	 * tostring 方法
	 */
	String toString(){
		return username
	}
}
