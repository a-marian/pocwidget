
<%@ page import="com.ar.play.Template" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainFrontend">
		<g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
            <g:if test="${templateInstance}">
		<g:render template="${templateInstance?.name}"/>
                </g:if>
            <g:else>Template not config yet</g:else>
            
	</body>
</html>
