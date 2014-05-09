<%@ page import="core.Commentator" %>



<div class="fieldcontain ${hasErrors(bean: commentatorInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="commentator.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${commentatorInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentatorInstance, field: 'channel', 'error')} ">
	<label for="channel">
		<g:message code="commentator.channel.label" default="Channel" />
		
	</label>
	<g:textField name="channel" value="${commentatorInstance?.channel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentatorInstance, field: 'age', 'error')} ">
	<label for="age">
		<g:message code="commentator.age.label" default="Age" />
		
	</label>
	<g:field name="age" type="number" value="${commentatorInstance.age}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentatorInstance, field: 'detail', 'error')} ">
	<label for="detail">
		<g:message code="commentator.detail.label" default="Detail" />
		
	</label>
	<g:textField name="detail" value="${commentatorInstance?.detail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentatorInstance, field: 'feedbacks', 'error')} ">
	<label for="feedbacks">
		<g:message code="commentator.feedbacks.label" default="Feedbacks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${commentatorInstance?.feedbacks?}" var="f">
    <li><g:link controller="feedback" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="feedback" action="create" params="['commentator.id': commentatorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'feedback.label', default: 'Feedback')])}</g:link>
</li>
</ul>

</div>

