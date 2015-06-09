<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<jsp:include page="../employeeMenu.jsp"></jsp:include>


<script>

    var dt;
    var idUpdate;
    var idDelete ;
   
	$(document).ready(function(){
		
	
		
		$("#saveBtn").on("click",function(){
			
			$('#formAdd').bootstrapValidator('resetForm', true);
		
		});
		
		
		 
		   $("#formAdd").bootstrapValidator({
			   
			   message: 'This value is not valid',
		        container: 'tooltip',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	
		        	firstName: {
		                validators: {
		                    notEmpty: {
		                        message: 'First name is required and cannot be empty'
		                    }
		                }
		            },
		            lastName: {
		                validators: {
		                    notEmpty: {
		                        message: 'Last name is required and cannot be empty'
		                    }
		                }
		            },
		            age: {
		                validators: {
		                    notEmpty: {
		                        message: 'Age is required and cannot be empty'
		                    },
		                    digits: {
		                    	message: 'age is number'
		                    },
		                }
		            },
		            mobile: {
		                validators: {
		                    notEmpty: {
		                        message: 'mobile is required and cannot be empty'
		                    },
		                  
		                }
		            },
		            address: {
		                validators: {
		                    notEmpty: {
		                        message: 'address is required and cannot be empty'
		                    },
		                  
		                }
		            },
		            masRelation: {
		                validators: {
		                    notEmpty: {
		                        message: 'Relation is required and cannot be empty'
		                    },
		                    digits: {
		                    	min:0,
		                    	message: 'Relation is required'
		                    },
		                  
		                }
		            },
		        }
		 
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
	          $('#masRelation').val(-1);
	          
	      } 
	      
		
	      function doFindData() {  
		   	   
	    	     var id = getUrlParameter('Id');
	    	     
		  	     $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/family/list/"+id,   
		  	      dataType : 'json', 
		  	      contentType :"application/json; charset=utf-8",
		  	     
		  	      success : function(data) {  
		    		
		  	      status="unmodified" 
		  	    	
		  	    
		  	        dt.fnClearTable();
		  	    	
		  	        for(var i=0;i<data.length;i++){
		  	        	//alert(data[i].id);
		  	        	
		  	        	
			  			 	
			  			        
		  	        	   dt.fnAddData([  
					  			           data[i].firstName+" "+data[i].lastName,					  			          
					  			           data[i].occupation,
					  			           data[i].mobile,
					  			           data[i].masRelationTypeName,
					  			          '<button type="button" class="btn btn-warning btn-sm active" data-idupdate="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>'+' '+
					    				  '<button type="button" class="btn btn-danger btn-sm active" data-iddelete="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>'
					    					
					  			           ]);
			  		
			  	    	 }
		  	        		  	        
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  	  	      
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
	    				 doEditDataPost(idUpdate);
	    			}
	    			else {
	    				addFamily();
	    			}
	    		});
	    	  
	      });
	      
	      
	      
	      
	      function addFamily(){
	    	  
     				 doSaveDataAjax();   			 
    
	      }
	    		
	      
	      
	      
	    		
	      function doSaveDataAjax() {  
		   	   
	    	    
	    	    var id = getUrlParameter('Id');
		   	   		  		
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
		  	      error : function(data,testStatus,jqXHR) {  
		  	           
		  	    	  
		  	    	   /* $('#addModal').modal('hide');
		  	    	   $("#message").html('<div class="alert alert-danger" role="alert">Error</div>'); */
		  	    	   $('#formAdd').bootstrapValidator('validate');
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
	    	    var idEmp = getUrlParameter('Id');
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
		  	    	
		  	    	 
		  	    	  
		  	    	  //alert(JSON.stringify(data));
		  	    	 
		  	    	
		  	       		 $('#addModal').modal('hide');	  
		  	         	 $("#message").html('<div class="alert alert-success" role="alert">Success</div>');
		  	       	     doFindData();		  			 
		  	        
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  

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
		<h2>Family</h2>
	</div>

    <div class="col-md-6">
    	<br/>
    	<div class="form-group" align="right">
			<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#addModal">New Record</button>
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
                <th>Fullname</th>
                <th>Occupation</th> 
                <th>Tel</th>
                <th>Relation</th> 
                <th>Action</th>
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
        <h4 class="modal-title" id="myModalLabel">Family</h4>
      </div>
      <div class="modal-body">
          
             
          
         <f:form id="formAdd" name="FamilyForm" method="post" commandName="family" role="form" class="form-horizontal">	      	 
	     

		   
	
		   
	     <div class="form-group form-group-sm">
			    
			<div class="row">
			        
			      <label class="col-lg-2 col-md-3 col-sm-3 col-xs-3 control-label required" >
			            First Name: 
			      </label>	 		
			     
				     
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">		  
			     		<f:input  id="firstName" name="firstName" path="firstName" cssClass="form-control required" placeholder="First Name" />   		
			     </div>
		  
		  
		  	     <label class="col-lg-2 col-md-2 col-sm-3 col-xs-3 control-label required" >
			     		Last Name:
			     </label>	 		
			    
			     
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">
			     		<f:input id="lastName" path="lastName" cssClass="form-control required" placeholder="Last Name" />		     		
			     </div>
		  
		  	</div>
		   
		   </div>
	     
	     
	     
	     
	     <div class="form-group form-group-sm">
			    
			<div class="row">
			     <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" >
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

		   </div>
		   
		   
		   
		    <div class="form-group form-group-sm">
			    
			<div class="row">
			        
			      <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="age" >
			       	 Age:
			     </label>	 		
			    
			     
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">		    
						<f:input  type="number" id="age" name="age" path="age" cssClass="form-control required" placeholder="Age" />		
			     </div>		   
		  
		   
		   
			    <label class="col-lg-2 col-md-2 col-sm-3 col-xs-3 control-label required" for="mobile" >
			    	Mobile:
			    </label>	 		

			    
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">		     		
			     		<f:input  type="tel" id="mobile" name="mobile" path="mobile" cssClass="form-control required" placeholder="Mobile" />
			     </div>		   
		  
		  	</div>
		   
		   </div>
		   
		   
		   
		   
		   <div class="form-group">
		   
		      <div class="row">        
			     <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="address" >
			           Address:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:textarea rows="2" id="address" name="address"  path="address" cssClass="form-control required" placeholder="Address" />
			   
			     </div>	
			  </div>   	   
		  
		   </div>
	
		   
		   
		   
		   
		   
		   <div class="form-group form-group-sm">
		   
		     <div class="row">
			     <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label" for="occupation">
			           Occupation:
			     </label>	 		
			    
			     
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">	
			     		<f:input id="occupation" name="occupation" path="occupation" cssClass="form-control" placeholder="Occupation" />	     		
			     		
			     </div>		   
		   
		 
		         
			     <label class="col-lg-2 col-md-2 col-sm-3 col-xs-3 control-label" for="position">
			     		Position:
			     </label>	 		
			    
			     
			     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">	
			     		<f:input id="position" name="position" path="position" cssClass="form-control" placeholder="Positon" />	     		
			     	
			     </div>		 
			 </div>  
		   
		   </div>
		   
		   
		   
		   
		   
		    <div class="form-group form-group-sm">
		   
		           
		      <div class="row">
		        <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="masRelation" >
		        	   Relation:
			          
			    </label>	 		
			    
			     
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		

			     		 <f:select id="masRelation" path="masRelation" cssClass="form-control">
						  <f:option  value="-1" label="please select data"/>								
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
	
		  
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button id="saveBtn" name="saveBtn" type="button" class="btn btn-primary">Save</button>
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
        <h4 class="modal-title" id="deleteModalLabel">Delete Family</h4>
      </div>
      <div class="modal-body">
      	Do you want to delete family ?
      </div>
      <div class="modal-footer">
		<button id="delete" type="button" class="btn btn-danger yesButton" >Yes</button>
      	<button type="button" class="btn btn-info" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>
 

