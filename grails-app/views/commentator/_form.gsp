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

<div class="fieldcontain ${hasErrors(bean: commentatorInstance, field: 'imageUrl', 'error')} ">
	<label for="imageUrl">
		<g:message code="commentator.imageUrl.label" default="ImageUrl" />
		
	</label>
	<g:textField name="imageUrl" value="${commentatorInstance?.imageUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentatorInstance, field: 'detail', 'error')} ">
	<label for="detail">
		<g:message code="commentator.detail.label" default="Detail" />
		
	</label>
	<g:textField name="detail" value="${commentatorInstance?.detail}"/>
</div>

