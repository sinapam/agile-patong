
<%@ page import="core.Match" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-match" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-match" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list match">
			
				<g:if test="${matchInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="match.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${matchInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${matchInstance?.home}">
				<li class="fieldcontain">
					<span id="home-label" class="property-label"><g:message code="match.home.label" default="Home" /></span>
					
						<span class="property-value" aria-labelledby="home-label"><g:fieldValue bean="${matchInstance}" field="home"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${matchInstance?.away}">
				<li class="fieldcontain">
					<span id="away-label" class="property-label"><g:message code="match.away.label" default="Away" /></span>
					
						<span class="property-value" aria-labelledby="away-label"><g:fieldValue bean="${matchInstance}" field="away"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${matchInstance?.belongDate}">
				<li class="fieldcontain">
					<span id="belongDate-label" class="property-label"><g:message code="match.belongDate.label" default="Belong Date" /></span>
					
						<span class="property-value" aria-labelledby="belongDate-label"><g:formatDate date="${matchInstance?.belongDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${matchInstance?.commentators}">
				<li class="fieldcontain">
					<span id="commentators-label" class="property-label"><g:message code="match.commentators.label" default="Commentators" /></span>
					
						<g:each in="${matchInstance.commentators}" var="c">
						<span class="property-value" aria-labelledby="commentators-label"><g:link controller="commentator" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${matchInstance?.matchFeedbacks}">
				<li class="fieldcontain">
					<span id="matchFeedbacks-label" class="property-label"><g:message code="match.matchFeedbacks.label" default="Match Feedbacks" /></span>
					
						<g:each in="${matchInstance.matchFeedbacks}" var="m">
						<span class="property-value" aria-labelledby="matchFeedbacks-label"><g:link controller="matchFeedback" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${matchInstance?.id}" />
					<g:link class="edit" action="edit" id="${matchInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
