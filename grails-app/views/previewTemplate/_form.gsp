<%@ page import="com.ar.play.PreviewTemplate" %>



<div class="fieldcontain ${hasErrors(bean: previewTemplateInstance, field: 'chosen', 'error')} ">
	<label for="chosen">
		<g:message code="previewTemplate.chosen.label" default="Chosen" />
		
	</label>
	<g:checkBox name="chosen" value="${previewTemplateInstance?.chosen}" />

</div>

<div class="fieldcontain ${hasErrors(bean: previewTemplateInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="previewTemplate.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${previewTemplateInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: previewTemplateInstance, field: 'widget', 'error')} ">
	<label for="widget">
		<g:message code="previewTemplate.widget.label" default="Widget" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${previewTemplateInstance?.widget?}" var="w" >
    <li><g:link controller="widget" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="widget" action="create" params="['previewTemplate.id': previewTemplateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'widget.label', default: 'Widget')])}</g:link>
</li>
</ul>


</div>

