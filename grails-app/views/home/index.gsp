<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'commentator.label', default: 'Commentator')}" />
		<title>Choose your role</title>
	</head>
	<body>
		
		<div class="col-md-4"  >
		<h3>View as a </h3>
		<div>	
		<g:link action="index" controller="audience" class="btn btn-default btn-lg btn-block">Audience</g:link>
		<g:link action="index" controller="audience" class="btn btn-default btn-lg btn-block">Commetator</g:link>
		<g:link action="index" controller="commentator" class="btn btn-default btn-lg btn-block">Admin</button>
		</g:link>	
	</body>
</html>
