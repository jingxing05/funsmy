<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="bootstrap" />
<title><g:message code="auth.regist" /></title>
</head>
<body>
	<g:if test="${flash.message}">
		<div class="message">
			${flash.message}
		</div>
	</g:if>

	<div class="row-fluid">
		<!-- 左边注册框 -->
		<aside id="userregistinput" class="span6">
			<g:form action="doreg" class="form-horizontal">
				<input type="hidden" name="targetUri" value="${targetUri}" />
				<div class="control-group">
					<label class="control-label" for="inputemail"><g:message
							code="user.email" /></label>
					<div class="controls">
						<input type="text" id="inputEmail" placeholder="girl@gmail.com"
							name="email">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="inputusername"><g:message
							code="user.username" /></label>
					<div class="controls">
						<input type="text" id="inputusername" placeholder="<g:message code="auth.regform.username" />"
							name="username">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="inputpassword"><g:message
							code="user.passwordhash" /></label>
					<div class="controls">
						<input type="password" id="inputpassword" placeholder="<g:message code="auth.regform.password" />"
							name="password">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="inputrepassword"><g:message
							code="auth.repasswordhash" /></label>
					<div class="controls">
						<input type="text" id="inputrepassword" placeholder="<g:message code="auth.regform.repassword" />"
							name="repassword">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="inputverify"><g:message
							code="auth.verifycode" /></label>
					<div class="controls">
						<button type="submit" class="btn"><g:message code="auth.regist" /></button>
					</div>
				</div>
			</g:form> 
		</aside>
		<!-- 右边是外站快速登录方式 -->
		<section id="opensitequicklogin" class="span6"> 
			<div class="row-fluid"> 
				<div class="span12">
					<h2><g:message code="auth.openidlogin" /></h2>
					<p><g:message code="auth.openidlogininfor" /></p>
					<ul class="nav nav-list">
						<g:each var="c"
							in="${platforms}">
							<li><a href="${c.oauthuri}" title="">
									${c.alias}
								</a></li>
						</g:each>
						<li>
						<oauth:connect provider="qqt">腾讯微博</oauth:connect>
						</li>
						
					</ul>
				</div>
			</div>
		</section>
	</div>
</body>
</html>
