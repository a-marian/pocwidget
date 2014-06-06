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

<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'height', 'error')} required">
	<label for="height">
		<g:message code="widget.height.label" default="Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="height" type="number" value="${widgetInstance.height}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'template', 'error')} required">
	<label for="template">
		<g:message code="widget.template.label" default="Template" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="template" name="template.id" from="${com.ar.play.Template.list()}" optionKey="id" required="" value="${widgetInstance?.template?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'width', 'error')} required">
	<label for="width">
		<g:message code="widget.width.label" default="Width" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="width" type="number" value="${widgetInstance.width}" required=""/>

</div>

