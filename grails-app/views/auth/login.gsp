<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="auth.login" /></title>
</head>
<body> 
	<div id='recommendoauthsignin' class='span6'>
		<g:render template="oauthproviders" />
	</div>
	<div id='normalsignin' class='span6'>
	    <h3>本站帐号登录</h3>
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
		<g:form action="signIn" class="form-horizontal">
			<input type="hidden" name="targetUri" value="${session.targetUri}" />


			<div class="control-group">
				<label class="control-label" for="username"> <g:message
						code="user.email.label" /></label>
				<div class="controls">
					<input type="text" id="username" required="true" name="username"
						value="${username}">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for=password><g:message
						code="user.passwordhash.label" /></label>
				<div class="controls">
					<input type="password" id="password" required="true"
						name="password">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="verifycode"><g:message
						code="auth.verifycode.label" /></label>
				<div class="controls">
					<input type="text" id="verifycode" name="verifycode"
						required="true" maxlength="6"> <span class="help-block"><g:message
							code="auth.verifycode.infor" />: <b> ${session.verifycode}
					</b></span> <span class="help-block"> ${verifycodeerror}</span>
				</div>
			</div>

			<div class="control-group">
				<div class="controls">
					<label class="checkbox"> <input type="checkbox"
						name="rememberme"> <g:message code="auth.rememberme" />
					</label>
					<button type="submit" class="btn">
						<g:message code="auth.login" />
					</button>
				</div>
			</div>
		</g:form>
	</div> 
</body>
</html>
