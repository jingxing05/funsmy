<nav class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="brand" href="${createLink(uri: '/')}"> ${grailsApplication.config.site.infor.name}
			</a>

			<div class="nav-collapse">
				<ul class="nav">
					<li
						<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a
						href="${createLink(uri: '/')}"><g:message
								code="default.home.label" /></a></li>
					<shiro:isLoggedIn>
						<li>您好!<shiro:principal />
						</li>
					</shiro:isLoggedIn>
					<shiro:notAuthenticated>
						<li><g:link controller="auth" action="login">
								<g:message code="auth.login" />
							</g:link></li>
						<li><g:link controller="auth" action="regist">
								<g:message code="auth.regist" />
							</g:link></li>
					</shiro:notAuthenticated>

				</ul>
			</div>
		</div>
	</div>
</nav>