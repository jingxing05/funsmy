<div class="row-fluid">
	<div class="span6">
		<h2>
			<g:message code="auth.openidlogin" />
		</h2>
		<p>
			<g:message code="auth.openidlogininfor" />
		</p>
		<ul class="nav nav-list">
			<g:each var="c" in="${grailsApplication.config.oauth.providers}">
				<li><h2>
						<oauth:connect provider="${c.key}" title="${c.value.alias}">
							${c.value.alias}
						</oauth:connect>
						<small> 帐号</small>
					</h2></li>
			</g:each>
		</ul>
	</div>
</div>