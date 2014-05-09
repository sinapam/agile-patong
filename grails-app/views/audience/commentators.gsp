<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'commentator.label', default: 'Commentator')}" />
		<title></title>
	</head>
	<body>
		<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table class="table table-bordered">
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'commentator.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="channel" title="${message(code: 'commentator.channel.label', default: 'Channel')}" />
					
						<g:sortableColumn property="age" title="${message(code: 'commentator.age.label', default: 'Age')}" />
					
						<g:sortableColumn property="detail" title="${message(code: 'commentator.detail.label', default: 'Detail')}" />
						
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${commentatorInstanceList}" status="i" var="commentatorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${commentatorInstance.id}">${fieldValue(bean: commentatorInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: commentatorInstance, field: "channel")}</td>
					
						<td>${fieldValue(bean: commentatorInstance, field: "age")}</td>
					
						<td>${fieldValue(bean: commentatorInstance, field: "detail")}</td>
						
						<td>
							<g:link action="profile" ><span class="glyphicon glyphicon-comment"></span></g:link>
						</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			
	</body>
</html>
