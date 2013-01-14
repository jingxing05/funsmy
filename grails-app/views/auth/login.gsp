<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="auth.login" /></title>
</head>
<body>

	<g:form action="signIn" class="form-horizontal">
		<input type="hidden" name="targetUri" value="${targetUri}" />

		<g:if test="${flash.message}">
			<div class="control-group">
				<div class="controls">
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">&times;</button> 
						${flash.message}
					</div>
				</div>
			</div>
		</g:if>
		<div class="control-group">
			<label class="control-label" for="inputusername"><g:message
					code="user.username.label" /></label>
			<div class="controls">
				<input type="text" id="inputusername"
					placeholder="<g:message code="auth.regform.username.label" />"
					name="username" value="${username}">
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="inputpassword"><g:message
					code="user.passwordhash.label" /></label>
			<div class="controls">
				<input type="password" id="inputpassword"
					placeholder="<g:message code="auth.regform.password.label" />"
					name="password">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputverify"><g:message
					code="auth.verifycode.label" /></label>
			<div class="controls">
				<input type="text" id="inputverify"
					placeholder="<g:message code="auth.regform.verify.label" />"
					name="verify">
			</div>
		</div>

		<div class="control-group">
			<div class="controls">
				<label class="checkbox"> <input type="checkbox"
					name="rememberme"> <g:message code="auth.rememberme.label" />
				</label>
				<button type="submit" class="btn">
					<g:message code="auth.login" />
				</button>
			</div>
		</div>
	</g:form>
</body>
</html>
