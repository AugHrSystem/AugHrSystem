<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../employeeMenu.jsp"></jsp:include>
<f:form method="post" commandName="report" class="form-horizontal" role="form">
	 <div class="modal-body">
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Search
        		${ searchfor }${ entity }
        	</div>
        	<div class="col-sm-6">
        		<f:input path="name" cssClass="form-control" placeholder="${ searchfor }${ entity }"/>
        	</div>
        </div>
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Order By
        	</div>
        	<div class="col-sm-6">
        		<f:select path="sortingBy" cssClass="form-control">
        			<f:option value="employeeCode">Employee Code</f:option>
        		</f:select>
        	</div>
        </div>
        
         <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Document Type
        	</div>
        	<div class="col-sm-6">
        		<label class="radio-inline"><f:radiobutton  path="reportType" value="pdf"/>Pdf</label>
				<label class="radio-inline"><f:radiobutton path="reportType" value="xls"/>Xls</label>
        	</div>
        </div>
      	
      </div>

	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="button" class="btn btn-default submit" value="search">Search</button>
	</div>
</f:form>