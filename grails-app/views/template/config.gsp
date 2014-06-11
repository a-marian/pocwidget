
<%@ page import="com.ar.play.Widget" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'widget.label', default: 'Template')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-widget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
	
		<div id="list-widget" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
                            <ul id="container">
				<g:each in="${widgets}" status="i" var="widgetInstance">
				<li><g:link class="element" action="editYoutube" id="${widgetInstance.id}">${widgetInstance.platform}</g:link></li>		
				</g:each>			
                                </ul>
                                <br />
                                   <g:link class="element" action="addWidget" id="${templateInstance.id}">Add Widget</g:link> 
                                <br />                                
                           <fieldset class="buttons">
                            	<g:form url="[action:'passToProd']" >
                                <g:hiddenField name="id" value="${templateInstance.id}"/>
				<g:link controller="previewTemplate" action="show" target="_blank" id="${templateInstance.previewTemplate.id}">View Preview</g:link>
                                <g:actionSubmit action="passToProd"  value="Pass to PROD" />
                               </g:form>
				
				</fieldset>
			<div class="pagination">
				<g:paginate total="${widgetInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
