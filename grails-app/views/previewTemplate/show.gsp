
<%@ page import="com.ar.play.PreviewTemplate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainFrontend">
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
			<g:render template="prev${previewTemplateInstance?.name}"/>
	</body>
</html>
