<%@ page import="com.ar.play.Template" %>



<div class="fieldcontain ${hasErrors(bean: templateInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="template.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${templateInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: templateInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="template.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${templateInstance?.name}"/>

</div>



