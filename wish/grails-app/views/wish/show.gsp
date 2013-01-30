
<%@ page import="wish.Wish" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-wish" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-wish" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wish">
			
				<g:if test="${wishInstance?.fromwho}">
				<li class="fieldcontain">
					<span id="fromwho-label" class="property-label"><g:message code="wish.fromwho.label" default="Fromwho" /></span>
					
						<span class="property-value" aria-labelledby="fromwho-label"><g:fieldValue bean="${wishInstance}" field="fromwho"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wishInstance?.newlyweds}">
				<li class="fieldcontain">
					<span id="newlyweds-label" class="property-label"><g:message code="wish.newlyweds.label" default="Newlyweds" /></span>
					
						<span class="property-value" aria-labelledby="newlyweds-label"><g:link controller="newlyweds" action="show" id="${wishInstance?.newlyweds?.id}">${wishInstance?.newlyweds?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${wishInstance?.toname}">
				<li class="fieldcontain">
					<span id="toname-label" class="property-label"><g:message code="wish.toname.label" default="Toname" /></span>
					
						<span class="property-value" aria-labelledby="toname-label"><g:fieldValue bean="${wishInstance}" field="toname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wishInstance?.wish}">
				<li class="fieldcontain">
					<span id="wish-label" class="property-label"><g:message code="wish.wish.label" default="Wish" /></span>
					
						<span class="property-value" aria-labelledby="wish-label"><g:fieldValue bean="${wishInstance}" field="wish"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wishInstance?.createTime}">
				<li class="fieldcontain">
					<span id="createTime-label" class="property-label"><g:message code="wish.createTime.label" default="Create Time" /></span>
					
						<span class="property-value" aria-labelledby="createTime-label"><g:formatDate date="${wishInstance?.createTime}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${wishInstance?.id}" />
					<g:link class="edit" action="edit" id="${wishInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
