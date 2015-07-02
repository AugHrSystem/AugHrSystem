<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>


<jsp:include page="../employeeMenu.jsp"></jsp:include>

<%-- 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- jquery-->
<script src="<c:url value="/resources/resource/bootstrap/js/jquery-1.11.2.js" />"></script> 
<script src="<c:url value="/resources/resource/bootstrap/js/jquery.validate.js" />"></script>
<script src="<c:url value="/resources/resource/bootstrap/js/additional-methods.js" />"></script>

<!-- validate -->
<link href="<c:url value="/resource/bootstrapvalidator/dist/css/bootstrapValidator.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrapvalidator/dist/js/bootstrapValidator.js" />"></script>

<!-- bootstrap version 3.3.4-->
<link href="<c:url value="/resources/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resources/resource/bootstrap/js/bootstrap.js" />"></script>


<!-- datatable version 1.10.6 -->
<script src="<c:url value="/resources/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resources/resource/bootstrap/css/dataTables.bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resources/resource/bootstrap/js/dataTables.bootstrap.js" />"></script> --%>


 
<style type="text/css">

.required:after {
  margin-bottom: 0px;
  content:"*";
  color:red;
}  

</style>

<input id="empId" type="hidden" value="${id}">
<script>

    var dt;
    var idUpdate;
    var idDelete ;
   
	$(document).ready(function(){
		
	
		
		/* $("#saveBtn").on("click",function(){
			
			$('#formAdd').bootstrapValidator('resetForm', true);

		});
		
		
		 
		 $("#formAdd").bootstrapValidator({
			   
			   message: 'This value is not valid',
		        //container: 'tooltip',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	
		        	firstName: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="family.required.firstName" />'
		                    }
		                }
		            },
		            lastName: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="family.required.lastName" />'
		                    }
		                }
		            },
		            age: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="family.required.age" />'
		                    },
		                    digits: {
		                    	message: '<spring:message code="family.required.age.num" />'
		                    },
		                }
		            },
		            mobile: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="family.required.mobile" />'
		                    },
		                  
		                }
		            },
		            address: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="family.required.address" />'
		                    },
		                  
		                }
		            },
		            masRelation: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="family.required.masRelation" />'
		                    },
		                  
		                  
		                }
		            },
		        }
		 
    });
			
		 $('#mobile').mask("999-999-9999",{placeholder:"xxx-xxx-xxxx"}); */
		 
		 $('#tableResult').dataTable({ 
				"bLengthChange": false,
				"iDisplayLength": 10,
				"pagingType": "simple_numbers",
				"ordering": false,
				"info": false
			});

	      dt = $('#tableResult').dataTable();  	
	      
	      doFindData();
	      
	      
		 function clearModal() {
	    	  
	          $(this).removeData('bs.modal');
	          $('#firstName').val("");
	          $('#lastName').val("");
	          $("#genderMale").prop("checked", true);
	          $('#lastName').val("");
	          $('#address').val("");
	          $('#relation').val("");
	          $('#occupation').val("");
	          $('#position').val("");
	          $('#age').val("");
	          $('#mobile').val("");
	          $('#masRelation').val("");
	          
	      } 
	      
		
	      function doFindData() {  
		   	   
// 	    	     var id = getUrlParameter('Id');
	    	     var id = $("#empId").val();
		  	     $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/family/list/"+id,   
		  	      dataType : 'json', 
		  	      contentType :"application/json; charset=utf-8",
		  	     
		  	      success : function(data) {  
		    		
		  	      //status="unmodified" 
		  	    	
		  	    
		  	        dt.fnClearTable();
		  	    	
		  	        for(var i=0;i<data.length;i++){
		  	        	//alert(data[i].id);
		  	        	
		  	        	
			  			 	
			  			        
		  	        	   dt.fnAddData([  
					  			           data[i].firstName+" "+data[i].lastName,					  			          
					  			           data[i].occupation,
					  			           data[i].mobile,
					  			           data[i].masRelationTypeName,
					  			          '<button type="button" class="btn btn-warning btn-sm active" data-idupdate="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>'+
					    				  '<button type="button" class="btn btn-danger btn-sm active" data-iddelete="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>'
					    					
					  			           ]);
			  		
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
		      
	      
	      
	      $("#addModal").on("show.bs.modal", function(event){
	    	  
	    	    clearModal();
	    	    var button = $(event.relatedTarget);
	    		var idUpdate = button.data("idupdate"); 
	    		if(idUpdate != null){
	    		
	    			doInitEditDataPost(idUpdate);
	    			
				}
	     		
	    		$(this).find("#saveBtn").off("click").on("click", function()
	    		{
	    			if(idUpdate != null){
	    				
	    				$('#formAdd').bootstrapValidator();
	    				$('#formAdd').data('bootstrapValidator').validate();
	    				if($('#formAdd').data('bootstrapValidator').isValid()){
	    				 doEditDataPost(idUpdate);
	    				}
	  		  	        
	    			}
	    			else {	    				
	    				
	    				//$('#formAdd').bootstrapValidator();
	    				//$('#formAdd').data('bootstrapValidator').validate();
	    				//if($('#formAdd').data('bootstrapValidator').isValid()){
	    					addFamily();
	    				//}						
	    			}
	    		});
	    	  
	      });
	      
	      
	      
	      $("#addModal").on("hide.bs.modal", function(event){
	    	  
	    	 // $('#formAdd').bootstrapValidator('resetForm', true);
	    	  
	      });
	      
	      
	      
	      
	      function addFamily(){
	    	  
     				 doSaveDataAjax();   			 
    
	      }
	    		
	      
	      
	      
	    		
	      function doSaveDataAjax() {  
		   	   
	    	    
// 	    	    var id = getUrlParameter('Id');
	    	    var id = $("#empId").val();
		   	   		  		
		  		var firstName = $('#firstName').val();
		  		var lastName = $('#lastName').val();
		  		var gender;
		  		
		  		
		  		if($('#genderMale:checked').val()!=null){
		  			
		  			gender = $('#genderMale:checked').val();
		  			
		  		}else if($('#genderFemale:checked').val()!=null){
		  			
		  			gender = $('#genderFemale:checked').val();
		  		}
		  	
		  		
		  		
		  		
		  		var age = $('#age').val();
		  		var mobile = $('#mobile').val();
		  		var address = $('#address').val();
		  		var occupation = $('#occupation').val();
		  		var position = $('#position').val();
		  		var relation = $('#masRelation').val();
		  		var relationName = $("#masRelation option:selected").text();
		  			  	    
		  	    var json = {"firstName":firstName,"lastName" : lastName,"gender":gender,"age":age,"mobile":mobile,"address":address,"occupation":occupation,"position":position,"masRelationTypeId":relation,"employeeId":id};
		  	   
		  	    
		  	    
		  	    $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/family/add",   
		  	      dataType : 'json', 
		  	      data : JSON.stringify(json),  
		  	      contentType :"application/json; charset=utf-8",
		  	     
		  	      success : function(data) {  
		  	    	 
		  	    	    $('#addModal').modal('hide');
		  	    	    doFindData();
		  	    		$("#message").html('<div class="alert alert-success" role="alert">Success</div>');
			    		
		  	     },  
		  	    /* statusCode: {
		            404: function() {
		                alert("Employee not found");
		            },
		            500: function() {
		                alert("Failed to update Employee skills");
		            } 
		        },*/
		  	      error : function(data,testStatus,jqXHR,xhr,errorThrown,thrownError) {  
		  	           
			  	    	//alert(xhr.status);
			  	        //alert(xhr);
			  	        //alert('Error: ' +xhr.description); 
			  	       //var message = $.parseJSON(jqXHR.responseText);
           			   //alert(textStatus+': '+message.ExceptionMessage);
						
           			    alert(jqXHR.responseText);

			  	        alert(thrownError);

		  	    	   $('#addModal').modal('hide');
		  	    	   $("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
			  	       //$('#formAdd').bootstrapValidator('validate');
		  	    	  
		  	     }  
		  	    }); 
		  	    
		  	   
		     } 
	      
	      
	      
	      
	      
	      
	      function doInitEditDataPost(idUpdate) {  

	    	  
		  	    var Id = idUpdate;	    
		  	    var json = {"id":idUpdate};
		  	   
		  	    
		  	     $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/family/initedit",   
		  	      dataType : 'json', 
		  	      data : JSON.stringify(json),  
		  	      contentType :"application/json; charset=utf-8",
		  	     
		  	      success : function(data) {  
		    		
		  	    	
		  	    	
		  	    	$('#firstName').val(data.firstName);
		  	    	$('#lastName').val(data.lastName);
		  	    	
		  	   
		  	    	//$("[name=gender]").val(data.gender);
		  	    	//var gender = $("[name=gender").val();
		  	    	
		  	    	if(data.gender=="Male"){
		  	    		
		  	    	   $("#genderMale").prop("checked", true);
		  	    	   
		  	    	}else if(data.gender=="Female"){
		  	    		
		  	    	   $("#genderFemale").prop("checked", true);
		  	    	   
		  	    	} 
		  	    	
		  	    	
		  	      
		  	    	$('#age').val(data.age);
		  	    	$('#mobile').val(data.mobile);
		  	    	$('#address').val(data.address);
		  	    	$('#occupation').val(data.occupation);
		  	    	$('#position').val(data.position);
		  	    	$('#masRelation').val(data.masRelationTypeId);

		  	    	 
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  
		  	    	  
		  	    	$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
		  	    	  
		  	      }  
		  	    }); 
   	    	  }
	
		      
	      
	      
	      
	      function doEditDataPost(idUpdate) {  
	    	    var idEmp = $("#empId").val();
		    	var id = idUpdate;
		  		var firstName = $('#firstName').val();
		  		var lastName = $('#lastName').val();
		  		var gender;
		  		
		  		if($('#genderMale:checked').val()!=null){
		  			
		  			gender = $('#genderMale:checked').val();
		  			
		  		}else if($('#genderFemale:checked').val()!=null){
		  			
		  			gender = $('#genderFemale:checked').val();
		  		}
		  		
		  		//alert(" "+gender);
		  		
		  		var age = $('#age').val();
		  		var mobile = $('#mobile').val();
		  		var address = $('#address').val();
		  		var occupation = $('#occupation').val();
		  		var position = $('#position').val();
		  		var relation = $('#masRelation').val();
		  		
		  		//alert("id: "+idUpdate);

		  	    
		  	    var json = {"id":id,"firstName":firstName,"lastName":lastName,"gender":gender,"age":age,"mobile":mobile,"address":address,"occupation":occupation,"position":position,"masRelationTypeId":relation,"employeeId":idEmp};
		  	     
		  	    
		  	    $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/family/edit",   
		  	      dataType : 'json', 
		  	      data : JSON.stringify(json),  
		  	      contentType :"application/json; charset=utf-8",
		  	     
		  	      success : function(data) {  
		  	    	
		  	       		 $('#addModal').modal('hide');	  
		  	         	 $("#message").html('<div class="alert alert-success" role="alert">Success</div>');
		  	       	     doFindData();		  			 
		  	        
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  
				  
		  	      //$('#formAdd').bootstrapValidator('validate');
		  	      $('#myModalUpdate').modal('hide');	   
		  	      $("#message").html('<div class="alert alert-danger" role="alert">Error</div>');  
		  	     }  
		  	    }); 	  	    
		    }
	      
	      
	      
	      
	      $("#deleteModal").on("show.bs.modal", function(event){
	    	  
	    	    var button = $(event.relatedTarget);
	    		var idDelete = button.data("iddelete"); 
	    		
	     		
	    		$(this).find("#delete").off("click").on("click", function()
	    		{
	    			doDeleteDataPost(idDelete);
	    		});
	    	  
	      });
	      
	      
	      
	      
	      
	      function doDeleteDataPost(idDelete) {  
		   	   
		  	    var Id = idDelete;	    
		  	    var json = {"id":idDelete};
		  	    
		  	    
		  	    
		  	     $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/family/delete",   
		  	      dataType : 'json', 
		  	      data : JSON.stringify(json),  
		  	      contentType :"application/json; charset=utf-8",
		  	     
		  	      success : function(data) {  
		    		
		  	    	
		  	    	$('#deleteModal').modal('hide');
		  	    	$("#message").html('<div class="alert alert-success" role="alert">Success</div>');	
	  	       	    doFindData();		  	      
		  	    	 
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  	  	      
					 $("#message").html('<div class="alert alert-danger" role="alert">Error</div>');

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

<div class="row">
	<div class="col-md-6">
		<h2><spring:message code="family.name" /></h2>
	</div>

    <div class="col-md-6">
    	<br/>
    	<div class="form-group" align="right">
			<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#addModal"><spring:message code="label.newRecord" /></button>
		</div>
	</div>

</div>


<div class="row">
<div id="message"></div>
<div id="outputajax" class="form-group"></div>	
</div>



<div class="form-group">
 <table id="tableResult">
	    <thead>
            <tr> 
                <th><spring:message code="label.fullname" /></th>
                <th><spring:message code="family.occupation" /></th> 
                <th><spring:message code="label.telephone" /></th>
                <th><spring:message code="family.relation" /></th> 
                <th><spring:message code="family.action" /></th>
            </tr>
        </thead>

 
      
	   <tbody>
	   
	   </tbody>
   </table>
</div>   

 

   
   
 
 
<!-- Modal Add and Update data-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="family.name" /></h4>
      </div>
      <div class="modal-body">
          
             
          
         <f:form id="formAdd" name="FamilyForm" method="post" commandName="family" role="form" class="form-horizontal">	      	 
	     

		   
	
		   
	     <div class="form-group form-group-sm">
			    
			<div class="row">
			        
			      <label class="col-lg-2 col-md-3 col-sm-3 col-xs-3 control-label required" >
			           <spring:message code="label.firstname" />: 
			      </label>	 		
			     
				     
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">		  
			     		<f:input  id="firstName" name="firstName" path="firstName" cssClass="form-control required" placeholder="First Name" />   		
			     </div>
		  
		  
		  	     <label class="col-lg-2 col-md-2 col-sm-3 col-xs-3 control-label required" >
			     		 <spring:message code="label.lastname" />:
			     </label>	 		
			    
			     
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">
			     		<f:input id="lastName" path="lastName" cssClass="form-control required" placeholder="Last Name" />		     		
			     </div>
		  
		  	</div>
		   
		   </div>
	     
	     
	     
	     
	     <div class="form-group form-group-sm">
			    
			<div class="row">
			     <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" >
			     	  <spring:message code="family.gender" />:
			     </label>	 		


			      <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">					    
				     	
				     <label class="radio-inline" for="gender_male" > 
		 			     	<f:radiobutton id="genderMale" name="gender" path="gender" value="Male" checked="true"/><spring:message code="family.gender.male" />
		 			 </label>
		 			 <label class="radio-inline" for="gender_female"> 
		 			     <f:radiobutton id="genderFemale" name="gender" path="gender" value="Female"/><spring:message code="family.gender.female" />
				     </label>  					     		 
				  </div>
		     </div>

		   </div>
		   
		   
		   
		    <div class="form-group form-group-sm">
			    
			<div class="row">
			        
			      <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="age" >
			       	 <spring:message code="family.age" />:
			     </label>	 		
			    
			     
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">		    
						<f:input  type="number" id="age" name="age" path="age" cssClass="form-control required" placeholder="Age" />		
			     </div>		   
		  
		   
		   
			    <label class="col-lg-2 col-md-2 col-sm-3 col-xs-3 control-label required" for="mobile" >
			    	 <spring:message code="label.mobile" />:
			    </label>	 		

			    
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">		     		
			     		<f:input  type="tel" id="mobile" name="mobile" path="mobile" cssClass="form-control required" placeholder="Mobile" />
			     </div>		   
		  
		  	</div>
		   
		   </div>
		   
		   
		   
		   
		   <div class="form-group">
		   
		      <div class="row">        
			     <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="address" >
			           <spring:message code="label.address" />:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:textarea rows="2" id="address" name="address"  path="address" cssClass="form-control required" placeholder="Address" />
			   
			     </div>	
			  </div>   	   
		  
		   </div>
	
		   
		   
		   
		   
		   
		   <div class="form-group form-group-sm">
		   
		     <div class="row">
			     <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label" for="occupation">
			           <spring:message code="family.occupation" />:
			     </label>	 		
			    
			     
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">	
			     		<f:input id="occupation" name="occupation" path="occupation" cssClass="form-control" placeholder="Occupation" />	     		
			     		
			     </div>		   
		   
		 
		         
			     <label class="col-lg-2 col-md-2 col-sm-3 col-xs-3 control-label" for="position">
			     		<spring:message code="family.position" />:
			     </label>	 		
			    
			     
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">	
			     		<f:input id="position" name="position" path="position" cssClass="form-control" placeholder="Positon" />	     		
			     	
			     </div>		 
			 </div>  
		   
		   </div>
		   
		   <spring:message code="family.enter.Relation" var="Relation"/>
		   
		   
		   
		    <div class="form-group form-group-sm">
		   
		           
		      <div class="row">
		        <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="masRelation" >
		        	   <spring:message code="family.relation" />:
			          
			    </label>	 		
			    
			     
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		

			     		 <f:select id="masRelation" path="masRelation" cssClass="form-control">
						  <option  value="">${Relation }</option>							
							<c:forEach var="obj" items="${ masRelationTypeList }">									
									<option value="${obj.id}" >${obj.relationType}</option> 									
							</c:forEach>
						</f:select> 
								
			     </div>		 
			     
			</div>  
		   
		   </div> 
		    
		   
		   
		   
	     
	     
		   <%--  <div class="form-group form-group-sm">
			    
			    
			        
			      <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            First Name: 
			      </label>	 		
			     
				     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		  
			     		<f:input  id="firstName" name="firstName" path="firstName" cssClass="form-control required" placeholder="First Name" />   		
			     </div>
		   </div>
		   
		   
		   <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			     		Last Name:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">
			     		<f:input id="lastName" path="lastName" cssClass="form-control required" placeholder="Last Name" />		     		
			     </div>
		   </div>
		   
		    
		    
		    
		    
		   
		   <div class="form-group form-group-sm">
			    
			     
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			     	  Gender:
			     </label>	 		


			      <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">					    
				     	
				     <label class="radio-inline" for="gender_male" > 
		 			     	<f:radiobutton id="genderMale" name="gender" path="gender" value="Male" checked="true"/>Male
		 			 </label>
		 			 <label class="radio-inline" for="gender_female"> 
		 			     <f:radiobutton id="genderFemale" name="gender" path="gender" value="Female"/>Female
				     </label>  					     		 
				  </div>
		           
		   </div>
		   
		   
		   <div class="form-group form-group-sm">
		   
		        
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="age" >
			       	 Age:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		    
						<f:input  type="number" id="age" name="age" path="age" cssClass="form-control required" placeholder="Age" />		
			     </div>		   
		   
		   </div>	
		   
		      
		   <div class="form-group form-group-sm">
		   
		   
			    <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="mobile" >
			    	Mobile:
			    </label>	 		

			    
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input  type="tel" id="mobile" name="mobile" path="mobile" cssClass="form-control required" placeholder="Mobile" />
			     </div>		   
		   
		   </div>
		   
		   
		   
		   
		   
		    <div class="form-group">
		   
		              
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="address" >
			           Address:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:textarea rows="3" id="address" name="address"  path="address" cssClass="form-control required" placeholder="Address" />
			   
			     </div>	
			     	   
		  
		   </div>
	
		   
		   
		   
		   <div class="form-group form-group-sm">
		   
		         
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label" for="occupation">
			           Occupation:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
			     		<f:input id="occupation" name="occupation" path="occupation" cssClass="form-control" placeholder="Occupation" />	     		
			     		
			     </div>		   
		   
		   </div>
		   
		   
		      
		   <div class="form-group form-group-sm">
		   
		         
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label" for="position">
			     		Position:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
			     		<f:input id="position" name="position" path="position" cssClass="form-control" placeholder="Positon" />	     		
			     	
			     </div>		   
		   
		   </div>
		   
		   
		    
		    <div class="form-group form-group-sm">
		   
		           
		        <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="masRelation" >
		        	   Relation:
			          
			    </label>	 		
			    
			     
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		

			     		 <f:select id="masRelation" path="masRelation" cssClass="form-control required" >
						  <f:option  value="-1" label="please select data"/>								
							<c:forEach var="obj" items="${ masRelationTypeList }">									
									<option value="${obj.id}" >${obj.relationType}</option> 									
							</c:forEach>
						</f:select> 
								
			     </div>		   
		   
		   </div>
	--%>   
	
		  
		      <div class="form-group" align="center">
		        <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="label.close" /></button>
		        <button id="saveBtn" name="saveBtn" type="button" class="btn btn-primary"><spring:message code="label.save" /></button>
		      </div>
		      
		      <!-- <div class="form-group" align="center">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button id="saveBtn" name="saveBtn" type="button" class="btn btn-info">Save</button>
     		 </div> -->
 
      </f:form>
	  
	    </div>
	  </div>
	</div>   
 </div>
 
 
 
 <!-- Modal Delete -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title" id="deleteModalLabel"><spring:message code="family.name" /></h4>
      </div>
      <div class="modal-body">
      	<spring:message code="default.delete.confirm" />
      </div>
      <div class="modal-footer">
		<button id="delete" type="button" class="btn btn-danger yesButton" ><spring:message code="default.yes" /></button>
      	<button type="button" class="btn btn-info" data-dismiss="modal"><spring:message code="default.no" /></button>
      </div>
    </div>
  </div>
</div>
 

