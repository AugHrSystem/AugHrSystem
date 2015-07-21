<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jsp:include page="../employeeMenu.jsp"></jsp:include>
<style>
.required:after {
  margin-bottom: 0px;
  content:"*";
  color:red;
}
</style>
<input id="empId" type="hidden" value="${id}">

<form:form id ="listForm" method="post" commandName="history">

<!-- <div class="row"> -->
<!-- <div class="col-md-6"> -->
<%-- <h2><spring:message code="history.name" /></h2>  --%>
<!-- </div> -->
<br>

<!-- Button trigger modal -->
<!-- <div class="form-group" align="left"> -->
<!-- <div class="col-md-12"> -->
<%-- <button type="button" id="addBtnHis" class="btn btn-warning active" data-toggle="modal" data-target="#addModal"><spring:message code="label.newRecord" /></button>  --%>
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->

<!-- Table -->
<div class="form-group">
<table id="tbResult" class="dataTable stripe table-bordered">
<caption title=""><spring:message code="history.name" /></caption>
	<thead>
		<tr>
			<th><spring:message code="history.dateOfAdjustment" var="dateOfAdjustment"/>${dateOfAdjustment }</th>
			<th><spring:message code="history.position" var="position"/>${position }</th>
			<th><spring:message code="history.salary" var="salary"/>${salary }</th>
			<th><spring:message code="history.reasonOfAdjustment" var="reasonOfAdjustment"/>${reasonOfAdjustment }</th>
			<th><spring:message code="label.action" /></th>
			<!-- <th></th> -->
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="history">

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span id="closeX" aria-hidden="true">x</span></button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="history.name" /></h4>
      </div>
      
      <div class="modal-body row">
        
        <spring:message code="default.date" var="date"/>
   		<spring:message code="default.enter" var="enter"/>
   		
      <div class="form-group col-md-6">
	    <label class="required">${dateOfAdjustment } : </label>
	    <div class='input-group date' id='datetimepicker1'>
	    <form:input path="dateOfAdjustment" type="text" class="form-control" name="dateOfAdjustment" id="dateOfAdjustment" placeholder="${date }"/>
	  	<span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
	  	
	  	</div>
	  </div>
	    
	  <div class="form-group col-md-6">
	    <label class="required">${position } : </label>
	    <form:input path="position" type="text" class="form-control" id="position" name="position" placeholder="${enter }${position }" />
	  </div>
	  
	  <div class="form-group col-md-6">
	    <label class="required">${ salary} : </label>
	    <form:input path="salary" type="text" class="form-control" id="salary" name="salary" placeholder="${enter }${salary }"/>
	  </div>
	  
	  <div class="form-group col-md-6">
	    <label><spring:message code="history.oldSalary" var="oldSalary"/>${oldSalary } :</label>
	    <form:input path="oldSalary" type="text" class="form-control" id="oldSalary" name="oldSalary" placeholder="${enter }${oldSalary }"/>
	  </div>
	  
	  <div class="form-group col-md-6">
	    <label>${reasonOfAdjustment } :</label>
	    <form:textarea path="reasonOfAdjustment" type="text" class="form-control" name="reasonOfAdjustment" id="reasonOfAdjustment" placeholder="${enter }${reasonOfAdjustment }"/>
	  </div>
	  
	  <%-- <div class="form-group col-md-6">
	    <label>Adjustment Time :</label>
	    <form:input path="adjustmentTime" type="text" class="form-control" id="adjustmentTime" placeholder="Enter Adjustment Time"/>
	  </div> --%>
	  

      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default  btnClose" data-dismiss="modal"><spring:message code="label.close" /></button>
      	<button type="button" class="btn btn-info active btnSave"><spring:message code="label.save" /></button>
      </div>
      
    </div>
  </div>
</div>

</form:form>

