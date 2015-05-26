<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>

<!-- Date Picker -->
<script src="<c:url value="/resource/datepicker/js/bootstrap-datepicker.js" />"></script>
<link href="<c:url value="/resource/datepicker/css/datepicker.css" />" rel="stylesheet" media="all">

<!-- Data Table -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet">

<!-- dataTable Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>

<title>Experience</title>
<style>
.datepicker{z-index:1151 !important;}

</style>
</head>
<body>
<f:form method="post" commandName="experience" class="form-horizontal" role="form">
	<div class="container">

		<h2>Experience</h2>
		
		<br><br>
		
		<div id="message"></div>
		<div id="outputajax" class="form-group">		
		<table id="tdResult">
			<thead>
				<tr>
					<th>Id</th>
					<th>Company Name</th>
					<th>Business Type</th>
					<th>Position</th>
					<th>Date From</th>
					<th>Date To</th>
					<th>Reference</th>
					<th>Employee Code</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		</div>
</f:form>			
	<!-- Button trigger modal -->
	<div align="right">
		<button id="clearModal" type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#addModal">
 	 	Add
		</button>
	</div>
</div>			
		
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
  			<label>Business Type:</label>
  			<input type="text" class="form-control" id="businessType" placeholder="Enter Business Type">
  		</div>
  		
      	<div class="form-group">
      		<label>Position :</label>
  			<input type="text" class="form-control" id="position" placeholder="Enter Position">
		</div>
		
		<div class="form-group">
      		<label>Salary :</label>
  			<input type="text" class="form-control" id="salary" placeholder="Enter Salary">
		</div>
		
  		<div class="form-group">
  			<p><label>Date From : <input type="text" id="dateFrom" path="dateFrom"></label></p>
  		</div>
  		  		
  		<div class="form-group">
  			<p><label>Date To : <input type="text" id="dateTo"></label></p>
  		</div>
  		
  		<div class="form-group">
  			<label>Address :</label>
  			<input type="text" class="form-control" id="address" placeholder="Enter Address">
  		</div>
  		
		<div class="form-group">
  			<label>Responsibility :</label>
  			<input type="text" class="form-control" id="responsibility" placeholder="Enter Responsibility">
  		</div>
  		<div class="form-group">
  			<label>Reference :</label>
  			<input type="text" class="form-control" id="reference" placeholder="Enter Reference Name">
  		</div>
  		
  		<div class="form-group">
  			<label>Reason of Resignation:</label>
  			<input type="text" class="form-control" id="reason" placeholder="Enter Reason of Resignation">
  		</div>
        
		<!-- <div class="form-group">
  			<label>Employee ID :</label>
  			<input type="text" class="form-control" id="employeeId" placeholder="Enter Employee Id">
  		</div> -->
      </div>
      <div class="form-group" align="center">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-info saveButton">Save</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal Delete -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title" id="deleteModalLabel">Delete Experience</h4>
      </div>
      <div class="modal-body">
      	Do you want to delete experience ?
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-danger yesButton" >Yes</button>
      	<button type="button" class="btn btn-info" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>

