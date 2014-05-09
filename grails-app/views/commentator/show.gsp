
<%@ page import="core.Commentator" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'commentator.label', default: 'Commentator')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-commentator" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-commentator" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list commentator">
			
				<g:if test="${commentatorInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="commentator.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${commentatorInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentatorInstance?.channel}">
				<li class="fieldcontain">
					<span id="channel-label" class="property-label"><g:message code="commentator.channel.label" default="Channel" /></span>
					
						<span class="property-value" aria-labelledby="channel-label"><g:fieldValue bean="${commentatorInstance}" field="channel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentatorInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="commentator.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${commentatorInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentatorInstance?.detail}">
				<li class="fieldcontain">
					<span id="detail-label" class="property-label"><g:message code="commentator.detail.label" default="Detail" /></span>
					
						<span class="property-value" aria-labelledby="detail-label"><g:fieldValue bean="${commentatorInstance}" field="detail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentatorInstance?.feedbacks}">
				<li class="fieldcontain">
					<span id="feedbacks-label" class="property-label"><g:message code="commentator.feedbacks.label" default="Feedbacks" /></span>
					
						<g:each in="${commentatorInstance.feedbacks}" var="f">
						<span class="property-value" aria-labelledby="feedbacks-label"><g:link controller="feedback" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${commentatorInstance?.id}" />
					<g:link class="edit" action="edit" id="${commentatorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
