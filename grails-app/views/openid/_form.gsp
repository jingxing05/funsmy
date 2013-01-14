<%@ page import="com.funsmy.base.open.Openid" %>



<div class="fieldcontain ${hasErrors(bean: openidInstance, field: 'alias', 'error')} required">
	<label for="alias">
		<g:message code="openid.alias.label" default="Alias" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="alias" value="${fieldValue(bean: openidInstance, field: 'alias')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: openidInstance, field: 'platform', 'error')} required">
	<label for="platform">
		<g:message code="openid.platform.label" default="Platform" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="platform" value="${fieldValue(bean: openidInstance, field: 'platform')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: openidInstance, field: 'isout', 'error')} required">
	<label for="isout">
		<g:message code="openid.isout.label" default="Isout" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="isout" from="${openid.constraints.isout.inList}" value="${openid.isout}" valueMessagePrefix="openid.isout"  />

</div>

<div class="fieldcontain ${hasErrors(bean: openidInstance, field: 'apibaseuri', 'error')} required">
	<label for="apibaseuri">
		<g:message code="openid.apibaseuri.label" default="Apibaseuri" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apibaseuri" value="${fieldValue(bean: openidInstance, field: 'apibaseuri')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: openidInstance, field: 'oauthuri', 'error')} required">
	<label for="oauthuri">
		<g:message code="openid.oauthuri.label" default="Oauthuri" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="oauthuri" value="${fieldValue(bean: openidInstance, field: 'oauthuri')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: openidInstance, field: 'appkey', 'error')} ">
	<label for="appkey">
		<g:message code="openid.appkey.label" default="Appkey" />
		
	</label>
	<g:textField name="appkey" value="${fieldValue(bean: openidInstance, field: 'appkey')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: openidInstance, field: 'appsecrets', 'error')} ">
	<label for="appsecrets">
		<g:message code="openid.appsecrets.label" default="Appsecrets" />
		
	</label>
	<g:textField name="appsecrets" value="${fieldValue(bean: openidInstance, field: 'appsecrets')}" />

</div>

