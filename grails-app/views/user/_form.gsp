<%@ page import="com.funsmy.base.user.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" value="${fieldValue(bean: userInstance, field: 'email')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" maxlength="40" value="${fieldValue(bean: userInstance, field: 'username')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordhash', 'error')} required">
	<label for="passwordhash">
		<g:message code="user.passwordhash.label" default="Passwordhash" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="passwordhash" value="${fieldValue(bean: userInstance, field: 'passwordhash')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'sex', 'error')} required">
	<label for="sex">
		<g:message code="user.sex.label" default="Sex" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sex" from="${user.constraints.sex.inList}" value="${user.sex}" valueMessagePrefix="user.sex"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'roles', 'error')} ">
	<label for="roles">
		<g:message code="user.roles.label" default="Roles" />
		
	</label>
	<g:select name="roles"
from="${com.funsmy.base.user.Role.list()}"
size="5" multiple="yes" optionKey="id"
value="${userInstance?.roles}" />


</div>

