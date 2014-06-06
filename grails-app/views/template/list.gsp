
<%@ page import="com.ar.play.Template" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-template" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-template" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="enabled" title="${message(code: 'template.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'template.name.label', default: 'Name')}" />
                                                <th>Preview vieW</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${templateInstanceList}" status="i" var="templateInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        <td style="vertical-align:middle;"><g:if test="${templateInstance.enabled}">Habilitada / <g:link action="changeEnabledState" id="${templateInstance.id}">Deshabilitar</g:link></g:if>
							<g:else>Deshabilitada/ <g:link  action="changeEnabledState" id="${templateInstance.id}">Habilitar</g:link></g:else></td>
						
					
						<td>${fieldValue(bean: templateInstance, field: "name")}</td>
                                                <td><a href="http://localhost:8080/pocwidget/templates/${fieldValue(bean: templateInstance, field: "name")}/" target="_blank"/> Vista Previa</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${templateInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
