<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<jsp:include page="../employeeMenu.jsp"></jsp:include>

<style>
.required:after {
  margin-bottom: 0px;
  content:"*";
  color:red;
}
</style>
<input id="empId" type="hidden" value="${id}">

<f:form method="post" commandName="experience" class="form-horizontal" role="form">	
				
		<div class="row">
		<%-- <div class="col-md-6">
		<h2><spring:message code="experience.name" /></h2>
		</div> --%>
		<!-- Button trigger modal -->
		<br>
			<div class="form-group" align="right">
			<div class="col-md-12">
				<button type="button" id="addBtnEdu" class="btn btn-warning active btnAdds " data-toggle="modal" data-target="#addModal"><spring:message code="label.newRecord" /></button> 
			</div>
			</div>
		</div>				
						
		
		<div id="outputajax" class="form-group">		
		<table id="tdResult" class="dataTable stripe table-bordered">
		<caption title=""><spring:message code="experience.name" /></caption>
			<thead>
				<tr>
					<th><spring:message code="experience.dateFrom" /></th>
					<th><spring:message code="experience.dateTo" /></th>
					<th><spring:message code="experience.companyName" /></th>
					<th><spring:message code="experience.position" /></th>
					<th><spring:message code="experience.salary" /></th>
					<th><spring:message code="experience.reason" /></th>
					<th><spring:message code="label.action" /></th>
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
        <h4 class="modal-title" id="myModalLabel"><spring:message code="experience.name" /></h4>
      </div>
      <div class="modal-body row">
        <spring:message code="default.enter" var="enter" />
  		<spring:message code="default.date" var="date" />
       	
       	<div class="form-group col-md-6">
    		<label class="required"><spring:message code="experience.dateFrom" var="dateFrom" /> ${dateFrom} : </label>
  			<div class="input-group date" id="dateTimeFrom">
  				<f:input data-format="dd-mm-yyyy" path="dateFrom" id="dateFrom" type="text" class="form-control" placeholder="${date}" />
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
		</div>
		
		<div class="form-group col-md-6">
    		<label class="required"><spring:message code="experience.dateTo" var="dateTo" /> ${dateTo} : </label> 	
  			<div class="input-group date" id="dateTimeTo">
  				<f:input path="dateTo" type="text" class="form-control" id="dateTo" placeholder="${date}" />
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
		</div>
        <div class="form-group col-md-6">
  			<label class="required"><spring:message code="experience.companyName" var="cName" /> ${cName} : </label>
  			<f:input path="companyName" type="text" class="form-control" id="cName" placeholder="${enter}${cName}" />
  		</div>
  		<div class="form-group col-md-6">
  			<label><spring:message code="experience.businessType" var="businessType" /> ${businessType} : </label>
  			<input type="text" class="form-control" id="businessType" placeholder="${businessType}">
  		</div>
  		
      	<div class="form-group col-md-6">
      		<label class="required"><spring:message code="experience.position" var="position" /> ${position} : </label>
  			<f:input path="position" type="text" class="form-control" id="position" placeholder="${enter}${position}" />
		</div>
		
		<div class="form-group col-md-6">
      		<label class="required"><spring:message code="experience.salary" var="salary" /> ${salary} : </label>
  			<f:input path="salary" type="text" class="form-control" id="salary" placeholder="${enter}${salary}" />
		</div>
  		
		<div class="form-group col-md-6">
  			<label><spring:message code="experience.responsibility" var="responsibility" /> ${responsibility} : </label>
  			<input type="text" class="form-control" id="responsibility" placeholder="${enter}${responsibility}">
  		</div>
  		<div class="form-group col-md-6">
  			<label><spring:message code="experience.reference" var="reference" /> ${reference} : </label>
  			<input type="text" class="form-control" id="reference" placeholder="${enter}${reference}">
  		</div>
  		
  		<div class="form-group col-md-12">
  			<label><spring:message code="experience.address" var="address" /> ${address} : </label>
  			<input type="text" class="form-control" id="address" placeholder="${enter}${address} ">
  		</div>
  		
  		<div class="form-group col-md-12">
  			<label class="required"><spring:message code="experience.reason" var="reason" /> ${reason} : </label>
  			<f:input path="reason" type="text" class="form-control" id="reason" placeholder="${enter}${reason}" />
  		</div>
        
      </div>
      <div class="form-group" align="center">
        <button type="button" class="btn btn-default closeButton" data-dismiss="modal"><spring:message code="label.close" /></button>
        <button type="button" class="btn btn-info saveButton"><spring:message code="label.save" /></button>
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
        <h4 class="modal-title" id="deleteModalLabel"><spring:message code="label.delete" /><spring:message code="experience.name" /></h4>
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

