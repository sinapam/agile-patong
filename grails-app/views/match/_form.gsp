<%@ page import="core.Match" %>



<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="match.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${matchInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'home', 'error')} ">
	<label for="home">
		<g:message code="match.home.label" default="Home" />
		
	</label>
	<g:textField name="home" value="${matchInstance?.home}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'homeImage', 'error')} ">
	<label for="homeImage">
		<g:message code="match.homeImage.label" default="Home Image" />
		
	</label>
	<g:textField name="homeImage" value="${matchInstance?.homeImage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'away', 'error')} ">
	<label for="away">
		<g:message code="match.away.label" default="Away" />
		
	</label>
	<g:textField name="away" value="${matchInstance?.away}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'awayImage', 'error')} ">
	<label for="awayImage">
		<g:message code="match.awayImage.label" default="Away Image" />
		
	</label>
	<g:textField name="awayImage" value="${matchInstance?.awayImage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'belongDate', 'error')} required">
	<label for="belongDate">
		<g:message code="match.belongDate.label" default="Belong Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="belongDate" precision="day"  value="${matchInstance?.belongDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'commentators', 'error')} ">
	<label for="commentators">
		<g:message code="match.commentators.label" default="Commentators" />
		
	</label>
	<g:select name="commentators" from="${core.Commentator.list()}" multiple="multiple" optionKey="id" size="5" value="${matchInstance?.commentators*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'matchFeedbacks', 'error')} ">
	<label for="matchFeedbacks">
		<g:message code="match.matchFeedbacks.label" default="Match Feedbacks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${matchInstance?.matchFeedbacks?}" var="m">
    <li><g:link controller="matchFeedback" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="matchFeedback" action="create" params="['match.id': matchInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'matchFeedback.label', default: 'MatchFeedback')])}</g:link>
</li>
</ul>

</div>

