
<%@ page import="wish.Wish" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-wish" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-wish" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fromwho" title="${message(code: 'wish.fromwho.label', default: 'Fromwho')}" />
					
						<th><g:message code="wish.newlyweds.label" default="Newlyweds" /></th>
					
						<g:sortableColumn property="toname" title="${message(code: 'wish.toname.label', default: 'Toname')}" />
					
						<g:sortableColumn property="wish" title="${message(code: 'wish.wish.label', default: 'Wish')}" />
					
						<g:sortableColumn property="createTime" title="${message(code: 'wish.createTime.label', default: 'Create Time')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${wishInstanceList}" status="i" var="wishInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${wishInstance.id}">${fieldValue(bean: wishInstance, field: "fromwho")}</g:link></td>
					
						<td>${fieldValue(bean: wishInstance, field: "newlyweds")}</td>
					
						<td>${fieldValue(bean: wishInstance, field: "toname")}</td>
					
						<td>${fieldValue(bean: wishInstance, field: "wish")}</td>
					
						<td><g:formatDate date="${wishInstance.createTime}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${wishInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
