<!doctype html>
<html>
	<head>
		<title>Grails Runtime Exception</title>
		<meta name="layout" content="${grailsApplication.config.skin.layout}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
	</head>
	<body>

    <g:render template="/layouts/header" />

		<g:renderException exception="${exception}" />
	</body>
</html>