<script>
var dt;
	$(document).ready(function() {
    	$( "#dateFrom" ).datepicker({
			clearBtn : true,
			autoclose : true,
			forceParse : false,
			language : "en",
			format : "dd-mm-yyyy",
			todayHighlight : true
		});
    	$( "#dateTo" ).datepicker({
			clearBtn : true,
			autoclose : true,
			forceParse : false,
			language : "en",
			format : "dd-mm-yyyy",
			todayHighlight : true
		});
    	dt=$("#tdResult").dataTable();
 		listAll();
		
     	$("#addModal").on("show.bs.modal", function(event){
    		var button = $(event.relatedTarget);
    		var expId = button.data("expid"); 
    		if(expId != null){
				initEditExperience(expId);
			}
     		
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
    			var id = getUrlParameter('Id');
    			$.ajax({
    				url : "${pageContext.request.contextPath}/experience/add",
    				type : "POST",
    				data : JSON.stringify({
    					 companyName: $("#cName").val(),
    					 businessType: $("#businessType").val(),
    					 position: $("#position").val(),
    					 salary: $("#salary").val(),
    					 dateFrom: $("#dateFrom").val(),
    					 dateTo: $("#dateTo").val(),
    					 responsibility: $("#responsibility").val(),
    					 superVisor: $("#supervisor").val(),
    					 address: $("#address").val(),
    					 reason: $("#reason").val(),
    					 employeeId: id 
    					}),
    				datatype: "json",
    				contentType: "application/json",
    				success : function(data) {
    					$('#addModal').modal('toggle');
    					$("#message").html('<div class="alert alert-success" role="alert">Success</div>');
    					/* dt.fnClearTable();
    					dt.fnAddData([
    					    data.id,
    						data.companyName,
    						data.business,
    						data.position,
    						data.dateFrom,
    						data.dateTo,
    						data.address,
    						data.description,
    						data.superVisor,
    						//data.employee.id,
    					'<button type="button" class="btn btn-info btn-sm active" data-expId="' + data.id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
    					'<button type="button" class="btn btn-danger btn-sm active" data-expId="' + data.id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>'
    					]); */
    					listAll();
    				},
    				error : function(data,testStatus,jqXHR) {
    					$('#addModal').modal('toggle');
    					$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
    					}
    				});
    		}
    		
    		function initEditExperience(expId) {
				//alert(expId+" Init edit");
				$.ajax({
					url : "${pageContext.request.contextPath}/experience/initEdit/"+expId,
					type : "POST",
					success : function(data) {
						id:expId;
						$("#cName").val(data.companyName);
						$("#businessType").val(data.businessType);
						$("#position").val(data.position);
						$("#salary").val(data.salary);
						$("#dateFrom").val(data.dateFrom);
						$("#dateTo").val(data.dateTo);
						$("#responsibility").val(data.responsibility);
						$("#reference").val(data.reference);
						$("#address").val(data.address);
						$("#reason").val(data.reason);
						employeeId: data.employeeId;
					},
					error : function(data,testStatus,jqXHR) {
						$('#addModal').modal('toggle');
						$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
						}
					});
			}
			
			
    		
    		function editExperience() {
    			var id = getUrlParameter('Id');
    			//alert(expId+" edit");
				$.ajax({
					url : "${pageContext.request.contextPath}/experience/edit",
					type : "POST",
					data : JSON.stringify({
						 id: expId,
						 companyName: $("#cName").val(),
    					 businessType: $("#businessType").val(),
    					 position: $("#position").val(),
    					 salary: $("#salary").val(),
    					 dateFrom: $("#dateFrom").val(),
    					 dateTo: $("#dateTo").val(),
    					 responsibility: $("#responsibility").val(),
    					 reference: $("#reference").val(),
    					 address: $("#address").val(),
    					 reason: $("#reason").val(),
    					 employeeId: id
					 }),
					datatype: "json",
					contentType: "application/json",
					success : function(data) {
						$('#addModal').modal('toggle');
						$("#message").html('<div class="alert alert-success" role="alert">Success</div>');
						/* dt.fnClearTable();
						dt.fnAddData([
						    data.id,
							data.companyName,
							data.business,
							data.position,
							data.dateFrom,
							data.dateTo,
							data.description,
							data.superVisor,
							data.address,
							'<button type="button" class="btn btn-info btn-sm active" data-expId="' + data.id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
	    					'<button type="button" class="btn btn-danger btn-sm active" data-expId="' + data.id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>'
						]); */
						listAll();
					},
					error : function(data,testStatus,jqXHR) {
						$('#addModal').modal('toggle');
						$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
						}
					});
			}
			
    		$("#clearModal").off().on("click", function(){
    			$("#cName").val("");
				$("#businessType").val("");
				$("#position").val("");
				$("#salary").val("");
				$("#dateFrom").val("");
				$("#dateTo").val("");
				$("#responsibility").val("");
				$("#reference").val("");
				$("#address").val("");
				$("#reason").val("");
			});
    		
     		});
			
			$("#deleteModal").on("show.bs.modal", function(event){
				var button = $(event.relatedTarget);
				var expId = button.data("expid");
				//alert("delete "+expId);
				$(this).find(".yesButton").off("click").on("click", function()
						{
							deleteExperience(button,expId);
							//alert("go fn");
						});
				
				function deleteExperience(button,expId){
					alert("in fn");
					$.ajax({
						url : "${pageContext.request.contextPath}/experience/delete/"+expId,
						type : "POST",
						success : function(data) {
							$('#deleteModal').modal('toggle');
							$("#message").html('<div class="alert alert-success" role="alert">Success</div>');		
							/* var del = button.closet("tr");
							dt.fnDeleteRow(del); */
							listAll();
						},
						error : function(data,testStatus,jqXHR) {
							$('#deleteModal').modal('toggle');
							$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
							}
						});
				}
    		   		
      	});
			
			function listAll(){
				
				//alert("list experience");
				var id = getUrlParameter('Id');
				//alert("id >>>>"+id);
				$.ajax({
					url : "${pageContext.request.contextPath}/experience/listAll/"+id,
					/* data: "id="+getUrlParameter('Id'), */
					type : "POST",
					success : function(data) {
					dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([data[i].id,data[i].companyName,data[i].businessType, 
						              data[i].position,data[i].dateFrom,data[i].dateTo,
						              data[i].reference,data[i].employeeCode,
							'<button type="button" class="btn btn-warning btn-sm active" data-expId="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
							'<button type="button" class="btn btn-danger btn-sm active" data-expId="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
				
						}
					},
					error : function(data,testStatus,jqXHR) {
						$("#outputajax").text(testStatus);
						}
					}); 
				     
			}
			
			function getUrlParameter(sParam)
			{
				//alert("url "+document.referrer);
			    var sPageURL = document.referrer;
			    var sURLVariables = sPageURL.split('?');
			    //alert("spilt "+sURLVariables);

			   	
			    
			    var sParameterName = sURLVariables[1].split('=');
			    //alert("Param "+parseInt(sParameterName[1]));
			    if (sParameterName[0] == sParam) 
			        {
			        	//alert("Param "+sParameterName[0]);
			        	return sParameterName[1];
			        	
			        }
			        //alert("Param2 "+parseInt(sParameterName[1]));
			    
			}
    	
  	});
  
  </script>
</body>
</html>