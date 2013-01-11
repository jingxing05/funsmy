package com.funsmy.base.metadata

/**
 * 系统权限元数据，采用wildstring方式哦
 * @author qingfeng
 *
 */
class Permission {
	String name //名称
	String privilege //具体权限的字符串
	String description //权限描述

    static constraints = {
		privilege(blank:false,unique:true,size:1..50)
		privilege(blank:false,unique:true)
		description(blank:false,size:1..50)
    }
}
