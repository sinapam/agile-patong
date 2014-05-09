<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="audience">
		<g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<h2><g:message code="default.list.label" args="[entityName]" /></h2>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table class="table table-bordered">
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'match.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="home" title="${message(code: 'match.home.label', default: 'Home')}" />

						<th><g:message code="match.vs.label" default="VS"/></th>
					
						<g:sortableColumn property="away" title="${message(code: 'match.away.label', default: 'Away')}" />
						
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${matchs}" status="i" var="match">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${match.id}">${fieldValue(bean: match, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: match, field: "home")}</td>
						
						<td><g:message code="match.vs.label" default="VS"/></td>

						<td>${fieldValue(bean: match, field: "away")}</td>
						
						<td>
							<g:link action="show" id="${match.id}" >comment</g:link>
						</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			
	</body>
</html>
