<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="auth.oauthbind.title" /></title>
</head>
<body>
	<div class="row-fluid">
		<!-- 左边注册框 -->
		<section id="userregistinput" class="span6">
			<g:if test="${flash.message}">
				<bootstrap:alert class="alert-error">
					${flash.message}
				</bootstrap:alert>
			</g:if>

			<h3>
				欢迎您
				${bind?.nick}
				来到本站，就差绑定一下啦^_^
			</h3>
			<h4>
				将 
				${oauthalias} 帐号   @
				${bind?.name} 
				绑定到您登录本站的电子邮箱:
			</h4>
			<g:form action="oauthbind" class="form-horizontal">
				<input type="hidden" name="targetUri" value="${targetUri}" />
				<input type="hidden" name="openid" value="${bind?.openid}" />
				<input type="hidden" name="name" value="${bind?.name}" />
				<div class="control-group  ">
					 
					<div class="controls">
						<input type="text" id="email" placeholder="电子邮箱"
							name="email"  title=''
							value="${userinput?.email}">
						<span class="help-block">如有本站登录邮箱，请输入该邮箱<br />没有本站登录邮箱，会用输入的邮箱自动注册 </span> 
					</div>
				</div>   
				<div class="form-actions">
					<button type="submit" class="btn btn-primary">
						<g:message code="auth.oauthbind.submit" />
					</button>
				</div>


			</g:form>
		</section>
		<section id="userregistinput" class="span6">
			<div class="hero-unit">
				<h2>绑定说明</h2>
				<p>如果您有本站电子邮箱帐号，请输入之与 ${oauthalias} 帐号绑定</p>
				<p>如果没有，我们会用您输入的邮箱自动注册为本站用户并与该 ${oauthalias} 帐号绑定 </p>
				<p>绑定后您就可以用这个邮箱    或  ${oauthalias} 帐号 登录本站</p>
				<p>我们力求注册方便简洁</p>
			</div>
		</section>

	</div>
</body>
</html>
