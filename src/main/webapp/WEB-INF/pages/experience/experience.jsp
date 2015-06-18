<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<jsp:include page="../employeeMenu.jsp"></jsp:include>

<input id="empId" type="hidden" value="${id}">

<f:form method="post" commandName="experience" class="form-horizontal" role="form">	
		<div class="row-md-12">	
			<h2 class="col-md-6">Experience</h2>
			<br>
			<div class="col-md-6">
			<!-- Button trigger modal -->
				<div class="form-group" align="right">
					<button id="clearModal" type="button" class="btn btn-info" data-toggle="modal" data-target="#addModal">
 	 					New record
					</button>
				</div>
				<br>
				</div>	
			</div>
		<div id="outputajax" class="form-group">		
		<table id="tdResult">
			<thead>
				<tr>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Company Name</th>
					<th>Position</th>
					<th>Salary</th>
					<th>Reason of Resign</th>
					<th>Action</th>
					<!-- <th></th> -->
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		</div>
</f:form>			
		
<!-- Modal -->
<f:form id="validate" method="post" commandName="experience">
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Experience</h4>
      </div>
      <div class="modal-body row">
      
       	<div class="form-group col-md-6">
    		<label>Start Date :</label>
  			<div class="input-group" id="dateTimeFrom">
  				<f:input path="dateFrom" id="dateFrom" type="text" class="form-control" placeholder="Start Date" />
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
		</div>
		
		<div class="form-group col-md-6">
    		<label>End Date :</label> 	
  			<div class="input-group" id="dateTimeTo">
  				<f:input path="dateTo" id="dateTo" type="text" class="form-control" placeholder="End Date" />
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
		</div>
        <div class="form-group col-md-6">
  			<label>Company Name :</label>
  			<f:input path="companyName" type="text" class="form-control" id="cName" placeholder="Enter Company Name" />
  		</div>
  		<div class="form-group col-md-6">
  			<label>Business Type:</label>
  			<input type="text" class="form-control" id="businessType" placeholder="Enter Business Type">
  		</div>
  		
      	<div class="form-group col-md-6">
      		<label>Position :</label>
  			<f:input path="position" type="text" class="form-control" id="position" placeholder="Enter Position" />
		</div>
		
		<div class="form-group col-md-6">
      		<label>Salary :</label>
  			<f:input path="salary" type="text" class="form-control" id="salary" placeholder="Enter Salary" />
		</div>
  		
		<div class="form-group col-md-6">
  			<label>Responsibility :</label>
  			<input type="text" class="form-control" id="responsibility" placeholder="Enter Responsibility">
  		</div>
  		<div class="form-group col-md-6">
  			<label>Reference :</label>
  			<input type="text" class="form-control" id="reference" placeholder="Enter Reference Name">
  		</div>
  		
  		<div class="form-group col-md-12">
  			<label>Address :</label>
  			<input type="text" class="form-control" id="address" placeholder="Enter Address">
  		</div>
  		
  		<div class="form-group col-md-12">
  			<label>Reason of Resignation:</label>
  			<f:input path="reason" type="text" class="form-control" id="reason" placeholder="Enter Reason of Resignation" />
  		</div>
        
      </div>
      <div class="form-group" align="center">
        <button type="button" class="btn btn-default closeButton" data-dismiss="modal">Close</button>
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
		$('#tdResult').dataTable({ 
			"bLengthChange": false,
			"iDisplayLength": 10,
			"pagingType": "simple_numbers",
			"ordering": false,
			"info": false
		});
		var expId; 
		$('#validate')
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
		                        message: 'Start Date is required and cannot be empty'
		                    }, 
		                    date: {
		                        format: 'DD-MM-YYYY'
		                    }
		                }
		            },
		            dateTo: {
		                validators: {
		                    notEmpty: {
		                        message: 'End Date is required and cannot be empty'
		                    }, 
		                    date: {
		                        format: 'DD-MM-YYYY'
		                    }
		                }
		            },
		            cName: {
		            	validators: {
	                        notEmpty: {
	                            message: 'Company Name is required and cannot be empty'
	                        }
	                    }
		            },
		            position: {
		            	validators: {
	                        notEmpty: {
	                            message: 'Position is required and cannot be empty'
	                        }
	                    }
		            },
		            salary: {
		            	validators: {
	                        notEmpty: {
	                            message: 'Salary is required and cannot be empty'
	                        },
	                        digits: {
		                    	message: 'Salary is number'
		                    },
	                    }
		            },
		            reason: {
		            	validators: {
	                        notEmpty: {
	                            message: 'Reason of Resignation is required and cannot be empty'
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
    		expId = button.data("expid"); 
    		//alert("Check"+expId);
    		if(expId != null){
				initEditExperience(expId);
			}
     		
    		$(this).find(".saveButton").off("click").on("click", function()
    		{
    			if(expId != null){
    				$('#validate').bootstrapValidator();
    				$('#validate').data('bootstrapValidator').validate();
    				if($('#validate').data('bootstrapValidator').isValid()){
    					editExperience();
    				}
    			}
    			else {
    				$('#validate').bootstrapValidator();
    				$('#validate').data('bootstrapValidator').validate();
    				if($('#validate').data('bootstrapValidator').isValid()){
    					addExperience();
    				}
    			}
    			
    		});
    		
    		$(this).find(".closeButton").off("click").on("click",function() {
				$('#validate').bootstrapValidator('resetForm', true);
			});
    		
    		function addExperience() {
//     			var id = getUrlParameter('Id');
    			var id = $("#empId").val();
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
    					 reference: $("#reference").val(),
    					 superVisor: $("#supervisor").val(),
    					 address: $("#address").val(),
    					 reason: $("#reason").val(),
    					 employeeId: id 
    					}),
    				datatype: "json",
    				contentType: "application/json",
    				success : function(data) {
    					$('#validate').bootstrapValidator('resetForm', true);
    					$('#addModal').modal('toggle');
    					//$("#message").html('<div class="alert alert-success" role="alert">Success</div>');
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
    					//$('#validate').bootstrapValidator('validate');
    					alert("ERROR");
    					/* $('#addModal').modal('toggle');
    					$("#message").html('<div class="alert alert-danger" role="alert">Error</div>'); */
    					}
    				});
    		}
    		
    		function initEditExperience(expId) {
				//alert(expId+" Init edit");
				$.ajax({
					url : "${pageContext.request.contextPath}/experience/initEdit/"+expId,
					type : "POST",
					success : function(data) {
						//$('#validate').bootstrapValidator('resetForm', true);
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
						alert("ERROR");
						//$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
						}
					});
			}
			
			
    		
    		function editExperience() {
//     			var id = getUrlParameter('Id');
    			var id = $("#empId").val();
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
						$('#validate').bootstrapValidator('resetForm', true);
						//$('#validate').bootstrapValidator('validate');
						$('#addModal').modal('toggle');
						//$("#message").html('<div class="alert alert-success" role="alert">Success</div>');
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
						//$('#addModal').modal('toggle');
						alert("ERROR");
						//$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
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
				$(this).find(".yesButton").off("click").on("click", function()
						{
							deleteExperience(button,expId);
							//alert("go fn");
						});
				
				function deleteExperience(button,expId){
					//alert("in fn");
					//alert("delete "+expId);
					$.ajax({
						url : "${pageContext.request.contextPath}/experience/delete/"+expId,
						type : "POST",
						success : function(data) {
							$('#deleteModal').modal('toggle');
							//$("#message").html('<div class="alert alert-success" role="alert">Success</div>');		
							/* var del = button.closet("tr");
							dt.fnDeleteRow(del); */
							listAll();
						},
						error : function(data,testStatus,jqXHR) {
							$('#deleteModal').modal('toggle');
							alert("ERROR");
							//$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
							}
						});
				}
    		   		
      	});
			
			function listAll(){
				
				//alert("list experience");
// 				var id = getUrlParameter('Id');
				//alert("id >>>>"+id);
				var id = $("#empId").val();
				$.ajax({
					url : "${pageContext.request.contextPath}/experience/listAll/"+id,
					/* data: "id="+getUrlParameter('Id'), */
					type : "POST",
					success : function(data) {
					dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([data[i].dateFrom,
						              data[i].dateTo,
						              data[i].companyName, 
						              data[i].position,
						              data[i].salary,
						              data[i].reason,
							 
						 	'<button type="button" class="btn btn-warning btn-sm active" data-expId="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>'+
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
