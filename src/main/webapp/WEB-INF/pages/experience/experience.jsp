<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value="/resources/bootstrap/js/jquery-1.11.2.min.js" />"></script>
<link href="<c:url value="/resources/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resources/bootstrap/js/bootstrap.js" />"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
<script src="<c:url value="/resources/dataTable/jquery.dataTables.min.js" />"></script>
<link href="<c:url value="/resources/dataTable/jquery.dataTables.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/dataTable/jquery.dataTables.themeroller.css" />"
	rel="stylesheet">
<title>Experience</title>
<style>
.datepicker{z-index:1151 !important;}

</style>
</head>
<body>
<f:form method="post" commandName="experience" class="form-horizontal" role="form">
	<div class="container">
		<ol class="breadcrumb">
			<li role="presentation" class="active"><a href="#">Home</a></li>
 			<li role="presentation"><a href="#addModal" data-toggle="modal">Add Experience</a></li>
		</ol>
		<h2>Experience</h2>
		<div id="message"></div>
		<div id="outputajax" class="form-group">		
			<table id="tdResult" class="table">
			<thead>
				<tr>
					<th>Company Name</th>
					<th>Business</th>
					<th>Address</th>
					<th>Position</th>
					<th>Supervisor</th>
					<th>Date From</th>
					<th>Date To</th>
					<th>Description</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		</div>		
	<!-- Button trigger modal -->
	<div align="right">
		<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#addModal">
 	 	Add
		</button>
	</div>
</div>		
</f:form>		
		
<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Experience</h4>
      </div>
      <div class="modal-body">
       
        <div class="form-group">
  			<label>Company Name :</label>
  			<input type="text" class="form-control" id="cName" placeholder="Enter Company Name">
  		</div>
  		<div class="form-group">
  			<label>Business :</label>
  			<input type="text" class="form-control" id="business" placeholder="Enter Business">
  		</div>
  		
      	<div class="form-group">
      		<label>Position :</label>
  			<input type="text" class="form-control" id="position" placeholder="Enter Position">
		</div>
		
  		<div class="form-group">
  			<p><label>Date From : <input type="text" id="dateFrom"></label></p>
  		</div>
  		  		
  		<div class="form-group">
  			<p><label>Date To : <input type="text" id="dateTo"></label></p>
  		</div>
  		
  		<div class="form-group">
  			<label>Address :</label>
  			<input type="text" class="form-control" id="address" placeholder="Enter Description">
  		</div>
  		
		<div class="form-group">
  			<label>Description :</label>
  			<input type="text" class="form-control" id="description" placeholder="Enter Description">
  		</div>
  		<div class="form-group">
  			<label>Supervisor :</label>
  			<input type="text" class="form-control" id="supervisor" placeholder="Enter Supervisor Name">
  		</div>
        
        <div class="form-group">
  			<label>Employee ID :</label>
  			<input type="text" class="form-control" id="employeeId" placeholder="Enter Employee Name">
  		</div>  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary saveButton">Save</button>
      </div>
    </div>
  </div>
</div>

<script>
var dt;
	$(document).ready(function() {
    	$( "#dateFrom" ).datepicker();
    	$( "#dateTo" ).datepicker();
    	dt=$("#tdResult").dataTable();
     	$("#addModal").on("show.bs.modal", function(event){
    		var button = $(event.relatedTarget);
    		var expId = button.data("id"); 
/*     		if(expId != null){
				initEditExperience(expId);
			}
			else {
				addExperience();
			} */
    		$(this).find(".saveButton").off("click").on("click", function()
    		{
    			if(expId != null){
    				editExperience();
    			}
    			else {
    				addExperience();
    			}
    			
    		});
    		
    		function addExperience() {
    			$.ajax({
    				url : "${pageContext.request.contextPath}/experience/add",
    				type : "POST",
    				 data : JSON.stringify({
    					 companyName: $("#cName").val(),
    					 business: $("#business").val(),
    					 position: $("#position").val(),
    					 dateFrom: $("#dateFrom").val(),
    					 dateTo: $("#dateTo").val(),
    					 description: $("#description").val(),
    					 superVisor: $("#supervisor").val(),
    					 Address: $("#address").val(),
    					 employee:{id: $("#employeeId").val() }
    				 }),
    				 datatype: "json",
    				 contentType: "application/json",
    				success : function(data) {
    					$('#addModal').modal('toggle');
    					$("#message").html('<div class="alert alert-success" role="alert">Success</div>');
    					dt.fnClearTable();
    					dt.fnAddData([
    					    data.id,
    						data.companyName,
    						data.business,
    						data.position,
    						data.dateFrom,
    						data.dateTo,
    						data.description,
    						data.superVisor,
    						data.Address,
    						data.employee.id,
    					'<button type="button" class="btn btn-info btn-sm active" data-expId="' + data.id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
    					'<button type="button" class="btn btn-danger btn-sm active" data-expId="' + data.id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>'
    					]);
    				},
    				error : function(data,testStatus,jqXHR) {
    					$('#addModal').modal('toggle');
    					$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
    					}
    				});
    		}
    		
    		
      	});
    	
  	});
  
  </script>
</body>
</html>