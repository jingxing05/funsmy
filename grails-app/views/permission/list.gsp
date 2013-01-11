
<%@ page import="com.funsmy.base.metadata.Permission" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'permission.label', default: 'Permission')}" />
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
						
							<g:sortableColumn property="privilege" title="${message(code: 'permission.privilege.label', default: 'Privilege')}" />
						
							<g:sortableColumn property="description" title="${message(code: 'permission.description.label', default: 'Description')}" />
						
							<g:sortableColumn property="name" title="${message(code: 'permission.name.label', default: 'Name')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${permissionInstanceList}" var="permissionInstance">
						<tr>
						
							<td>${fieldValue(bean: permissionInstance, field: "privilege")}</td>
						
							<td>${fieldValue(bean: permissionInstance, field: "description")}</td>
						
							<td>${fieldValue(bean: permissionInstance, field: "name")}</td>
						
							<td class="link">
								<g:link action="show" id="${permissionInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${permissionInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
