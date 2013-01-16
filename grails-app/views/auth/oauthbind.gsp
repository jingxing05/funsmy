<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="auth.oauthbind" /></title>
</head>
<body>
	<div class="row-fluid">
		<!-- 左边注册框 -->
		<section id="userregistinput" class="span6">
			<h3>欢迎  ${bind?.nick} 来到本站，感谢您将 @ ${bind.name}绑定到本站</h3>
			<g:form action="oauthbind" class="form-horizontal">
				<input type="hidden" name="targetUri" value="${targetUri}" />
				<input type="hidden" name="openid" value="${bind?.openid}" />
				<input type="hidden" name="name" value="${bind?.name}" />
				<div
					class="control-group ${hasErrors(bean: userInstance, field: 'email', 'error')}">
					<label class="control-label" for="email"><g:message
							code="user.email.label" /></label>
					<div class="controls">
						<input type="text" id="email" placeholder="如:girl@gmail.com"
							name="email" required=""
							value="${fieldValue(bean: userInstance, field: 'email')}">
						<span class="help-inline"><g:message
								code="user.email.label" /></span>
						<g:hasErrors bean="${userInstance}" field="email">
							<span class="help-block"> <g:renderErrors
									bean="${userInstance}" field="email" as="list" />
							</span>
						</g:hasErrors>
					</div>
				</div>

				<div
					class="control-group ${hasErrors(bean: userInstance, field: 'username', 'error')}">
					<label class="control-label" for="username"><g:message
							code="user.username.label" /></label>
					<div class="controls">
						<input type="text" id="username" placeholder="如:zengqingfeng"
							name="username" required=""
							value="${fieldValue(bean: userInstance, field: 'username')}">

						<span class="help-inline"><g:message
								code="user.username.blank.error" /></span>
						<g:hasErrors bean="${userInstance}" field="username">
							<span class="help-block"> <g:renderErrors
									bean="${userInstance}" field="username" as="list" />
							</span>
						</g:hasErrors>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="sex"><g:message
							code="user.sex.label" /></label>
					<div class="controls">
						<g:radio name="sex" value="0" checked="true" />
						女
						<g:radio name="sex" value="1" />
						男
					</div>
				</div>

				<div
					class="control-group ${hasErrors(bean: userInstance, field: 'passwordhash', 'error')}">
					<label class="control-label" for="passwordhash"><g:message
							code="user.passwordhash.label" /></label>
					<div class="controls">
						<input type="password" id="passwordhash" name="passwordhash"
							required=""> <span class="help-inline"><g:message
								code="user.passwordhash.nullable.error" /></span>
						<g:hasErrors bean="${userInstance}" field="passwordhash">
							<span class="help-block"> <g:renderErrors
									bean="${userInstance}" field="passwordhash" as="list" />
							</span>
						</g:hasErrors>
					</div>
				</div>

				<div
					class="control-group <g:if test="${repassworderror}"> error </g:if> ">
					<label class="control-label" for="repasswordhash"><g:message
							code="auth.repasswordhash.label" /></label>
					<div class="controls">
						<input type="password" id="repasswordhash" placeholder="再输入一遍"
							name="repasswordhash" required=""> <span
							class="help-inline"><g:message
								code="auth.repasswordhash.label" /></span> <span class="help-block">
							${repassworderror}
						</span>

					</div>
				</div>
				<div
					class="control-group <g:if test="${verifycodeerror}"> error </g:if>">
					<label class="control-label" for="verifycode"><g:message
							code="auth.verifycode.label" /></label>
					<div class="controls">

						<input type="text" id="verifycode" name="verifycode" required=""
							maxlength="4"> <span class="help-inline"><g:message
								code="auth.verifycode.infor" />: <b> ${session.verifycode}
						</b></span> <span class="help-block"> ${verifycodeerror}
						</span>
					</div>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary">
						<g:message code="auth.regist" />
					</button>
				</div>


			</g:form>
		</section>
		<section id="userregistinput" class="span6">
			<div class="hero-unit">
				<h3>绑定说明</h3>
				<p>腾讯微博帐号</p>
				<p>新浪微博帐号</p>
				<p>其他</p>
				<p>本站帐号之间的对应关系</p> 
			</div>
		</section>

	</div>
</body>
</html>
