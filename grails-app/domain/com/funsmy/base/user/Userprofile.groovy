package com.funsmy.base.user

class Userprofile {
	String birth_year
	String birth_month
	String birth_day 
	String birth_time

	static belongsTo = User
	
    static constraints = {
    }
}
