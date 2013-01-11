package com.funsmy.base.user
import com.funsmy.base.metadata.Permission
class Role {
    String name //角色名称
    String alias//别名
    static hasMany = [permissions: Permission ] //一个角色 有多个 权限

    static constraints = {
        name(nullable: false, blank: false, unique: true)
		alias(unique: true,size:1..10)
    }
	
	String toString(){
		return alias;
	}
}
