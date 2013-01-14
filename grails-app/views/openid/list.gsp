
<%@ page import="com.funsmy.base.open.Openid" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'openid.label', default: 'Openid')}" />
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
						
							<g:sortableColumn property="alias" title="${message(code: 'openid.alias.label', default: 'Alias')}" />
						
							<g:sortableColumn property="platform" title="${message(code: 'openid.platform.label', default: 'Platform')}" />
						
							<g:sortableColumn property="isout" title="${message(code: 'openid.isout.label', default: 'Isout')}" />
						
							<g:sortableColumn property="apibaseuri" title="${message(code: 'openid.apibaseuri.label', default: 'Apibaseuri')}" />
						
							<g:sortableColumn property="oauthuri" title="${message(code: 'openid.oauthuri.label', default: 'Oauthuri')}" />
						
							<g:sortableColumn property="appkey" title="${message(code: 'openid.appkey.label', default: 'Appkey')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${openidInstanceList}" var="openidInstance">
						<tr>
						
							<td>${fieldValue(bean: openidInstance, field: "alias")}</td>
						
							<td>${fieldValue(bean: openidInstance, field: "platform")}</td>
						
							<td>${fieldValue(bean: openidInstance, field: "isout")}</td>
						
							<td>${fieldValue(bean: openidInstance, field: "apibaseuri")}</td>
						
							<td>${fieldValue(bean: openidInstance, field: "oauthuri")}</td>
						
							<td>${fieldValue(bean: openidInstance, field: "appkey")}</td>
						
							<td class="link">
								<g:link action="show" id="${openidInstance.id}" class="btn btn-small">
								<g:message code="default.show.label" args="['']" />
								</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${openidInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
