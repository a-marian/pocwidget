<%@ page import="com.ar.play.PreviewTemplate" %>


<div class="fieldcontain ${hasErrors(bean: previewTemplateInstance, field: 'name', 'error')} ">
	<label for="name">
	<g:message code="previewTemplate.name.label" default="Name" />			
	</label>
	<g:select name="name" from="${previewTemplateInstance.constraints.name.inList}" value="${previewTemplateInstance?.name}" valueMessagePrefix="previewTemplate.name" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: previewTemplateInstance, field: 'name', 'error')} ">
    <p>Only register the name of template</p>
</div>