<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'previewTemplate.label', default: 'PreviewTemplate')}" />
		<title>PLAY</title>
	</head>
	<body>
		<a href="#create-previewTemplate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="create-previewTemplate" class="content scaffold-create" role="main">
			<h1>Choose template for Frontend:</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${previewTemplateInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${previewTemplateInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[action:'saveConfigFronted']" >
				<fieldset class="form">
				    <div class="fieldcontain ${hasErrors(bean: previewTemplateInstance, field: 'name', 'error')} ">
                                        <label for="name">
                                            <g:message code="previewTemplate.name.label" default="Name" />			
                                        </label>
                                        <g:select id="name" name='name' value="${previewTemplateInstance.name}" from='${previewTemplateInstance.name}' />
                                    </div>
                                    </div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="continuar" value="Continuar" />
				</fieldset>
			</g:form>
		</div> 
	</body>
</html>
