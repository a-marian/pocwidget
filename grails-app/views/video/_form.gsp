<%@ page import="com.ar.play.Video" %>



<div class="fieldcontain ${hasErrors(bean: videoInstance, field: 'videoId', 'error')} ">
	<label for="videoId">
		<g:message code="video.videoId.label" default="Video Id" />
		
	</label>
	<g:textField name="videoId" pattern="${videoInstance.constraints.videoId.matches}" value="${videoInstance?.videoId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: videoInstance, field: 'height', 'error')} required">
	<label for="height">
		<g:message code="video.height.label" default="Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="height" type="number" value="${videoInstance.height}" required=""/>

</div>



<div class="fieldcontain ${hasErrors(bean: videoInstance, field: 'width', 'error')} required">
	<label for="width">
		<g:message code="video.width.label" default="Width" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="width" type="number" value="${videoInstance.width}" required=""/>

</div>

