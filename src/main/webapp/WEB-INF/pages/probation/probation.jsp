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
<f:form method="post" commandName="probation" class="form-horizontal" role="form">
	<div class="container">

		<h2>Probation</h2>
		
		<br><br>
		
		<div id="message"></div>
		<div id="outputajax" class="form-group">		
		<table id="tdResult">
			<thead>
				<tr>
					<th>Id</th>
					<th>Date From</th>
					<th>Date To</th>
					<th>Status</th>
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
		<button id="clearModal"type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#addModal">
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
        <h4 class="modal-title" id="myModalLabel">Add Probation</h4>
      </div>
      <div class="modal-body">
		
  		<div class="form-group">
  			<p><label>Date From : <input type="text" id="dateFrom"></label></p>
  		</div>
  		  		
  		<div class="form-group">
  			<p><label>Date To : <input type="text" id="dateTo"></label></p>
  		</div>
  		
  		<div class="form-group">
    			<label>Status :</label>
    				<select  id="status"  class="form-control">
						<option value="-1">--Choose Status--</option>
						<option value="Pass">Pass</option>
						<option value="Not Pass">Not Pass</option>
						<option value="Extend">Extend</option>
					</select>  
		</div>
  		
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
        <h4 class="modal-title" id="deleteModalLabel">Delete Probation</h4>
      </div>
      <div class="modal-body">
      	Do you want to delete probation ?
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
		var proId; 
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
    		proId = button.data("proid");
    		if(proId != null){
				initEditProbation(proId);
			}
     		
    		$(this).find(".saveButton").off("click").on("click", function()
    		{
    			if(proId != null){
    				//console.log(proId);
    				editProbation();
    			}
    			else {
    				//console.log("add : "+proId);
    				addProbation();
    			}
    			
    		});
    		
    		
    		function addProbation() {
    			var id = getUrlParameter('Id');
    			$.ajax({
    				url : "${pageContext.request.contextPath}/probation/add",
    				type : "POST",
    				/*data :  " dateFrom="+ $("#dateFrom").val()+
   					"&dateTo="+ $("#dateTo").val()+ 
    					 "status="+ $("#status option:selected").text()+
   					 "&employee.id="+ id 
   					,*/
    				 data : JSON.stringify({
    					 dateFrom: $("#dateFrom").val(),
    					 dateTo: $("#dateTo").val(),
    					 status: $("#status option:selected").text(),
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
    		
    		function initEditProbation(proId) {
				//alert(proId+" Init edit");
				$.ajax({
					url : "${pageContext.request.contextPath}/probation/initEdit/"+proId,
					type : "POST",
					success : function(data) {
							id:proId;
							$("#dateFrom").val(data.dateFrom);
							$("#dateTo").val(data.dateTo);
							$("#status").val(data.status);
							employeeId: data.employeeId; 
							//setModal(data);
					},
					error : function(data,testStatus,jqXHR) {
						$('#addModal').modal('toggle');
						$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
						}
					});
			}
    		
    		function editProbation() {
    			//alert(proId+" edit");
    			var id = getUrlParameter('Id');
				$.ajax({
					url : "${pageContext.request.contextPath}/probation/edit",
					type : "POST",
					data : JSON.stringify({
						 id: proId,
    					 dateFrom: $("#dateFrom").val(),
    					 dateTo: $("#dateTo").val(),
    					 status: $("#status option:selected").text(),
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
    			//console.log("test");
				$("#dateFrom").val("");
				$("#dateTo").val("");
				$("#status").val("-1"); 
			});
    		/* function setModal(data){
				$("#dataFrom").val(data.dateFrom);
				$("#dateTo").val(data.dateTo);
				$("#status option:selected").val(data.status);
			} */
			
			});
			
			$("#deleteModal").on("show.bs.modal", function(event){
				var button = $(event.relatedTarget);
				var proId = button.data("proid");
				//alert("delete "+proId);
				$(this).find(".yesButton").off("click").on("click", function()
						{
							deleteProbation(button,proId);
							//alert("go fn");
						});
				
				function deleteProbation(button,proId){
					//alert("in fn");
					$.ajax({
						url : "${pageContext.request.contextPath}/probation/delete/"+proId,
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
				//var id = 2;
				//alert("id >>>>"+id);
				$.ajax({
					url : "${pageContext.request.contextPath}/probation/listAll/"+id,
					/* data: "id="+getUrlParameter('Id'), */
					type : "POST",
					success : function(data) {
					dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([data[i].id,data[i].dateFrom,data[i].dateTo,
						              data[i].status,data[i].employeeCode,
							'<button type="button" class="btn btn-warning btn-sm active" data-proId="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
							'<button type="button" class="btn btn-danger btn-sm active" data-proId="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
				
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