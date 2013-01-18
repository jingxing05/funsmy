<%@ page import="com.funsmy.base.user.Userprofile" %>



<div class="fieldcontain ${hasErrors(bean: userprofileInstance, field: 'birth_day', 'error')} ">
	<label for="birth_day">
		<g:message code="userprofile.birth_day.label" default="Birthday" />
		
	</label>
	<g:textField name="birth_day" value="${fieldValue(bean: userprofileInstance, field: 'birth_day')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userprofileInstance, field: 'birth_month', 'error')} ">
	<label for="birth_month">
		<g:message code="userprofile.birth_month.label" default="Birthmonth" />
		
	</label>
	<g:textField name="birth_month" value="${fieldValue(bean: userprofileInstance, field: 'birth_month')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userprofileInstance, field: 'birth_time', 'error')} ">
	<label for="birth_time">
		<g:message code="userprofile.birth_time.label" default="Birthtime" />
		
	</label>
	<g:textField name="birth_time" value="${fieldValue(bean: userprofileInstance, field: 'birth_time')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userprofileInstance, field: 'birth_year', 'error')} ">
	<label for="birth_year">
		<g:message code="userprofile.birth_year.label" default="Birthyear" />
		
	</label>
	<g:textField name="birth_year" value="${fieldValue(bean: userprofileInstance, field: 'birth_year')}" />

</div>

