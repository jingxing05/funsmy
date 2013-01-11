<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>${grailsApplication.config.site.infor.name}</title>
</head> 
<body>
	<div class="row-fluid">
		<aside id="application-status" class="span3">
			<div class="well sidebar-nav">
				<h5>应用状态</h5>
				<ul>
					<li>App version: <g:meta name="app.version" /></li>
					<li>Grails version: <g:meta name="app.grails.version" /></li>
					<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
					<li>JVM version: ${System.getProperty('java.version')}</li>
					<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
					<li>Domains: ${grailsApplication.domainClasses.size()}</li>
					<li>Services: ${grailsApplication.serviceClasses.size()}</li>
					<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
				</ul>
				<h5>已安装插件</h5>
				<ul>
					<g:each var="plugin"
						in="${applicationContext.getBean('pluginManager').allPlugins}">
						<li>
							${plugin.name} - ${plugin.version}
						</li>
					</g:each>
				</ul>
			</div>
		</aside>

		<section id="main" class="span9">

			<div class="hero-unit">
				<h1>欢迎来到${grailsApplication.config.site.infor.name}</h1>

				<p>
					Grails scaffolding with a  
					<em>Twitter
							Bootstrap</em> look &amp; feel?
				</p>

				<p>
					系统总体概览
				</p>
			</div>

			<div class="row-fluid">

				<div class="span12">
					<h2>控制器概览</h2>
					<p>下列控制器入口可以访问</p>
					<ul class="nav nav-list">
						<g:each var="c"
							in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<li><g:link controller="${c.logicalPropertyName}">
									${c.naturalName}
								</g:link></li>
						</g:each>
					</ul>
				</div> 
			</div> 
		</section>
	</div>
</body>
</html>
