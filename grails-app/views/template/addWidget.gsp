<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'widget.label', default: 'Widget')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-widget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
	
		<div id="create-widget" class="content scaffold-create" role="main">
			<h1>Add Widget</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${widgetInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${widgetInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:widgetInstance, action:'saveWidget']" >
                               <g:hiddenField name="previewTemplate.id" value="${widgetInstance?.platform}" />
				<fieldset class="form">
					

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

				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>



