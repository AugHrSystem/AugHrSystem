<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 class="modal-title"><spring:message code="label.report" /><spring:message code="menu.benefit" /></h4>
</div>
<f:form method="post" name="reportForm" target="_blank" commandName="benefit" action="${pageContext.request.contextPath}/benefit/searchReport" cssClass="form-horizontal">

	 <div class="modal-body">
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        		<spring:message code="label.search" var="searchfor" /> <spring:message code="menu.position" var="entity" />
        		${ searchfor }${ entity }
        	</div>
        	<div class="col-sm-6">
        		<f:input path="name" cssClass="form-control" placeholder="${ searchfor }${ entity }"/>
        	</div>
        </div>
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	<spring:message code="label.orderby"/>
        	</div>
        	<div class="col-sm-6">
        		<f:select path="sortingBy" cssClass="form-control">
        			
        			<f:option value="position"><spring:message code="menu.position"/></f:option>
        			
        		</f:select>
        	</div>
        </div>
        
         <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	<spring:message code="label.doctype"/>
        	</div>
        	<div class="col-sm-6">
        		<label class="radio-inline"><f:radiobutton  path="reportType" value="pdf"/>Pdf</label>
				<label class="radio-inline"><f:radiobutton path="reportType" value="xls"/>Xls</label>
        	</div>
        </div>
      	
      </div>

	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="label.close"/></button>
		<button type="button" class="btn btn-default submit" value="search"><spring:message code="label.search" /></button>
	</div>
</f:form>
<script type="text/javascript">
	$(document).ready(function() {
		$(".submit").click(function() {
			$("form[name='reportForm']").submit();
			$("#reportModal").modal("hide");
		});
	});
</script> --%>