<form:form id="deleteForm" commandName="history" method="post">

		<!-- Modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel"><spring:message code="history.name" /></h4>
					</div>
					<div class="modal-body">
						<h4><spring:message code="default.delete.confirm" /></h4>
						<form:hidden path="id"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger btnYes"><spring:message code="default.yes" /></button>
						<button type="button" class="btn btn-info active" data-dismiss="modal"><spring:message code="default.no" /></button>
					</div>
				</div>
			</div>
		</div>

</form:form>


<script type="text/javascript">

	var dt;
	
	$(document).ready(function(){
		
		$("#addBtnHis").on("click",function(){
			
// 			$(this).removeData('bs.modal');
// 			$('#addForm').bootstrapValidator('resetForm', true);
			clearModal();
// 			bootstrapValidator('validate').hide();
			
			
		});
		
// 		$("#addModal").on("click",function(){
			
// 			clearModal();
			
// 		});
		
		$("#closeX").on("click",function(){
			
			clearModal();
			
		});
		
		$('#dateOfAdjustment').mask("99-99-9999",{placeholder:"DD-MM-YYYY"});
		
		$('#salary').mask('0,000,000.00', {reverse: true});
// 		$('.money').mask('000.000.000.000.000,00', {reverse: true});
// 		$('#salary').autoNumeric('init', {'dGroup': 3});
// 		$('#oldSalary').autoNumeric('init', {'dGroup': 3});
		$('#oldSalary').mask('0,000,000.00', {reverse: true});
		
		$('#addForm').bootstrapValidator({
//	        live: 'disabled',
	        message: 'This value is not valid',
	        container: 'tooltip',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	position: {
	                validators: {
	                    notEmpty: {
	                        message: '<spring:message code="history.required.position" />'
	                    },
				        regexp: {
			                regexp: /^[a-z\s]+$/i,
			                message: '<spring:message code="history.required.position" />'
			            }
	                }
	            },
	            salary: {
	                validators: {
	                    notEmpty: {
	                        message: '<spring:message code="history.required.salary" />'
	                    },
	                    regexp: {
			                regexp: /^[0-9,.\s]+$/i,
			                message: '<spring:message code="history.required.salary" />'
			            }
	                }
	            },
// 	            oldSalary: {
// 	                validators: {
// 	                    notEmpty: {
// 	                        message: 'The old salary is required and cannot be empty'
// 	                    },
// 	                    digits: {
// 	                    	message: 'The old salary is number'
// 	                    },
// 	                }
// 	            },
	            dateOfAdjustment: {
	                validators: {
	                    notEmpty: {
	                        message: '<spring:message code="history.required.dateOfAdjustment" />'
	                    },
	                    date: {
	                        format: 'DD-MM-YYYY'
	                    }
	                }
	            }
// 	            reasonOfAdjustment: {
// 	                validators: {
// 	                    notEmpty: {
// 	                        message: 'The reason of adjustment is required and cannot be empty'
// 	                    }
// 	                }
// 	            },
	            /* adjustmentTime: {
	                validators: {
	                    notEmpty: {
	                        message: 'The adjustment time is required and cannot be empty'
	                    },
	                    digits: {
	                    	message: 'The adjustment time is number'
	                    },
	                }
	            } */
	        }
	    });
	   
		$('#datetimepicker1')
        .on('dp.change dp.show', function(e) {
            // Validate the date when user change it
            $('#addForm')
                // Get the bootstrapValidator instance
                .data('bootstrapValidator')
                // Mark the field as not validated, so it'll be re-validated when the user change date
                .updateStatus('dateOfAdjustment', 'NOT_VALIDATED', null)
                // Validate the field
                .validateField('dateOfAdjustment');
        });
		
		$('#datetimepicker1').datetimepicker({
			 
			 format : 'DD-MM-YYYY',
// 			 minDate: 'moment'
			 
		 });
		
		$('#tbResult').dataTable({ 
			"bLengthChange": false,
			"iDisplayLength": 10,
			"pagingType": "simple_numbers",
			"ordering": false,
			"info": false,
			"dom": '<"toolbar">frtip'
		});
		
		$("div.toolbar").html('<b><button type="button" id="addBtnHis" class="btn btn-warning" data-toggle="modal" data-target="#addModal"><spring:message code="label.newRecord" /></button> </b>');
		
		dt = $('#tbResult').dataTable();
		listAll();
		
		/* --- addProduct,updateProduct --- */
		$("#addModal").on("show.bs.modal",function(event) {
			
			//clearModal();
			 
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var historyid = button.data("id") //Extract info from data-* attribute
			
			if(historyid != null){
				getId(historyid);
			} 
			
			$(this).find(".btnSave").off("click").on("click",function() {
				$("#salary").val($("#salary").val().replace(/[\(\)-]/g, ""));
				if(historyid != null){
					$('#addForm').bootstrapValidator();
    				$('#addForm').data('bootstrapValidator').validate();
    				if($('#addForm').data('bootstrapValidator').isValid()){
						updateHistory(button, historyid);
    				}
				}else{
					$('#addForm').bootstrapValidator();
    				$('#addForm').data('bootstrapValidator').validate();
    				if($('#addForm').data('bootstrapValidator').isValid()){
    					
						addHistory();
    				}
				 }
			});
			
			$(this).find(".btnClose").off("click").on("click",function() {
				$('#addForm').bootstrapValidator('resetForm', true);
			});
			
		});
		
		/* --- DeleteName --- */
		$("#deleteModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var historyid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".btnYes").off("click").on("click",function() {
				deleteHistory(button, historyid);
			});
			
		});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */
		
		
    
		function clearModal(){
			$("#position").val("");
			$("#salary").val("");
			$("#oldSalary").val("");
			$("#dateOfAdjustment").val("");
			$("#reasonOfAdjustment").val("");
// 			$("#adjustmentTime").val("");
		}
		
		function addHistory(){
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/history/add",
				data : JSON.stringify({
					position : $("#position").val(),
					salary :$("#salary").val().replace(/[\(\)\,-]/g, ""),
					oldSalary :$("#oldSalary").val().replace(/[\(\)\,-]/g, ""),
					dateOfAdjustment :$("#dateOfAdjustment").val(),
					reasonOfAdjustment :$("#reasonOfAdjustment").val(),
// 					adjustmentTime :$("#adjustmentTime").val(),
					employeeId: id
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
					
					$('#addForm').bootstrapValidator('resetForm', true);
//	 				alert(JSON.stringify(data));
						
// 					dt.fnClearTable();
					
// 					dt.fnAddData([
// 						/* $("#Name").val(),
// 						$("#ProductCategory").val(),
// 						$("#Unit").val(),
// 						$("#Price").val(),
// 						$("#Description").val(), */
// 						data.position,
// 						data.salary,
// 						data.oldSalary,
// 						data.dateOfAdjustment,
// 						data.reasonOfAdjustment,
// 						data.adjustmentTime,
// 						/* data.company,
// 						data.salary,
// 						data.time, */
						
// 						'<button type="button" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > Edit</button>',
// 						'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> Delete</button>'
// 					]);
					
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
					listAll();
					
				},
				error : function() {
					$(function(){ new PNotify({
					    title: 'Error!',
					    type: 'error',
						animation: {
							effect_in: 'show',
							effect_out: 'slide'
						}
						});
					});
// 					alert("ERROR");
// 					$('#addForm').bootstrapValidator('validate');
				}
			});
		}
		
		function updateHistory(button, historyid){
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/history/update",
				data : JSON.stringify({
					id : historyid,
					position : $("#position").val(),
					salary :$("#salary").val().replace(/[\(\)\,-]/g, ""),
					oldSalary :$("#oldSalary").val().replace(/[\(\)\,-]/g, ""),
					dateOfAdjustment :$("#dateOfAdjustment").val(),
					reasonOfAdjustment :$("#reasonOfAdjustment").val(),
// 					adjustmentTime :$("#adjustmentTime").val(),
					employeeId : id
					/* company :$("#company").val(),
					salary :$("#salary").val(),
					time :$("#time").val(), */
					
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
//	 					alert(JSON.stringify(data));
					$('#addForm').bootstrapValidator('resetForm', true);
// 					var tr = button.closest("tr")
					
// 					dt.fnUpdate(data.position,tr,0);
// 					dt.fnUpdate(data.salary,tr,1);
// 					dt.fnUpdate(data.oldSalary,tr,2);
// 					dt.fnUpdate(data.dateOfAdjustment,tr,3);
// 					dt.fnUpdate(data.reasonOfAdjustment,tr,4);
// 					dt.fnUpdate(data.adjustmentTime,tr,5);
// 					/* dt.fnUpdate(data.company, tr ,1);
// 					dt.fnUpdate(data.salary, tr ,2);
// 					dt.fnUpdate(data.time, tr ,3); */
					
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
					listAll();
				},
				error : function() {
// 					alert("ERROR");
					$(function(){ new PNotify({
					    title: 'Error!',
					    type: 'error',
						animation: {
							effect_in: 'show',
							effect_out: 'slide'
						}
						});
					});

// 					$('#addForm').bootstrapValidator('validate');

				}
			});
		}
		
		function getId(historyid){
			$.ajax({
				url : "${pageContext.request.contextPath}/history/findById",
				data : "historyid=" + historyid,
				type : "POST",
				success : function(data) {
	 				//alert(JSON.stringify(data));
					//alert("ok");
					$("#position").val(data.position);
					$("#salary").val(accounting.formatNumber(data.salary));
					$("#oldSalary").val(accounting.formatNumber(data.oldSalary));
// 					$("#salary").autoNumeric('set',data.salary);
// 					$("#oldSalary").autoNumeric('set',data.oldSalary);
					$("#dateOfAdjustment").val(data.dateOfAdjustment);
					$("#reasonOfAdjustment").val(data.reasonOfAdjustment);
// 					$("#adjustmentTime").val(data.adjustmentTime);
					
					/* employee: {id: data.position } */
					/* $("#company").val(data.company),
					$("#salary").val(data.salary),
					$("#time").val(data.time); */
			
				},
				error : function() {
// 					alert("ERROR");
					$(function(){ new PNotify({
					    title: 'Error!',
					    type: 'error',
						animation: {
							effect_in: 'show',
							effect_out: 'slide'
						}
						});
					});
				}
			});
		}
		
		function deleteHistory(button, historyid){
			$.ajax({
				url : "${pageContext.request.contextPath}/history/delete",
				data : "historyid=" + historyid,
				type : "POST",
				success : function(data) {
//	 					alert(JSON.stringify(data));
					
					var tr = button.closest("tr")
					
					dt.fnDeleteRow(tr);
					
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
					listAll();
					
				},
				
				error : function() {
// 					alert("ERROR");
					$(function(){ new PNotify({
					    title: 'Error!',
					    type: 'error',
						animation: {
							effect_in: 'show',
							effect_out: 'slide'
						}
						});
					});
				}
			});
		}
		
		/* function listAll(){
			$.ajax({
				url : "${pageContext.request.contextPath}/history/listAll",
				type : "POST",
				success : function(data) {
					dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([data[i].position,
					              data[i].salary,data[i].oldSalary, 
					              data[i].dateOfAdjustment,data[i].reasonOfAdjustment,data[i].adjustmentTime,
						'<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
						'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
			
					}
				},
				error : function() {
					alert("ERROR");
				}
			}); 
		} */
		
		function listAll(){
			
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/history/listAll/"+id,
				type : "POST",
				success : function(data) {
					dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([
								  data[i].dateOfAdjustment,
					              data[i].position,
					              accounting.formatNumber(data[i].salary),
					              data[i].reasonOfAdjustment,
						 '<button type="button" style="margin-right :15px;" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal"><spring:message code="label.edit" /></button>'+
						'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal"><spring:message code="label.delete" /></button>']);
			 
					}
				},
				error : function() {
					alert("ERROR");
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
