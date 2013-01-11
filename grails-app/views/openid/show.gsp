
<%@ page import="com.funsmy.base.open.Openid" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'openid.label', default: 'Openid')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${openidInstance?.platform}">
						<dt><g:message code="openid.platform.label" default="Platform" /></dt>
						
							<dd><g:fieldValue bean="${openidInstance}" field="platform"/></dd>
						
					</g:if>
				
					<g:if test="${openidInstance?.alias}">
						<dt><g:message code="openid.alias.label" default="Alias" /></dt>
						
							<dd><g:fieldValue bean="${openidInstance}" field="alias"/></dd>
						
					</g:if>
				
					<g:if test="${openidInstance?.isout}">
						<dt><g:message code="openid.isout.label" default="Isout" /></dt>
						
							<dd><g:fieldValue bean="${openidInstance}" field="isout"/></dd>
						
					</g:if>
				
					<g:if test="${openidInstance?.apibaseuri}">
						<dt><g:message code="openid.apibaseuri.label" default="Apibaseuri" /></dt>
						
							<dd><g:fieldValue bean="${openidInstance}" field="apibaseuri"/></dd>
						
					</g:if>
				
					<g:if test="${openidInstance?.oauthuri}">
						<dt><g:message code="openid.oauthuri.label" default="Oauthuri" /></dt>
						
							<dd><g:fieldValue bean="${openidInstance}" field="oauthuri"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${openidInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${openidInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
