
<%@ page import="wish.Newlyweds" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newlyweds.label', default: 'Newlyweds')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newlyweds" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newlyweds" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newlyweds">
			
				<g:if test="${newlywedsInstance?.husband}">
				<li class="fieldcontain">
					<span id="husband-label" class="property-label"><g:message code="newlyweds.husband.label" default="Husband" /></span>
					
						<span class="property-value" aria-labelledby="husband-label"><g:fieldValue bean="${newlywedsInstance}" field="husband"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newlywedsInstance?.wife}">
				<li class="fieldcontain">
					<span id="wife-label" class="property-label"><g:message code="newlyweds.wife.label" default="Wife" /></span>
					
						<span class="property-value" aria-labelledby="wife-label"><g:fieldValue bean="${newlywedsInstance}" field="wife"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newlywedsInstance?.weddingtime}">
				<li class="fieldcontain">
					<span id="weddingtime-label" class="property-label"><g:message code="newlyweds.weddingtime.label" default="Weddingtime" /></span>
					
						<span class="property-value" aria-labelledby="weddingtime-label"><g:formatDate date="${newlywedsInstance?.weddingtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newlywedsInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="newlyweds.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${newlywedsInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newlywedsInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="newlyweds.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${newlywedsInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${newlywedsInstance?.id}" />
					<g:link class="edit" action="edit" id="${newlywedsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
