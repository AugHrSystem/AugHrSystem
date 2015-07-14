<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/css/header.css" />" rel="stylesheet" type="text/css">

<!-- <style>
.form{
	font-family: Dosis-Regular;
	font-size:18px;
	border: 0px solid #eee;
	background-color:#eee;
	padding: 5px;
	
}
</style> -->

<div class="form">
<f:form method="post" commandName="listemployee"  role="form">
		<!-- <ol class="breadcrumb">
			<li role="presentation" class="active"><a href="#">Home</a></li>
 			<li role="presentation"><a href="employee.jsp" data-toggle="modal">Add Employee</a></li>
		</ol> -->
		<br/>
		
		<c:if test="${ not empty msgerror }">
			<div class="alert alert-danger" >
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>&nbsp;${msgerror }</div>
		</c:if>
		

		<div id="message"></div>
		<div id="outputajax" class="form-group">		
		<table id="tdResult" class="dataTable stripe table-bordered">
		<caption title="">Employee</caption>
			<thead>
				<tr>
					<th><spring:message code="label.id" /></th>
					<th><spring:message code="employee.code" /></th>
		 			<th><spring:message code="employee.firstname" /></th>
					<th><spring:message code="employee.surname" /></th>
					<th><spring:message code="label.action" /></th>
					<!-- <th></th> -->
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		</div>
</f:form>
</div>		
	<!-- Button trigger modal -->
	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_HR')">
	<div align="right">
	<f:form action="${pageContext.request.contextPath}/employee" method="POST" role="form">
		<div class="form-group">
		<button type="submit" class="btn btn-warning btn-md">
 	 	<spring:message code="label.add" />
		</button>
		</div>
	</f:form>
	</div> 
	</sec:authorize>

<!-- Modal Delete -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title" id="deleteModalLabel"><spring:message code="label.delete" /><spring:message code="employee.name" /></h4>
    </div>
      <div class="modal-body">
      	<spring:message code="default.delete.confirm" />
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-danger yesButton" ><spring:message code="default.yes" /></button>
      	<button type="button" class="btn btn-info" data-dismiss="modal"><spring:message code="default.no" /></button>
      </div>
    </div>
  </div>
</div>

<script>
var dt;
var empId;
	$(document).ready(function() {
		
		dt=$("#tdResult").dataTable({ 
			"ordering": false,
// 			"dom": '<"toolbar">frtip'
		});
  	
// 		 $("div.toolbaCr").html('<b>Custom tool bar! Text/images etc.</b>');
		 
    	var button = $(event.relatedTarget);
		empId = button.data("empid"); 
 		listAll();
			
    		function listAll(){
    			$.ajax({
    				url : "${pageContext.request.contextPath}/employee/listAll",
    				type : "POST",
    				contentType: "application/json",
    				dataType: "json",
    				success : function(data) {
    					dt.fnClearTable();
    
    				for (var i=0;i< data.length; i++) {
    					dt.fnAddData([data[i].id,data[i].employeeCode,data[i].nameEng, 
    					              data[i].surnameEng,
    						 '<button type="button" style="margin-right :15px;" class="btn btn-warning btn-sm active " data-empId="' + data[i].id + '" onclick="initEditEmployee('+data[i].id+')" ><spring:message code="label.edit" /></button>'+
    						'<button type="button" class="btn btn-danger btn-sm active" data-empId="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal"><spring:message code="label.delete" /></button>']);
    			 
    					}
    				},
    				error : function(data,testStatus,jqXHR) {
    					$("#outputajax").text(testStatus);
    					}
    				}); 
    		}
	
/* --------------------------------------------------- Delete Function --------------------------------------------------- */		
			
			$("#deleteModal").on("show.bs.modal", function(event){
				var button = $(event.relatedTarget);
				var empId = button.data("empid");
				//alert("delete "+empId);
				$(this).find(".yesButton").off("click").on("click", function()
						{
							deleteEmployee(button,empId);
							//alert("go fn");
						});
				
				function deleteEmployee(button,empId){
					//alert("in fn");
					$.ajax({
						url : "${pageContext.request.contextPath}/employee/deleteemp/"+empId,
						type : "POST",
						success : function(data) {
							$('#deleteModal').modal('toggle');
							$("#message").html('<div class="alert alert-success" role="alert">Success</div>');		
							listAll();
						},
						error : function(data,testStatus,jqXHR) {
							$('#deleteModal').modal('toggle');
							$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
							}
						});
					}
    		   	
			
  				});

     	
	});
	
	/* --------------------------------------------------- EditFunction --------------------------------------------------- */		
		function initEditEmployee(empId) {
		if(empId == null){
			empId = 0;
		}

		var id = empId;
		window.location = "${pageContext.request.contextPath}/employee/init/"+id;
		//window.location = "${pageContext.request.contextPath}/employee/"+empId;

	/* 	$.ajax({
			url : "${pageContext.request.contextPath}/employee/initEdit/"+empId,
			type : "GET",
			success : function(data) {
				
				window.location = "${pageContext.request.contextPath}/?Id="+empId;
				alert("emp id:"+ empId);
				//editEmployee(); 

			},
			error : function(data,testStatus,jqXHR) {
				$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
				}
			}); */
	}

  
  </script>


