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
		<form:form id ="listForm" method="post" commandName="punish">	
			<div class="row">
			<h2 class="col-md-6"><spring:message code="punish.name" /></h2>
			<br>
					<div class="col-md-6" align="right">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-info" data-toggle="modal" data-target="#addModal">
					<spring:message code="label.newRecord" />
					</button> 
					<br>
					<br>
					</div>
			</div>	
				<div>
				<table id="tbResult" class="table">
					<thead>					
						<tr>								
							<th><spring:message code="punish.dateform" /></th>
							<th><spring:message code="punish.description" /></th>	
							<th><spring:message code="punish.penalty" /></th>				
							<th><spring:message code="label.action" /></th>
<!-- 							<th></th> -->
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>		
	   </form:form>		

	<form:form id ="addForm" method="post" commandName="punish">
	
	<!-- ---------------------------------------Modal------------------------------------------------------------------ -->
	
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">		
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">			
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       					 <h4 class="modal-title" id="addModalLabel"><spring:message code="punish.name" /></h4>
      					</div>
														
														
																														
				<div class="col col-lg-12 " style="padding-top: 10px">		
				    <div class="form-group "  align="left">
				    
				    		 <spring:message code="default.date" var="date"/>
   							 <spring:message code="default.enter" var="enter"/>
   							 
							<label class="required" ><spring:message code="punish.dateform" var="dateform"/>${dateform} :</label>
						<div class='input-group date' id='datetimepicker1'>
	   						 <form:input path="datepunish" type="text" class="form-control" id="datepunish"  placeholder="${date}"/>
	  						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>	  	
					  	</div>													
				    </div>	
				    		  
				    		    
				    <div class="form-group "  align="left">
							<label class="required" ><spring:message code="punish.description" var="description"/>${description} :</label>
							<form:input path="description" type="text" class="form-control" id="description" placeholder="${enter}${description}"/>							
				    </div>	
				    	
				     <div class="form-group "  align="left">
							<label class="required" ><spring:message code="punish.penalty" var="penalty"/>${penalty} :</label>
							<form:input path="penalty" type="text" class="form-control" id="penalty" placeholder="${enter}${penalty}"/>							
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
	  
<!------------------------------------------Button  modal 2----------------------------------------------------->
	<form:form id="deleteForm" commandName="punish" method="post">		
		
		<div class="modal fade" id="deleteModal" tabindex ="-1" role ="dialog" aria-labelledby ="myModalLabel" aria-hidden ="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-body">

						<label ><spring:message code="default.delete.confirm" /></label>

					</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-danger DeleteButton"><spring:message code="default.yes" /></button>
						  <button type="button" class="btn btn-info" data-dismiss ="modal"><spring:message code="default.no" /></button>
					   </div>
				</div>
			</div>			
		</div>
	</form:form>
		   
