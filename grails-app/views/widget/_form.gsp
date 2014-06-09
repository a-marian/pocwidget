<%@ page import="com.ar.play.Widget" %>



<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="widget.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${widgetInstance.constraints.type.inList}" value="${widgetInstance?.type}" valueMessagePrefix="widget.type" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'platform', 'error')} ">
	<label for="platform">
		<g:message code="widget.platform.label" default="Platform" />
		
	</label>
	<g:select name="platform" from="${widgetInstance.constraints.platform.inList}" value="${widgetInstance?.platform}" valueMessagePrefix="widget.platform" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'videoId', 'error')} ">
	<label for="videoId">
		<g:message code="widget.videoId.label" default="Video Id" />
		
	</label>
	<g:textField name="videoId" pattern="${widgetInstance.constraints.videoId.matches}" value="${widgetInstance?.videoId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'previewTemplate', 'error')} required">
	<label for="previewTemplate">
            <g:message code="widget.previewTemplate.label" default="PreviewTemplate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="previewtemplate" name="previewTemplate.id" from="${com.ar.play.PreviewTemplate.list()}" optionKey="id" required="" value="${widgetInstance?.previewTemplate?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'publishPreview', 'error')} ">
	<label for="publishPreview">
		<g:message code="widget.publishPreview.label" default="Publish Preview" />
		
	</label>
	<g:checkBox name="publishPreview" value="${widgetInstance?.publishPreview}" />

</div>

<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'publishProd', 'error')} ">
	<label for="publishProd">
		<g:message code="widget.publishProd.label" default="Publish Prod" />
		
	</label>
	<g:checkBox name="publishProd" value="${widgetInstance?.publishProd}" />

</div>

<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'template', 'error')} required">
	<label for="template">
		<g:message code="widget.template.label" default="Template" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="template" name="template.id" from="${com.ar.play.Template.list()}" optionKey="id" required="" value="${widgetInstance?.template?.id}" class="many-to-one"/>

</div>

