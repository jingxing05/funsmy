
<%@ page import="com.funsmy.base.user.Userbind" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userbind.label', default: 'Userbind')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<th class="header"><g:message code="userbind.user.label" default="User" /></th>
						
							<g:sortableColumn property="provider" title="${message(code: 'userbind.provider.label', default: 'Provider')}" />
						
							<g:sortableColumn property="uidstr" title="${message(code: 'userbind.uidstr.label', default: 'Uidstr')}" />
						
							<g:sortableColumn property="accesstoken" title="${message(code: 'userbind.accesstoken.label', default: 'Accesstoken')}" />
						
							<g:sortableColumn property="lasttokentime" title="${message(code: 'userbind.lasttokentime.label', default: 'Lasttokentime')}" />
						
							<g:sortableColumn property="expiresin" title="${message(code: 'userbind.expiresin.label', default: 'Expiresin')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${userbindInstanceList}" var="userbindInstance">
						<tr>
						
							<td>${fieldValue(bean: userbindInstance, field: "user")}</td>
						
							<td>${fieldValue(bean: userbindInstance, field: "provider")}</td>
						
							<td>${fieldValue(bean: userbindInstance, field: "uidstr")}</td>
						
							<td>${fieldValue(bean: userbindInstance, field: "accesstoken")}</td>
						
							<td><g:formatDate date="${userbindInstance.lasttokentime}" /></td>
						
							<td>${fieldValue(bean: userbindInstance, field: "expiresin")}</td>
						
							<td class="link">
								<g:link action="show" id="${userbindInstance.id}" class="btn btn-small">
								<g:message code="default.show.label" args="['']" />
								</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${userbindInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
