
<%@ page import="com.funsmy.base.user.Userbind" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userbind.label', default: 'Userbind')}" />
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
				
					<g:if test="${userbindInstance?.user}">
						<dt><g:message code="userbind.user.label" default="User" /></dt>
						
							<dd><g:link controller="user" action="show" id="${userbindInstance?.user?.id}">${userbindInstance?.user?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${userbindInstance?.provider}">
						<dt><g:message code="userbind.provider.label" default="Provider" /></dt>
						
							<dd><g:fieldValue bean="${userbindInstance}" field="provider"/></dd>
						
					</g:if>
				
					<g:if test="${userbindInstance?.uidstr}">
						<dt><g:message code="userbind.uidstr.label" default="Uidstr" /></dt>
						
							<dd><g:fieldValue bean="${userbindInstance}" field="uidstr"/></dd>
						
					</g:if>
				
					<g:if test="${userbindInstance?.accesstoken}">
						<dt><g:message code="userbind.accesstoken.label" default="Accesstoken" /></dt>
						
							<dd><g:fieldValue bean="${userbindInstance}" field="accesstoken"/></dd>
						
					</g:if>
				
					<g:if test="${userbindInstance?.lasttokentime}">
						<dt><g:message code="userbind.lasttokentime.label" default="Lasttokentime" /></dt>
						
							<dd><g:formatDate date="${userbindInstance?.lasttokentime}" /></dd>
						
					</g:if>
				
					<g:if test="${userbindInstance?.expiresin}">
						<dt><g:message code="userbind.expiresin.label" default="Expiresin" /></dt>
						
							<dd><g:fieldValue bean="${userbindInstance}" field="expiresin"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${userbindInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${userbindInstance?.id}">
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
