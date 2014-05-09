
<%@ page import="core.FootballMatch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'footballMatch.label', default: 'FootballMatch')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-footballMatch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-footballMatch" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list footballMatch">
			
				<g:if test="${footballMatchInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="footballMatch.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${footballMatchInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${footballMatchInstance?.home}">
				<li class="fieldcontain">
					<span id="home-label" class="property-label"><g:message code="footballMatch.home.label" default="Home" /></span>
					
						<span class="property-value" aria-labelledby="home-label"><g:fieldValue bean="${footballMatchInstance}" field="home"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${footballMatchInstance?.homeImage}">
				<li class="fieldcontain">
					<span id="homeImage-label" class="property-label"><g:message code="footballMatch.homeImage.label" default="Home Image" /></span>
					
						<span class="property-value" aria-labelledby="homeImage-label"><g:fieldValue bean="${footballMatchInstance}" field="homeImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${footballMatchInstance?.away}">
				<li class="fieldcontain">
					<span id="away-label" class="property-label"><g:message code="footballMatch.away.label" default="Away" /></span>
					
						<span class="property-value" aria-labelledby="away-label"><g:fieldValue bean="${footballMatchInstance}" field="away"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${footballMatchInstance?.awayImage}">
				<li class="fieldcontain">
					<span id="awayImage-label" class="property-label"><g:message code="footballMatch.awayImage.label" default="Away Image" /></span>
					
						<span class="property-value" aria-labelledby="awayImage-label"><g:fieldValue bean="${footballMatchInstance}" field="awayImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${footballMatchInstance?.belongDate}">
				<li class="fieldcontain">
					<span id="belongDate-label" class="property-label"><g:message code="footballMatch.belongDate.label" default="Belong Date" /></span>
					
						<span class="property-value" aria-labelledby="belongDate-label"><g:formatDate date="${footballMatchInstance?.belongDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${footballMatchInstance?.commentators}">
				<li class="fieldcontain">
					<span id="commentators-label" class="property-label"><g:message code="footballMatch.commentators.label" default="Commentators" /></span>
					
						<g:each in="${footballMatchInstance.commentators}" var="c">
						<span class="property-value" aria-labelledby="commentators-label"><g:link controller="commentator" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${footballMatchInstance?.matchFeedbacks}">
				<li class="fieldcontain">
					<span id="matchFeedbacks-label" class="property-label"><g:message code="footballMatch.matchFeedbacks.label" default="Match Feedbacks" /></span>
					
						<g:each in="${footballMatchInstance.matchFeedbacks}" var="m">
						<span class="property-value" aria-labelledby="matchFeedbacks-label"><g:link controller="matchFeedback" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${footballMatchInstance?.id}" />
					<g:link class="edit" action="edit" id="${footballMatchInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
