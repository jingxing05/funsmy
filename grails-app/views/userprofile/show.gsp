
<%@ page import="com.funsmy.base.user.Userprofile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userprofile.label', default: 'Userprofile')}" />
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
				
					<g:if test="${userprofileInstance?.birth_day}">
						<dt><g:message code="userprofile.birth_day.label" default="Birthday" /></dt>
						
							<dd><g:fieldValue bean="${userprofileInstance}" field="birth_day"/></dd>
						
					</g:if>
				
					<g:if test="${userprofileInstance?.birth_month}">
						<dt><g:message code="userprofile.birth_month.label" default="Birthmonth" /></dt>
						
							<dd><g:fieldValue bean="${userprofileInstance}" field="birth_month"/></dd>
						
					</g:if>
				
					<g:if test="${userprofileInstance?.birth_time}">
						<dt><g:message code="userprofile.birth_time.label" default="Birthtime" /></dt>
						
							<dd><g:fieldValue bean="${userprofileInstance}" field="birth_time"/></dd>
						
					</g:if>
				
					<g:if test="${userprofileInstance?.birth_year}">
						<dt><g:message code="userprofile.birth_year.label" default="Birthyear" /></dt>
						
							<dd><g:fieldValue bean="${userprofileInstance}" field="birth_year"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${userprofileInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${userprofileInstance?.id}">
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