<script type="text/javascript">
var dt;
	$(document).ready(function() {
		
		$('#dateFrom').mask("99-99-9999",{placeholder:"DD-MM-YYYY"});
		$('#dateTo').mask("99-99-9999",{placeholder:"DD-MM-YYYY"});
/*  		$('#salary').mask("#,###.00", {locale:"us"}); */
 		$('#salary').autoNumeric('init', {'dGroup': 3});
		$('#tdResult').dataTable({ 
			"bLengthChange": false,
			"iDisplayLength": 10,
			"pagingType": "simple_numbers",
			"ordering": false,
			"info": false
		});
		var expId; 
		$('#validate').bootstrapValidator({
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
		                        message: '<spring:message code="experience.required.dateFrom" />'
		                    }, 
		                    date: {
		                        format: 'DD-MM-YYYY'
		                    }
		                }
		            },
		            dateTo: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="experience.required.dateTo" />'
		                    }, 
		                    date: {
		                        format: 'DD-MM-YYYY'
		                    }
		                }
		            },
		            cName: {
		            	validators: {
	                        notEmpty: {
	                            message: '<spring:message code="experience.required.companyName" />'
	                        }
	                    }
		            },
		            position: {
		            	validators: {
	                        notEmpty: {
	                            message: '<spring:message code="experience.required.position" />'
	                        }
	                    }
		            },
		            salary: {
		            	validators: {
	                        notEmpty: {
	                            message: '<spring:message code="experience.required.salary" />'
	                        }
	                    }
		            },
		            reason: {
		            	validators: {
	                        notEmpty: {
	                            message: '<spring:message code="experience.required.reason" />'
	                        }
	                    }
		            }
		        }
		});
		
		$('#dateTimeFrom')
        .on('dp.change dp.show', function(e) {
            // Validate the date when user change it
            $('#validate')
                // Get the bootstrapValidator instance
                .data('bootstrapValidator')
                // Mark the field as not validated, so it'll be re-validated when the user change date
                .updateStatus('dateFrom', 'NOT_VALIDATED', null)
                // Validate the field
                .validateField('dateFrom');
        });
		
		$('#dateTimeTo')
        .on('dp.change dp.show', function(e) {
            // Validate the date when user change it
            $('#validate')
                // Get the bootstrapValidator instance
                .data('bootstrapValidator')
                // Mark the field as not validated, so it'll be re-validated when the user change date
                .updateStatus('dateTo', 'NOT_VALIDATED', null)
                // Validate the field
                .validateField('dateTo');
        });
		
/*     	$( "#dateTimeFrom" ).datetimepicker({
			// viewMode: 'days',
			 format : 'DD-MM-YYYY',
			 //defaultDate: 'moment',
			 //minDate: moment(),
		}); */
		$("#dateTimeFrom").datetimepicker({
		format : 'DD-MM-YYYY',
		defaultDate: 'moment',
/* 		onSelect: function(dateText, inst){
			$("#dateTimeTo").datetimepicker('option', 'minDate', dateText);
			}*/
		}); 
    	$("#dateTimeTo").datetimepicker({
		format : 'DD-MM-YYYY',
		minDate: moment()
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
    					 salary: $("#salary").autoNumeric('get'),
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
    					$(function(){ new PNotify({
    						title: 'Success',
    						type: 'success',
    						animation: {
    							effect_in: 'show',
    							effect_out: 'slide'
    						}
    						});
    					});
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
    					$(function(){ new PNotify({
    					    title: 'Error!',
    					    type: 'error',
    						animation: {
    							effect_in: 'show',
    							effect_out: 'slide'
    						}
    						});
    					});
    					//$('#validate').bootstrapValidator('validate');
//     					alert("ERROR");
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
/* 						$("#salary").val(data.salary); */
						$('#salary').autoNumeric('set',data.salary);
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
						$(function(){ new PNotify({
						    title: 'Error!',
						    type: 'error',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							}
							});
						});
// 						alert("ERROR");
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
    					 salary: $("#salary").autoNumeric('get'),
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
						$(function(){ new PNotify({
							title: 'Success',
							type: 'success',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							}
							});
						});
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
						$(function(){ new PNotify({
						    title: 'Error!',
						    type: 'error',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							}
							});
						});
						//$('#addModal').modal('toggle');
// 						alert("ERROR");
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
							$(function(){ new PNotify({
								title: 'Success',
								type: 'success',
								animation: {
									effect_in: 'show',
									effect_out: 'slide'
								}
								});
							});
							//$("#message").html('<div class="alert alert-success" role="alert">Success</div>');		
							/* var del = button.closet("tr");
							dt.fnDeleteRow(del); */
							listAll();
						},
						error : function(data,testStatus,jqXHR) {
							$('#deleteModal').modal('toggle');
							$(function(){ new PNotify({
							    title: 'Error!',
							    type: 'error',
								animation: {
									effect_in: 'show',
									effect_out: 'slide'
								}
								});
							});
// 							alert("ERROR");
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
							 
						 	'<button type="button" style="margin-right :15px;" class="btn btn-warning btn-sm active" data-expId="' + data[i].id + '" data-target="#addModal" data-toggle="modal"><spring:message code="label.edit" /></button>'+
	    				  '<button type="button" class="btn btn-danger btn-sm active" data-expId="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal"><spring:message code="label.delete" /></button>']);
	    					
						}
					},
					error : function(data,testStatus,jqXHR) {
						$(function(){ new PNotify({
						    title: 'Error!',
						    type: 'error',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							}
							});
						});
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
