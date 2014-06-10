
<%@ page import="com.ar.play.Widget" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'widget.label', default: 'Widget')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-widget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-widget" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list widget">
			
				<g:if test="${widgetInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="widget.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${widgetInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${widgetInstance?.platform}">
				<li class="fieldcontain">
					<span id="platform-label" class="property-label"><g:message code="widget.platform.label" default="Platform" /></span>
					
						<span class="property-value" aria-labelledby="platform-label"><g:fieldValue bean="${widgetInstance}" field="platform"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${widgetInstance?.videoId}">
				<li class="fieldcontain">
					<span id="videoId-label" class="property-label"><g:message code="widget.videoId.label" default="Video Id" /></span>
					
						<span class="property-value" aria-labelledby="videoId-label"><g:fieldValue bean="${widgetInstance}" field="videoId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${widgetInstance?.previewTemplate}">
				<li class="fieldcontain">
					<span id="previewTemplate-label" class="property-label"><g:message code="widget.previewTemplate.label" default="PreviewTemplate" /></span>
					
					
				</li>
				</g:if>
			
				<g:if test="${widgetInstance?.publishPreview}">
				<li class="fieldcontain">
					<span id="publishPreview-label" class="property-label"><g:message code="widget.publishPreview.label" default="Publish Preview" /></span>
					
						<span class="property-value" aria-labelledby="publishPreview-label"><g:formatBoolean boolean="${widgetInstance?.publishPreview}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${widgetInstance?.publishProd}">
				<li class="fieldcontain">
					<span id="publishProd-label" class="property-label"><g:message code="widget.publishProd.label" default="Publish Prod" /></span>
					
						<span class="property-value" aria-labelledby="publishProd-label"><g:formatBoolean boolean="${widgetInstance?.publishProd}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${widgetInstance?.template}">
				<li class="fieldcontain">
					<span id="template-label" class="property-label"><g:message code="widget.template.label" default="Template" /></span>
					
						<span class="property-value" aria-labelledby="template-label"><g:link controller="template" action="show" id="${widgetInstance?.template?.id}">${widgetInstance?.template?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:widgetInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${widgetInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
