<%@ page import="core.FootballMatch" %>



<div class="fieldcontain ${hasErrors(bean: footballMatchInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="footballMatch.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${footballMatchInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: footballMatchInstance, field: 'home', 'error')} ">
	<label for="home">
		<g:message code="footballMatch.home.label" default="Home" />
		
	</label>
	<g:textField name="home" value="${footballMatchInstance?.home}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: footballMatchInstance, field: 'homeImage', 'error')} ">
	<label for="homeImage">
		<g:message code="footballMatch.homeImage.label" default="Home Image" />
		
	</label>
	<g:textField name="homeImage" value="${footballMatchInstance?.homeImage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: footballMatchInstance, field: 'away', 'error')} ">
	<label for="away">
		<g:message code="footballMatch.away.label" default="Away" />
		
	</label>
	<g:textField name="away" value="${footballMatchInstance?.away}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: footballMatchInstance, field: 'awayImage', 'error')} ">
	<label for="awayImage">
		<g:message code="footballMatch.awayImage.label" default="Away Image" />
		
	</label>
	<g:textField name="awayImage" value="${footballMatchInstance?.awayImage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: footballMatchInstance, field: 'belongDate', 'error')} required">
	<label for="belongDate">
		<g:message code="footballMatch.belongDate.label" default="Belong Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="belongDate" precision="day"  value="${footballMatchInstance?.belongDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: footballMatchInstance, field: 'commentators', 'error')} ">
	<label for="commentators">
		<g:message code="footballMatch.commentators.label" default="Commentators" />
		
	</label>
	<g:select name="commentators" from="${core.Commentator.list()}" multiple="multiple" optionKey="id" size="5" value="${footballMatchInstance?.commentators*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: footballMatchInstance, field: 'matchFeedbacks', 'error')} ">
	<label for="matchFeedbacks">
		<g:message code="footballMatch.matchFeedbacks.label" default="Match Feedbacks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${footballMatchInstance?.matchFeedbacks?}" var="m">
    <li><g:link controller="matchFeedback" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="matchFeedback" action="create" params="['footballMatch.id': footballMatchInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'matchFeedback.label', default: 'MatchFeedback')])}</g:link>
</li>
</ul>

</div>

