
<%@ page import="com.ar.play.PreviewTemplate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'previewTemplate.label', default: 'PreviewTemplate')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-previewTemplate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                  <fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Continuar')}" />
				</fieldset>
			</ul>
		</div>
		<div id="list-previewTemplate" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="chosen" title="${message(code: 'previewTemplate.chosen.label', default: 'Chosen')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'previewTemplate.name.label', default: 'Name')}" />
                                                <th>view Preview</th>
                                                    <th>Add Widget</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${previewTemplateInstanceList}" status="i" var="previewTemplateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						 <td style="vertical-align:middle;"><g:if test="${previewTemplateInstance.chosen}">Habilitada / <g:link action="changeEnabledState" id="${previewTemplateInstance.id}">Deshabilitar</g:link></g:if>
							<g:else>Deshabilitada/ <g:link  action="changeEnabledState" id="${previewTemplateInstance.id}">Habilitar</g:link></g:else></td>
					
						<td>${fieldValue(bean: previewTemplateInstance, field: "name")}</td>
                                               <td><g:link action="show" id="${previewTemplateInstance.id}">View Preview</g:link></td>
                                               <td><g:link controller="widget" action="create" params="['previewTemplate.id': previewTemplateInstance?.id]">Add Widgets</g:link></td>
                     
					</tr>
				</g:each>
				</tbody>
			</table>
                        
                      
			<div class="pagination">
				<g:paginate total="${previewTemplateInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
