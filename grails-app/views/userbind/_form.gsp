<%@ page import="com.funsmy.base.user.Userbind" %>



<div class="fieldcontain ${hasErrors(bean: userbindInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userbind.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="user.id" from="${com.funsmy.base.user.User.list()}" optionKey="id" value="${userbindInstance?.user?.id}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userbindInstance, field: 'provider', 'error')} ">
	<label for="provider">
		<g:message code="userbind.provider.label" default="Provider" />
		
	</label>
	<g:textField name="provider" value="${fieldValue(bean: userbindInstance, field: 'provider')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userbindInstance, field: 'uidstr', 'error')} required">
	<label for="uidstr">
		<g:message code="userbind.uidstr.label" default="Uidstr" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="uidstr" value="${fieldValue(bean: userbindInstance, field: 'uidstr')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userbindInstance, field: 'accesstoken', 'error')} required">
	<label for="accesstoken">
		<g:message code="userbind.accesstoken.label" default="Accesstoken" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="accesstoken" value="${fieldValue(bean: userbindInstance, field: 'accesstoken')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userbindInstance, field: 'lasttokentime', 'error')} required">
	<label for="lasttokentime">
		<g:message code="userbind.lasttokentime.label" default="Lasttokentime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lasttokentime" value="${userbindInstance?.lasttokentime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userbindInstance, field: 'expiresin', 'error')} required">
	<label for="expiresin">
		<g:message code="userbind.expiresin.label" default="Expiresin" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="expiresin" value="${fieldValue(bean: userbindInstance, field: 'expiresin')}" />

</div>

