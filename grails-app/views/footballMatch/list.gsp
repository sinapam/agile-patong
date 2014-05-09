
<%@ page import="core.FootballMatch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'footballMatch.label', default: 'FootballMatch')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-footballMatch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-footballMatch" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'footballMatch.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="home" title="${message(code: 'footballMatch.home.label', default: 'Home')}" />
					
						<g:sortableColumn property="homeImage" title="${message(code: 'footballMatch.homeImage.label', default: 'Home Image')}" />
					
						<g:sortableColumn property="away" title="${message(code: 'footballMatch.away.label', default: 'Away')}" />
					
						<g:sortableColumn property="awayImage" title="${message(code: 'footballMatch.awayImage.label', default: 'Away Image')}" />
					
						<g:sortableColumn property="belongDate" title="${message(code: 'footballMatch.belongDate.label', default: 'Belong Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${footballMatchInstanceList}" status="i" var="footballMatchInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${footballMatchInstance.id}">${fieldValue(bean: footballMatchInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: footballMatchInstance, field: "home")}</td>
					
						<td>${fieldValue(bean: footballMatchInstance, field: "homeImage")}</td>
					
						<td>${fieldValue(bean: footballMatchInstance, field: "away")}</td>
					
						<td>${fieldValue(bean: footballMatchInstance, field: "awayImage")}</td>
					
						<td><g:formatDate date="${footballMatchInstance.belongDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${footballMatchInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
