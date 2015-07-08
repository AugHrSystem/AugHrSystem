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

<form:form id ="listForm" method="post" commandName="allowances">

<div class="row">
<div class="col-md-6">
<h2><spring:message code="allowances.name" /></h2> 
</div>
<br>

<!-- Button trigger modal -->
<div class="form-group" align="right">
<div class="col-md-6">
<button type="button" id="addBtnAll" class="btn btn-info" data-toggle="modal" data-target="#addModal"><spring:message code="label.newRecord" /></button> 
</div>
</div>
</div>

<!-- Table -->
<div class="form-group">
<table id="tbResult" class="dataTable stripe">
	<thead>
		<tr>
			<th><spring:message code="allowances.masallowances" /></th>
			<th><spring:message code="allowances.amount" /></th>
			<th><spring:message code="label.action" /></th>
			<!-- <th></th> -->
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="allowances">

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="allowances.name" /> </h4>
      </div>
      
      <div class="modal-body">
        
	  <div class="form-group">
	    <label class="required"><spring:message code="allowances.masallowances" /> : </label>
	    <form:select path="masallowances" class="form-control"
			id="masallowances" name="masallowances" onchange="myFunction(this.value)">
			<option value=""><spring:message code="allowances.enter.allowances" /></option>
			<c:forEach var="obj" items="${ masallowancesList }">
				<option value="${obj.id }">${ obj.allowances_type}</option>
			</c:forEach>
		</form:select>
	  </div>
	  
	  <div class="form-group">
	    <label><spring:message code="allowances.amount" var="amount"/>${amount } : </label>
	    <form:input path="amount" type="text" class="form-control" id="amount" name="amount" placeholder="${enter }${amount }"/>
	  </div>
	  
      </div>
      
      <div class="form-group" align="center">
        <button type="button" class="btn btn-default btnClose" data-dismiss="modal"><spring:message code="label.close" /></button>
      	<button type="button" class="btn btn-info btnSave"><spring:message code="label.save" /></button>
      </div>
      
    </div>
  </div>
</div>

</form:form>

<form:form id="deleteForm" commandName="allowances" method="post">

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
						<h4 class="modal-title" id="myModalLabel"><spring:message code="allowances.name" /></h4>
					</div>
					<div class="modal-body">
						<h4><spring:message code="default.delete.confirm" /></h4>
						<form:hidden path="id"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger btnYes"><spring:message code="default.yes" /></button>
						<button type="button" class="btn btn-info" data-dismiss="modal"><spring:message code="default.no" /></button>
					</div>
				</div>
			</div>
		</div>

</form:form>


<script type="text/javascript">

function myFunction(value) {
	
// 	alert(value);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/allowances/findByIdMas",
		data : "masAllowancesid=" + value,
		type : "POST",
		success : function(data) {
				//alert(JSON.stringify(data));
			//alert("ok");
			$("#amount").val(data.amount_allowances);
			
			/* employee: {id: data.position } */
			/* $("#company").val(data.company),
			$("#salary").val(data.salary),
			$("#time").val(data.time); */
	
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
// 			alert("ERROR");
		}
	});
	
//		if (value == 1){
//			document.getElementById("amount").value = "30000";
//	    } 
}

</script>

<script type="text/javascript">

	var dt;
	
	$(document).ready(function(){
		
		$("#addBtnAll").on("click",function(){clearModal();});
		
		$('#amount').mask('0,000,000.00', {reverse: true});
		
		$('#addForm').bootstrapValidator({
//	        live: 'disabled',
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	masallowances: {
	                validators: {
	                    notEmpty: {
	                        message: '<spring:message code="allowances.required.masallowances" />'
	                    }
	                   
	                }
	            },
	            /* amount: {
	                validators: {
	                    notEmpty: {
	                        message: 'The amount is required and cannot be empty'
	                    }
	                }
	            }, */
	        }
	    });
		
		
		
		$('#tbResult').dataTable({ 
			"bLengthChange": false,
			"iDisplayLength": 10,
			"pagingType": "simple_numbers",
			"ordering": false,
			"info": false
		});
		
		dt = $('#tbResult').dataTable();
		listAll();
		
		/* --- addProduct,updateProduct --- */
		$("#addModal").on("show.bs.modal",function(event) {
			
			//clearModal();
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var allowancesid = button.data("id") //Extract info from data-* attribute
			
			if(allowancesid != null){
				getId(allowancesid);
			} 
			
			$(this).find(".btnSave").off("click").on("click",function() {
				if(allowancesid != null){
					$('#addForm').bootstrapValidator();
    				$('#addForm').data('bootstrapValidator').validate();
    				if($('#addForm').data('bootstrapValidator').isValid()){
    					updateAllowances(button, allowancesid); 
    				}	
				}else{
					
					$('#addForm').bootstrapValidator();
    				$('#addForm').data('bootstrapValidator').validate();
    				if($('#addForm').data('bootstrapValidator').isValid()){
    					addAllowances();
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
			var allowancesid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".btnYes").off("click").on("click",function() {
				deleteAllowances(button, allowancesid);
			});
			
		});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */
		
		function clearModal(){
			$("#masallowances").val("");
			$("#amount").val("");
		}
		
		function addAllowances(){
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/allowances/add",
				data : JSON.stringify({
					masAllowancesId : $("#masallowances").val(), 
					masallowances : $("#masallowances option:selected").text(),
					amount :$("#amount").val().replace(/[\(\)\,-]/g, ""),
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
// 						data.masallowances,
// 						data.amount,
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
				}
			});
		}
		
		function updateAllowances(button, allowancesid){
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/allowances/update",
				data : JSON.stringify({
					id : allowancesid,
					masAllowancesId : $("#masallowances").val(), 
					masallowances : $("#masallowances option:selected").text(),
					amount :$("#amount").val().replace(/[\(\)\,-]/g, ""),
					employeeId : id
					/* company :$("#company").val(),
					salary :$("#salary").val(),
					time :$("#time").val(), */
					
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
					$('#addForm').bootstrapValidator('resetForm', true);
//	 					alert(JSON.stringify(data));
					
// 					var tr = button.closest("tr")
					
// 					dt.fnUpdate(data.masallowances,tr,0);
// 					dt.fnUpdate(data.amount,tr,1);
					/* dt.fnUpdate(data.company, tr ,1);
					dt.fnUpdate(data.salary, tr ,2);
					dt.fnUpdate(data.time, tr ,3); */
					
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
				}
			});
		}
		
		function getId(allowancesid){
			$.ajax({
				url : "${pageContext.request.contextPath}/allowances/findById",
				data : "allowancesid=" + allowancesid,
				type : "POST",
				success : function(data) {
	 				//alert(JSON.stringify(data));
					//alert("ok");
					$("#masallowances").val(data.masAllowancesId);
					$("#amount").val(data.amount);
					
					/* employee: {id: data.position } */
					/* $("#company").val(data.company),
					$("#salary").val(data.salary),
					$("#time").val(data.time); */
			
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
				}
			});
		}
		
		function deleteAllowances(button, allowancesid){
			$.ajax({
				url : "${pageContext.request.contextPath}/allowances/delete",
				data : "allowancesid=" + allowancesid,
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
				url : "${pageContext.request.contextPath}/allowances/listAll/"+id,
				type : "POST",
				success : function(data) {
					dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([
					              data[i].masallowances,
					              data[i].amount,
						 '<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal"><spring:message code="label.edit" /></button>'+
						'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal"><spring:message code="label.delete" /></button>']);
			 
			 
			 
					             
					}
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

