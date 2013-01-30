<%@ page import="wish.Wish" %>



<div class="fieldcontain ${hasErrors(bean: wishInstance, field: 'fromwho', 'error')} required">
	<label for="fromwho">
		<g:message code="wish.fromwho.label" default="Fromwho" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fromwho" maxlength="20" required="" value="${wishInstance?.fromwho}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wishInstance, field: 'newlyweds', 'error')} required">
	<label for="newlyweds">
		<g:message code="wish.newlyweds.label" default="Newlyweds" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="newlyweds" name="newlyweds.id" from="${wish.Newlyweds.list()}" optionKey="id" required="" value="${wishInstance?.newlyweds?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wishInstance, field: 'toname', 'error')} required">
	<label for="toname">
		<g:message code="wish.toname.label" default="Toname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="toname" maxlength="40" required="" value="${wishInstance?.toname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wishInstance, field: 'wish', 'error')} required">
	<label for="wish">
		<g:message code="wish.wish.label" default="Wish" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="wish" maxlength="140" required="" value="${wishInstance?.wish}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wishInstance, field: 'createTime', 'error')} required">
	<label for="createTime">
		<g:message code="wish.createTime.label" default="Create Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createTime" precision="day"  value="${wishInstance?.createTime}"  />
</div>

