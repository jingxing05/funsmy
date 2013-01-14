<%@ page import="com.funsmy.base.user.Role" %>



<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'alias', 'error')} ">
	<label for="alias">
		<g:message code="role.alias.label" default="Alias" />
		
	</label>
	<g:textField name="alias" maxlength="10" value="${fieldValue(bean: roleInstance, field: 'alias')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="role.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${fieldValue(bean: roleInstance, field: 'name')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'permissions', 'error')} ">
	<label for="permissions">
		<g:message code="role.permissions.label" default="Permissions" />
		
	</label>
	<g:select name="permissions"
from="${com.funsmy.base.metadata.Permission.list()}"
size="5" multiple="yes" optionKey="id"
value="${roleInstance?.permissions}" />


</div>

