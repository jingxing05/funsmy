
<%@ page import="wish.Newlyweds" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newlyweds.label', default: 'Newlyweds')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-newlyweds" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-newlyweds" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="husband" title="${message(code: 'newlyweds.husband.label', default: 'Husband')}" />
					
						<g:sortableColumn property="wife" title="${message(code: 'newlyweds.wife.label', default: 'Wife')}" />
					
						<g:sortableColumn property="weddingtime" title="${message(code: 'newlyweds.weddingtime.label', default: 'Weddingtime')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'newlyweds.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="memo" title="${message(code: 'newlyweds.memo.label', default: 'Memo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newlywedsInstanceList}" status="i" var="newlywedsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${newlywedsInstance.id}">${fieldValue(bean: newlywedsInstance, field: "husband")}</g:link></td>
					
						<td>${fieldValue(bean: newlywedsInstance, field: "wife")}</td>
					
						<td><g:formatDate date="${newlywedsInstance.weddingtime}" /></td>
					
						<td>${fieldValue(bean: newlywedsInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: newlywedsInstance, field: "memo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newlywedsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
