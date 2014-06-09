
<%@ page import="com.ar.play.Template" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-template" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-template" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list template">
			
				<g:if test="${templateInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="template.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${templateInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${templateInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="template.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${templateInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${templateInstance?.previewTemplate}">
				<li class="fieldcontain">
					<span id="previewTemplate-label" class="property-label"><g:message code="template.previewTemplate.label" default="Preview Template" /></span>
					
						<span class="property-value" aria-labelledby="previewTemplate-label"><g:link controller="previewTemplate" action="show" id="${templateInstance?.previewTemplate?.id}">${templateInstance?.previewTemplate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${templateInstance?.widgets}">
				<li class="fieldcontain">
					<span id="widgets-label" class="property-label"><g:message code="template.widgets.label" default="Widgets" /></span>
					
						<g:each in="${templateInstance.widgets}" var="w">
						<span class="property-value" aria-labelledby="widgets-label"><g:link controller="widget" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:templateInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${templateInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
