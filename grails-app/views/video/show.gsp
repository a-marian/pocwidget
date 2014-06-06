
<%@ page import="com.ar.play.Video" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'video.label', default: 'Video')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-video" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-video" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list video">
			
				<g:if test="${videoInstance?.videoId}">
				<li class="fieldcontain">
					<span id="videoId-label" class="property-label"><g:message code="video.videoId.label" default="Video Id" /></span>
					
						<span class="property-value" aria-labelledby="videoId-label"><g:fieldValue bean="${videoInstance}" field="videoId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${videoInstance?.height}">
				<li class="fieldcontain">
					<span id="height-label" class="property-label"><g:message code="video.height.label" default="Height" /></span>
					
						<span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${videoInstance}" field="height"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${videoInstance?.widget}">
				<li class="fieldcontain">
					<span id="widget-label" class="property-label"><g:message code="video.widget.label" default="Widget" /></span>
					
						<span class="property-value" aria-labelledby="widget-label"><g:link controller="widget" action="show" id="${videoInstance?.widget?.id}">${videoInstance?.widget?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${videoInstance?.width}">
				<li class="fieldcontain">
					<span id="width-label" class="property-label"><g:message code="video.width.label" default="Width" /></span>
					
						<span class="property-value" aria-labelledby="width-label"><g:fieldValue bean="${videoInstance}" field="width"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:videoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${videoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
