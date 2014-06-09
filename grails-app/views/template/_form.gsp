<%@ page import="com.ar.play.Template" %>



<div class="fieldcontain ${hasErrors(bean: templateInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="template.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${templateInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: templateInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="template.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${templateInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: templateInstance, field: 'previewTemplate', 'error')} required">
	<label for="previewTemplate">
		<g:message code="template.previewTemplate.label" default="Preview Template" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="previewTemplate" name="previewTemplate.id" from="${com.ar.play.PreviewTemplate.list()}" optionKey="id" required="" value="${templateInstance?.previewTemplate?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: templateInstance, field: 'widgets', 'error')} ">
	<label for="widgets">
		<g:message code="template.widgets.label" default="Widgets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${templateInstance?.widgets?}" var="w">
    <li><g:link controller="widget" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="widget" action="create" params="['template.id': templateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'widget.label', default: 'Widget')])}</g:link>
</li>
</ul>


</div>

