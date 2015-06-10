<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<jsp:include page="../employeeMenu.jsp"></jsp:include>

<input id="empId" type="hidden" value="${id}">
<f:form method="post" commandName="probation" class="form-horizontal" role="form">
		<div class="row-md-12">
			<h2 class="col-md-6">Probation</h2>	
			<br>
			<div class="col-md-6">
				<!-- Button trigger modal -->
				<div class="form-group" align="right">
					<button id="clearModal"type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#addModal">
 	 					New record
					</button>
				</div>
				<br>
			</div>
		</div>
		<div id="message"></div>
		<div id="outputajax" class="form-group">		
		<table id="tdResult">
			<thead>
				<tr>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Status</th>
					<th>Reason</th>
					<th>Action</th>
					<th></th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		</div>
		
</f:form>			
		
<!-- Modal -->
<f:form id="validate" method="post" commandName="probation">
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Probation</h4>
      </div>
      <div class="modal-body row">
  		<div class="form-group col-md-6">
    		<label>Start Date :</label>
  			<div class="input-group" id="dateTimeFrom">
  				<f:input path="dateFrom" id="dateFrom" type="text" class="form-control" placeholder="Start Date"/> 
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
		</div>
		
		<div class="form-group col-md-6">
    		<label>End Date :</label> 	
  			<div class="input-group" id="dateTimeTo">
  				<f:input path="dateTo" id="dateTo" type="text" class="form-control" placeholder="End Date"/>
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
		</div>
  		
  		<div class="form-group col-md-12">
    			<label>Status :</label>
    				<f:select path="status" id="status"  class="form-control">
						<option value="">--Choose Status--</option>
						<option value="Pass">Pass</option>
						<option value="Not Pass">Not Pass</option>
						<option value="Extend">Extend</option>
					</f:select>  
		</div>
  		
  		<div class="form-group col-md-12">
	    	<label>Reason :</label>
	   		<input type="text" class="form-control" id="reason" placeholder="Enter Reason"/>
	  	</div>
      </div>
      <div class="form-group" align="center">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-info saveButton">Save</button>
      </div>

    </div>
  </div>
</div>
</f:form> 

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
		$('#tdResult').dataTable({ 
			"bLengthChange": false,
			"iDisplayLength": 10,
			"pagingType": "simple_numbers",
			"ordering": false,
			"info": false
		});
		var proId; 
		$('#validate').find('[id="#status"]')
        .selectpicker()
        .change(function(e) {
            // revalidate the color when it is changed
            $('#bootstrapSelectForm').formValidation('revalidateField', '#status');
        })
        .end()
        .bootstrapValidator({
			message: 'This value is not valid',
			 feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	dateFrom: {
		                validators: {
		                    notEmpty: {
		                        message: 'The Start Date is required and cannot be empty'
		                    }
		                }
		            },
		            dateTo: {
		                validators: {
		                    notEmpty: {
		                        message: 'The End Date is required and cannot be empty'
		                    }
		                }
		            },
		            status: {
		            	validators: {
	                        notEmpty: {
	                            message: 'Please select your Status.'
	                        }
	                    }
		            }
		        }
		});
		
    	$( "#dateTimeFrom" ).datetimepicker({
			 viewMode: 'days',
			 format : 'DD-MM-YYYY',
			 defaultDate: 'moment',
			 //minDate: moment(),
		});
    	$( "#dateTimeTo" ).datetimepicker({
			 viewMode: 'days',
			 format : 'DD-MM-YYYY',
			 defaultDate: 'moment',
			 //minDate: moment(),
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
    				if($('#validate').bootstrapValidator('validate')){
    				//console.log("add : "+proId);
    					addProbation();
    				}
    			}
    			
    		});
    		
    		
    		function addProbation() {
//     			var id = getUrlParameter('Id');
    			var id = $("#empId").val();
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
    					 reason: $("#reason").val(),
    					 employeeId: id
    					}),
    				datatype: "json",
    				contentType: "application/json",
    				success : function(data) {
    					$('#addModal').modal('toggle');
    					$("#message").html('<div class="alert alert-success" role="alert">Success</div>').delay(200).fadeIn().delay(4000).fadeOut();
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
    					$('#validate').bootstrapValidator('validate');
    					$('#validate').bootstrapValidator('revalidateField', '#status');
    					/* $('#addModal').modal('toggle');
    					$("#message").html('<div class="alert alert-danger" role="alert">Error</div>').delay(200).fadeIn().delay(4000).fadeOut(); */
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
							$("#reason").val(data.reason);
							employeeId: data.employeeId; 
					},
					error : function(data,testStatus,jqXHR) {
						$('#addModal').modal('toggle');
						$("#message").html('<div class="alert alert-danger" role="alert">Error</div>').delay(200).fadeIn().delay(4000).fadeOut();
						}
					});
			}
    		
    		function editProbation() {
    			//alert(proId+" edit");
//     			var id = getUrlParameter('Id');
    			var id = $("#empId").val();
				$.ajax({
					url : "${pageContext.request.contextPath}/probation/edit",
					type : "POST",
					data : JSON.stringify({
						 id: proId,
    					 dateFrom: $("#dateFrom").val(),
    					 dateTo: $("#dateTo").val(),
    					 status: $("#status option:selected").text(),
    					 reason: $("#reason").val(),
    					 employeeId: id
					 }),
					datatype: "json",
					contentType: "application/json",
					success : function(data) {
						$('#addModal').modal('toggle');
						$("#message").html('<div class="alert alert-success" role="alert">Success</div>').slideDown('fast').delay(5000).fadeOut().delay(4000);
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
    					$('#validate').bootstrapValidator('validating');
    					$('#validate').bootstrapValidator('revalidateField', '#status');
						/* $('#addModal').modal('toggle');
						$("#message").html('<div class="alert alert-danger" role="alert">Error</div>').delay(200).fadeIn().delay(4000).fadeOut(); */
						}
					});
			}
    		
    		$("#clearModal").off().on("click", function(){
    			//console.log("test");
				$("#dateFrom").val("");
				$("#dateTo").val("");
				$("#status").val(""); 
				$("#reason").val("");
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
							$("#message").html('<div class="alert alert-success" role="alert">Success</div>').delay(200).fadeIn().delay(4000).fadeOut();		
							/* var del = button.closet("tr");
							dt.fnDeleteRow(del); */
							listAll();
						},
						error : function(data,testStatus,jqXHR) {
							$('#deleteModal').modal('toggle');
							$("#message").html('<div class="alert alert-danger" role="alert">Error</div>').delay(200).fadeIn().delay(4000).fadeOut();
							}
						});
				}
    		   		
      	});
			
			function listAll(){
				
				//alert("list experience");
// 				var id = getUrlParameter('Id');
				var id = $("#empId").val();
				//var id = 2;
				//alert("id >>>>"+id);
				$.ajax({
					url : "${pageContext.request.contextPath}/probation/listAll/"+id,
					/* data: "id="+getUrlParameter('Id'), */
					type : "POST",
					success : function(data) {
					dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([data[i].dateFrom,data[i].dateTo,
						              data[i].status,data[i].reason,
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
