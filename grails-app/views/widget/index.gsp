
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
					
						<g:sortableColumn property="height" title="${message(code: 'widget.height.label', default: 'Height')}" />
					
						<th><g:message code="widget.template.label" default="Template" /></th>
					
						<g:sortableColumn property="width" title="${message(code: 'widget.width.label', default: 'Width')}" />
                                                <th>Editar</th>
                                                <th>Eliminar</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${widgetInstanceList}" status="i" var="widgetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: widgetInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: widgetInstance, field: "platform")}</td>
					
						<td>${fieldValue(bean: widgetInstance, field: "videoId")}</td>
					
						<td>${fieldValue(bean: widgetInstance, field: "height")}</td>
					
						<td>${fieldValue(bean: widgetInstance, field: "template")}</td>
					
						<td>${fieldValue(bean: widgetInstance, field: "width")}</td>
                                                <td><g:link action="edit" id="${widgetInstance.id}">edit</g:link></td>
					
                                                <td><g:link action="delete" id="${widgetInstance.id}">delete</g:link></td>
					
					
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
