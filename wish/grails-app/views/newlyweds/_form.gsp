<%@ page import="wish.Newlyweds" %>



<div class="fieldcontain ${hasErrors(bean: newlywedsInstance, field: 'husband', 'error')} required">
	<label for="husband">
		<g:message code="newlyweds.husband.label" default="Husband" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="husband" maxlength="20" required="" value="${newlywedsInstance?.husband}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newlywedsInstance, field: 'wife', 'error')} required">
	<label for="wife">
		<g:message code="newlyweds.wife.label" default="Wife" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="wife" maxlength="20" required="" value="${newlywedsInstance?.wife}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newlywedsInstance, field: 'weddingtime', 'error')} required">
	<label for="weddingtime">
		<g:message code="newlyweds.weddingtime.label" default="Weddingtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="weddingtime" precision="day"  value="${newlywedsInstance?.weddingtime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: newlywedsInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="newlyweds.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" maxlength="100" required="" value="${newlywedsInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newlywedsInstance, field: 'memo', 'error')} required">
	<label for="memo">
		<g:message code="newlyweds.memo.label" default="Memo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="memo" required="" value="${newlywedsInstance?.memo}"/>
</div>