<script type="text/javascript">

	var dt;
	$(document).ready(function() {
		
		$('#datepunish').mask("99-99-9999",{placeholder:"DD-MM-YYYY"});
		
		$('#tbResult').dataTable({ 
			"bLengthChange": false,
			"iDisplayLength": 10,
			"pagingType": "simple_numbers",
			"ordering": false,
			"info": false
		});
		
		$("#addBtn").on("click",function(){clearModal();});
		
			
		$('#addForm').bootstrapValidator({
//	        live: 'disabled',
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	
	         	datepunish: {
	                validators: {
	                    notEmpty: {
	                    	message: '<spring:message code="punish.required.date" />'
	                    },
	                    date: {
	                        format: 'DD-MM-YYYY'
	                    }
	                   
	                }
	            }, 
	            description: {
	                validators: {
	                    notEmpty: {
	                    	message: '<spring:message code="punish.required.description" />'
	                    }
	                }
	            },
	          
	        }
	    });
		
		$('#datetimepicker1')
        .on('dp.change dp.show', function(e) {
            // Validate the date when user change it
            $('#addForm')
                // Get the bootstrapValidator instance
                .data('bootstrapValidator')
                // Mark the field as not validated, so it'll be re-validated when the user change date
                .updateStatus('datepunish', 'NOT_VALIDATED', null)
                // Validate the field
                .validateField('datepunish');
        });
		
		$('#datetimepicker1').datetimepicker({
			 
			 format : 'DD-MM-YYYY',
// 			 minDate: 'moment'
			 
		 });
	
		dt = $('#tbResult').dataTable();	
		 listAll();
		 
		$("#addModal").on("show.bs.modal",function(event) {
						
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var punishid = button.data("id") //Extract info from data-* attribute
						
			 if(punishid != null){				 
				 getpunishById(punishid);
			} 
						
			$(this).find(".btnSave").off("click").on("click",function() {
				
				 if(punishid != null){
					updatepunish(button, punishid);
				}else{ 
					addpunish();
					
				 } 
				 
		       });
				 $(this).find(".btnClose").off("click").on("click",function() {
						$('#addForm').bootstrapValidator('resetForm', true);
			});
			
		});
		
		
//		------------------------------------------------------------------------------------------------------------

	 	$("#deleteModal").on("show.bs.modal", function (event) {
				
	 			var button = $(event.relatedTarget); // select การกระทำของปุ่ม
	 			var punishid = button.data("id"); //กดไอดีฝังในปุ่ม 
				
		
	 			$(this).find('.DeleteButton').off('click').on("click", function() {
								
	 					deleteById(button ,punishid);
	 
	 				})
					
	 			})
		});
								
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */
		function clearModal(){
			$("#datepunish").val(""),
			$("#description").val("");
			$("#penalty").val("");
		
		}

		function addpunish(){
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/punish/add",
				data : JSON.stringify({
					datepunish : $("#datepunish").val(),
					description :$("#description").val(),
					penalty :$("#penalty").val(),	
					employeeId : id		
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {

					$('#addForm').bootstrapValidator('resetForm', true);
					dt.fnClearTable();					
					dt.fnAddData([             
								
									data.datepunish,
									data.description,	
									data.penalty,
						'<button type="button" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > Edit</button>',
						'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> Delete</button>'
					]);
					
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
					//	alert("error");
					
					$('#addForm').bootstrapValidator('validate');
				}
			});
		}
		
		
		
		function updatepunish(button,punishid) {
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			$.ajax({
				url:'${pageContext.request.contextPath}/punish/update',			
				data: JSON.stringify({    //แปลงจาก obj ของจาวาสคริปให้ไปเป็น string  ของเจสัน
					
								id :punishid,
								datepunish: $("#datepunish").val(),	
								description: $("#description").val(), 
								penalty: $("#penalty").val(), 
								employeeId: id 
											
					}),
					type:"POST",
					contentType:"application/json",
					datatype: "json",
					success : function(data) {
						
					var tr = button.closest("tr"); // หาเเถวจากปุ่ม
						
					
					dt.fnUpdate(data.datepunish, tr, 0),
					dt.fnUpdate(data.description, tr, 1),
					dt.fnUpdate(data.penalty, tr, 2),
				
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
					error : function(jqXHR,	textStatus,	error) {
						$(function(){ new PNotify({
						    title: 'Error!',
						    type: 'error',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							}
							});
						});
// 							alert("error");
					}
			});
			
		}
		
		
		
		function getpunishById(punishid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/punish/findById/"+ punishid,
				//data : "id=" +punishid,
				type : "POST", 
				success : function(data) {
					$("#datepunish").val(data.datepunish); 
					$("#description").val(data.description);
					$("#penalty").val(data.penalty);
					employeeId: data.employeeId;
					
					},
				error : function(jqXHR,	textStatus,	error) {
					$(function(){ new PNotify({
					    title: 'Error!',
					    type: 'error',
						animation: {
							effect_in: 'show',
							effect_out: 'slide'
						}
						});
					});
// 						alert("error");
									}
							});
						}	
		
		
		
		function deleteById(button,punishid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/punish/delete/"+ punishid,
				//data : "id=" +punishid,
				type : "POST", 
				success : function(data) {				
					/* var tr = button.closest("tr"); // หาเเถวจากปุ่ม											
					dt.fnDeleteRow(tr); */					
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
				error : function(jqXHR,	textStatus,	error) {
					$(function(){ new PNotify({
					    title: 'Error!',
					    type: 'error',
						animation: {
							effect_in: 'show',
							effect_out: 'slide'
						}
						});
					});
// 						alert("error ----");
						}
				});							
		}
		
		
		
			function listAll(){
				
// 				var id = getUrlParameter('Id');
				//alert("id >>>>"+id);	
				var id = $("#empId").val();
				$.ajax({
					url : "${pageContext.request.contextPath}/punish/listAll"+id,
					type : "POST",
					success : function(data) {
						dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([data[i].datepunish,
						              data[i].description, 	
						              data[i].penalty, 					             
							'<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>'+
							'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
				
						}
					},
					error : function(jqXHR,	textStatus,	error) {	
						$(function(){ new PNotify({
						    title: 'Error!',
						    type: 'error',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							}
							});
						});
// 							alert("error");
						}
					}); 
			}
			
			
			
			function getUrlParameter(sParam){
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
	
	
	
</script>
	
