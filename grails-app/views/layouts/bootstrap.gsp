<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle
		default="${grailsApplication.config.site.infor.name}" /></title>
<meta name="description"
	content="${grailsApplication.config.site.infor.description}">
<meta name="keywords"
	content="${grailsApplication.config.site.infor.keywords}">
<meta name="author" content="庆峰">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
	
<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<r:require modules="bootstrap" />
<g:layoutHead />
<r:layoutResources />
</head>
<body>

	<g:render template="/layouts/header" />

	<div class="container-fluid">
		<g:layoutBody /> 
	</div>

	<g:render template="/layouts/footer" />


	<g:javascript library="application" />
	<r:layoutResources />
</body>
</html>
