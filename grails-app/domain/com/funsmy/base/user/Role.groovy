package com.funsmy.base.user
import com.funsmy.base.metadata.Permission
class Role {   
    String alias//别名
	String name //角色名称
    static hasMany = [permissions: Permission ] //一个角色 有多个 权限

    static constraints = {
		alias(unique: true,size:1..10)
        name(nullable: false, blank: false, unique: true) 
    }
	
	String toString(){
		return alias;
	}
}
