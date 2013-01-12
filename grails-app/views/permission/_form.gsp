<%@ page import="com.funsmy.base.metadata.Permission" %>



<div class="fieldcontain ${hasErrors(bean: permissionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="permission.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" value="${fieldValue(bean: permissionInstance, field: 'name')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: permissionInstance, field: 'privilege', 'error')} required">
	<label for="privilege">
		<g:message code="permission.privilege.label" default="Privilege" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="privilege" value="${fieldValue(bean: permissionInstance, field: 'privilege')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: permissionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="permission.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="50" value="${fieldValue(bean: permissionInstance, field: 'description')}" />

</div>

