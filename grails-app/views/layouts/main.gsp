<!DOCTYPE html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">	
		<r:require modules="bootstrap" module=""/>
		<r:require module="jquery"/>
		<r:require module="jquery-ui"/>
		<!-- g:javascript src="ext-jquery-ui.min.js" /-->
		<!-- link rel="stylesheet" href="${resource(dir: 'css', file: 'ext-jquery-ui.css')}" type="text/css"-->
		<g:layoutHead/>	
		<r:layoutResources />		 
		<g:javascript library="application"/>
	</head>
	<body>
		<g:layoutBody/>
		<r:layoutResources />
	</body>
</html>
