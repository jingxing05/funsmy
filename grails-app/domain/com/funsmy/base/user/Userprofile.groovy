package com.funsmy.base.user

class Userprofile {
	String idcard //身份证
	String birth_year
	String birth_month
	String birth_day 
	String birth_time

	static belongsTo = User
	
    static constraints = {
    }
}
