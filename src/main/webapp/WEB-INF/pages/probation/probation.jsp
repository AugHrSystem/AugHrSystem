<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<jsp:include page="../employeeMenu.jsp"></jsp:include>

<style type="text/css">

.required:after {
  margin-bottom: 0px;
  content:"*";
  color:red;
}  

</style>

<input id="empId" type="hidden" value="${id}">
<f:form method="post" commandName="probation" class="form-horizontal" role="form">
<!-- 		<div class="row-md-12"> -->
<!-- 			<h2 class="col-md-6"> -->
				<%-- <spring:message code="probation.name" /> --%>
<!-- 			</h2>	 -->
			<br>
<!-- 			<div class="col-md-6"> -->
				<!-- Button trigger modal -->
<!-- 				<div class="form-group" align="right"> -->
<!-- 					<button id="clearModal"type="button" class="btn btn-warning active btn-md" data-toggle="modal" data-target="#addModal"> -->
<%--  	 					<spring:message code="label.newRecord" /> --%>
<!-- 					</button> -->
<!-- 				</div> -->
<!-- 				<br> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div id="outputajax" >		
		<table id="tdResult" class="dataTable stripe table-bordered">
		 <caption title=""><spring:message code="probation.name" /></caption>
			<thead>
				<tr>
					<th><spring:message code="probation.dateFrom" /></th>
					<th><spring:message code="probation.dateTo" /></th>
					<th><spring:message code="probation.status" /></th>
					<th><spring:message code="probation.reason" /></th>
					<th><spring:message code="label.action" /></th>
					<!-- <th></th> -->
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
        <h4 class="modal-title" id="myModalLabel"><spring:message code="probation.name" /></h4>
      </div>
      <div class="modal-body row">
  		<div class="form-group col-md-6">
  		<spring:message code="default.enter" var="enter" />
  		<spring:message code="default.date" var="date" />
    		<label class="required">
    			<spring:message code="probation.dateFrom" var="dateFrom" /> ${dateFrom} : 
    		</label>
  			<div class="input-group date" id="dateTimeFrom">
  				<f:input path="dateFrom" id="dateFrom" type="text" class="form-control" placeholder="${date}"/> 
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
		</div>
		
		<div class="form-group col-md-6">
    		<label class="required">
    			<spring:message code="probation.dateTo" var="dateTo" /> ${dateTo} : 
    		</label> 	
  			<div class="input-group date" id="dateTimeTo">
  				<f:input path="dateTo" id="dateTo" type="text" class="form-control" placeholder="${date}"/>
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
		</div>
  		
  		<div class="form-group col-md-12">
    			<label class="required"><spring:message code="probation.status" var="status" /> ${status} : </label>
    				<f:select path="status" id="status"  class="form-control">
						<option value=""><spring:message code="probation.chooseStatus" /></option>
						<option value="Pass"><spring:message code="probation.pass" /></option>
						<option value="Not Pass"><spring:message code="probation.notPass" /></option>
						<option value="Extend"><spring:message code="probation.extend" /></option>
					</f:select>  
		</div>
  		
  		<div class="form-group col-md-12">
	    	<label><spring:message code="probation.reason" var="reason" /> ${reason} : </label>
	   		<input type="text" class="form-control" id="reason" placeholder="${enter}${reason}"/>
	  	</div>
      </div>
      <div class="modal-footer">
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
        <h4 class="modal-title" id="deleteModalLabel"><spring:message code="label.delete" /><spring:message code="probation.name" /></h4>
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
		$('#tdResult').dataTable({ 
			"bLengthChange": false,
			"iDisplayLength": 10,
			"pagingType": "simple_numbers",
			"ordering": false,
			"info": false,
			"dom": '<"toolbar">frtip'
		});
		
		$("div.toolbar").html('<b><button id="clearModal" type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#addModal"><spring:message code="label.newRecord" /></button> </b>');
		var proId; 
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
		                        message: '<spring:message code="probation.required.dateFrom" />'
		                    }, 
		                    date: {
		                        format: 'DD-MM-YYYY'
		                    }
		        
		                }
		            },
		            dateTo: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="probation.required.dateTo" />'
		                    }, 
		                    date: {
		                        format: 'DD-MM-YYYY'
		                    }
		                }
		            },
		            status: {
		            	validators: {
	                        notEmpty: {
	                            message: '<spring:message code="probation.required.status" />'
	                        }
	                    }
		            }
		        }
		});
		
    	$( "#dateTimeFrom" ).datetimepicker({
			 //viewMode: 'days',
			 format : 'DD-MM-YYYY',
			 defaultDate: 'moment',
			 //minDate: moment(),
		});
    	
 		var defaultDate = new Date();
		defaultDate.setDate(defaultDate.getDate());
    	$( "#dateTimeTo" ).datetimepicker({
			 //viewMode: 'days',
			 format : 'DD-MM-YYYY',
			 defaultDate: defaultDate,
			 //minDate: moment(),
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
            
            var tempdate = new Date(e.date);
			tempdate.setDate(tempdate.getDate());
            $('#dateTimeTo').data("DateTimePicker").minDate(tempdate);
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
    	dt=$("#tdResult").dataTable();
 	
 		listAll();
 		
     	$("#addModal").on("show.bs.modal", function(event){
    		var button = $(event.relatedTarget);
    		proId = button.data("proid");
    		var d = new Date($('#dateTimeFrom').data("DateTimePicker").date());
 			d.setDate(d.getDate()+1);
     		$('#dateTimeTo').data("DateTimePicker").minDate(d);
     		$('#dateTimeTo').data("DateTimePicker").date(d);
    		if(proId != null){
				initEditProbation(proId);
			}
     		
    		$(this).find(".saveButton").off("click").on("click", function()
    		{
    			if(proId != null){
					$('#validate').bootstrapValidator();
    				$('#validate').data('bootstrapValidator').validate();
    				if($('#validate').data('bootstrapValidator').isValid()){
    					editProbation();
    				}
    				
    			}
    			else {
					$('#validate').bootstrapValidator();
    				$('#validate').data('bootstrapValidator').validate();
    				if($('#validate').data('bootstrapValidator').isValid()){
    					addProbation();
    				}
    			}
    			
    		});
    		
    		$(this).find(".closeButton").off("click").on("click",function() {
				$('#validate').bootstrapValidator('resetForm', true);
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
    					//$("#message").html('<div class="alert alert-success" role="alert">Success</div>').delay(200).fadeIn().delay(4000).fadeOut();
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
    				}/* ,
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
                        //alert("ERROR");
    				    //$('#addModal').modal('toggle');
    					//$("#message").html('<div class="alert alert-danger" role="alert">Error</div>').delay(200).fadeIn().delay(4000).fadeOut(); 
    					} */
    				});
    		}
    		
    		function initEditProbation(proId) {
				//alert(proId+" Init edit");
				$.ajax({
					url : "${pageContext.request.contextPath}/probation/initEdit/"+proId,
					type : "POST",
					success : function(data) {
							//$('#validate').bootstrapValidator('revalidateField', '#status');
							id:proId;
							$("#dateFrom").val(data.dateFrom);
							$("#dateTo").val(data.dateTo);
							$("#status").val(data.status);
							$("#reason").val(data.reason);
							employeeId: data.employeeId; 
					}/* ,
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
						//alert("ERROR");
						//$("#message").html('<div class="alert alert-danger" role="alert">Error</div>').delay(200).fadeIn().delay(4000).fadeOut();
						} */
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
						//$('#validate').bootstrapValidator('revalidateField', '#status');
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
						//$("#message").html('<div class="alert alert-success" role="alert">Success</div>').slideDown('fast').delay(5000).fadeOut().delay(4000);
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
					}/* ,
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
    					//$('#validate').bootstrapValidator('validating');
    					//$('#validate').bootstrapValidator('revalidateField', '#status');
						//alert("ERROR");
    					//$('#addModal').modal('toggle');
						//$("#message").html('<div class="alert alert-danger" role="alert">Error</div>').delay(200).fadeIn().delay(4000).fadeOut();
						} */
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
							$(function(){ new PNotify({
								title: 'Success',
								type: 'success',
								animation: {
									effect_in: 'show',
									effect_out: 'slide'
								}
								});
							});
							//$("#message").html('<div class="alert alert-success" role="alert">Success</div>').delay(200).fadeIn().delay(4000).fadeOut();		
							/* var del = button.closet("tr");
							dt.fnDeleteRow(del); */
							listAll();
						}/* ,
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
							//alert("ERROR");
							//$("#message").html('<div class="alert alert-danger" role="alert">Error</div>').delay(200).fadeIn().delay(4000).fadeOut();
							} */
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
							 '<button type="button" style="margin-right :15px;" class="btn btn-warning btn-sm active" data-proId="' + data[i].id + '" data-target="#addModal" data-toggle="modal"><spring:message code="label.edit" /></button>'+
							'<button type="button" class="btn btn-danger btn-sm active" data-proId="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal"><spring:message code="label.delete" /></button>']);
				 
						}
					}/* ,
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
						} */
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
