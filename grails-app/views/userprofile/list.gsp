
<%@ page import="com.funsmy.base.user.Userprofile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userprofile.label', default: 'Userprofile')}" />
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
						
							<g:sortableColumn property="birth_day" title="${message(code: 'userprofile.birth_day.label', default: 'Birthday')}" />
						
							<g:sortableColumn property="birth_month" title="${message(code: 'userprofile.birth_month.label', default: 'Birthmonth')}" />
						
							<g:sortableColumn property="birth_time" title="${message(code: 'userprofile.birth_time.label', default: 'Birthtime')}" />
						
							<g:sortableColumn property="birth_year" title="${message(code: 'userprofile.birth_year.label', default: 'Birthyear')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${userprofileInstanceList}" var="userprofileInstance">
						<tr>
						
							<td>${fieldValue(bean: userprofileInstance, field: "birth_day")}</td>
						
							<td>${fieldValue(bean: userprofileInstance, field: "birth_month")}</td>
						
							<td>${fieldValue(bean: userprofileInstance, field: "birth_time")}</td>
						
							<td>${fieldValue(bean: userprofileInstance, field: "birth_year")}</td>
						
							<td class="link">
								<g:link action="show" id="${userprofileInstance.id}" class="btn btn-small">
								<g:message code="default.show.label" args="['']" />
								</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${userprofileInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
