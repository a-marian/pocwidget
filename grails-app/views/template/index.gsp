
<%@ page import="com.ar.play.Template" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainFrontend">
		<g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
            
		<g:render template="${templateInstance?.name}"/>

	</body>
</html>
