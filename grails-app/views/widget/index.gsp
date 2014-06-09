
<%@ page import="com.ar.play.Widget" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'widget.label', default: 'Widget')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-widget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-widget" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="type" title="${message(code: 'widget.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="platform" title="${message(code: 'widget.platform.label', default: 'Platform')}" />
					
						<g:sortableColumn property="videoId" title="${message(code: 'widget.videoId.label', default: 'Video Id')}" />
					
						<th><g:message code="widget.previewtemplate.label" default="Previewtemplate" /></th>
					
						<g:sortableColumn property="publishPreview" title="${message(code: 'widget.publishPreview.label', default: 'Publish Preview')}" />
					
						<g:sortableColumn property="publishProd" title="${message(code: 'widget.publishProd.label', default: 'Publish Prod')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${widgetInstanceList}" status="i" var="widgetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${widgetInstance.id}">${fieldValue(bean: widgetInstance, field: "type")}</g:link></td>
					
						<td>${fieldValue(bean: widgetInstance, field: "platform")}</td>
					
						<td>${fieldValue(bean: widgetInstance, field: "videoId")}</td>
					
						<td>${fieldValue(bean: widgetInstance, field: "previewTemplate")}</td>
					
						<td><g:formatBoolean boolean="${widgetInstance.publishPreview}" /></td>
					
						<td><g:formatBoolean boolean="${widgetInstance.publishProd}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${widgetInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
