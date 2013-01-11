package com.funsmy.pub

class FooterTagLib {
	def thisYear = {
		out << new Date().format("yyyy-MM")
	}

	def copyright = {attrs, body->
		out << "&copy; " + attrs.startYear + " -  "
		out << thisYear() + " " + body()
	}
}
