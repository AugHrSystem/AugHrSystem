<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- jquery and jquery validator -->
<!-- jquery validator version 1.13.1 -->
<script src="<c:url value="/resources/resource/bootstrap/js/jquery-1.11.2.js" />"></script> 
<script src="<c:url value="/resources/resource/bootstrap/js/jquery.validate.js" />"></script>
<script src="<c:url value="/resources/resource/bootstrap/js/additional-methods.js" />"></script>


<!-- dialog -->
<script src="<c:url value="/resources/resource/bootstrap/js/bootbox.js" />"></script>


<!-- bootstrap version 3.3.4-->
<link href="<c:url value="/resources/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resources/resource/bootstrap/js/bootstrap.js" />"></script>

<!-- for show error massage and success massage-->
<link href="<c:url value="/resources/resource/bootstrap/css/main.css" />" rel="stylesheet" media="all">

<!-- datatable version 1.10.6 -->
<script src="<c:url value="/resources/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resources/resource/bootstrap/css/dataTables.bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resources/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>


<style type="text/css">

#tableResult {
        width: 90%;
        margin-top: 35%;
    }
 
#nav {
       margin-top: 3%;
    }
 
</style>



<script>

    var dt;
    var idUpdate;
    var idDelete ;
   
	$(document).ready(function(){
		
		  
		 $('#errormsg').hide();
		 $('#successmsg').hide();
		 
		
		
		 
		  $("#formAdd").validate({
				
				rules:{
					 firstName:{
			        	 required: true
			         },
			         lastName:{
			        	 required: true
			         },
			         age:{
			        	 required: true
			         },
			         mobile:{
			        	 required: true
			         },
			         address:{
			        	 required: true
			         },
			         masRelation:{
			        	 required: true
			         }
			        
				 },
				messages: {
					 firstName:{
			            required: "<spring:message code="family.required.firstname"/>"
			         },
					 lastName:{
			         	required: "<spring:message code="family.required.lastname"/>"
			         } ,
			         age:{
			        	required: "<spring:message code="family.required.age"/>" 
			         },
			         mobile:{
				        required: "<spring:message code="family.required.mobile"/>" 
				     },
				     address:{
					    required: "<spring:message code="family.required.address"/>" 
					 },
					 masRelation:{
						required: "<spring:message code="family.required.relation"/>" 
					 }  
		           
				},
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
		   	   
		  	  
		  	     $.ajax({  
		  	      type : "GET",   
		  	      url : "<%=request.getContextPath()%>/family/list",   
		  	      dataType : 'json', 
		  	      contentType :"application/json; charset=utf-8",
		  	     
		  	      success : function(data) {  
		    		
		  	      status="unmodified" 
		  	    	
		  	    
		  	        dt.fnClearTable({
		  	        	
		  	        	 "columnDefs": [
				    	          		{
				    	                     "targets": [ 0 ],
				    	                     "visible": false
				    	                 }
				    	             ]		
		  	        });
		  	    	
		  	        for(var i=0;i<data.length;i++){
		  	        	alert(data[i].id);
		  	        	
		  	        	
			  			 	
			  			        
		  	        	   dt.fnAddData([  data[i].id,
					  			           data[i].name,
					  			           data[i].age,
					  			           data[i].gender,
					  			           data[i].occupation,
					  			           data[i].mobile,
					  			           data[i].relationId,
					  			           data[i].relation,
					  			          '<button type="button" class="btn btn-info btn-sm active" data-idupdate="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
					    				  '<button type="button" class="btn btn-danger btn-sm active" data-iddelete="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>'
					    					
					  			           ]);
			  		
			  	    	 }
		  	        		  	        
		  	     },  
		  	      error : function(e) {  	  	      
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
		  			  	    
		  	    var json = {"firstName":firstName,"lastName" : lastName,"gender":gender,"age":age,"mobile":mobile,"address":address,"occupation":occupation,"position":position,"masRelation":{"id":relation}};
		  	   
		  	    
		  	    
		  	    $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/family/add",   
		  	      dataType : 'json', 
		  	      data : JSON.stringify(json),  
		  	      contentType :"application/json; charset=utf-8",
		  	     
		  	      success : function(data) {  
		  	    	 
		  	    	    $('#addModal').modal('hide');
		  	    	    doFindData();
		  	    	    /*  $('#successmsg').show();
		  	    	    if($('#successmsg').is(':visible'))
		  				 {  
		  					 $('#errormsg').hide();    
		  				 } */
		  				 
		  	    		$("#message").html('<div class="alert alert-success" role="alert">Success</div>');
			    		
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  
		  	           
		  	    	  
		  	    	   $('#addModal').modal('hide');
		  	    	   /* $('#errormsg').show();		  	    	 
		  	    	   if($('#errormsg').is(':visible'))
		  			   {  
		  				 $('#successmsg').hide();    
		  			   } */
		  	    	  $("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
		  	     }  
		  	    }); 
		  	    
		  	   
		     } 
	      
	      
	      
	      
	      
	      
	      function doInitEditDataPost(idUpdate) {  
		   	   
		  	    var Id = idUpdate;	    
		  	    var json = {"Id":idUpdate};
		  	   
		  	    
		  	     $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/family/initedit",   
		  	      dataType : 'json', 
		  	      data : JSON.stringify(json),  
		  	      contentType :"application/json; charset=utf-8",
		  	     
		  	      success : function(data) {  
		    		
		  	    	
		  	    	
		  	    	$('#firstName').val(data.firstName);
		  	    	$('#lastName').val(data.lastName);
		  	    	
		  	   
		  	    	$("[name=gender]").val(data.gender);
		  	    	var gender = $("[name=gender").val();
		  	    	
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
		  	    	$('#masRelation').val(data.relationId);

		  	    	 
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  
		  	    	  
		  	    	$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
		  	     }  
		  	    }); 
		  	   
		    }
		      
	      
	      
	      
	      function doEditDataPost(idUpdate) {  
		   	   
		    	var id = idUpdate;
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
		  		
		  		alert("id: "+idUpdate);

		  	    
		  	    var json = {"id":id,"firstName":firstName,"lastName":lastName,"gender":gender,"age":age,"mobile":mobile,"address":address,"occupation":occupation,"position":position,"masRelation":{"id":relation}};
		  	     
		  	    
		  	    $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/family/edit",   
		  	      dataType : 'json', 
		  	      data : JSON.stringify(json),  
		  	      contentType :"application/json; charset=utf-8",
		  	     
		  	      success : function(data) {  
		  	    	
		  	    	 
		  	    	  
		  	    	  alert(JSON.stringify(data));
		  	    	 
		  	    	
		  	       		 $('#addModal').modal('hide');	  
		  	         	 $("#message").html('<div class="alert alert-success" role="alert">Success</div>');
		  	       	     doFindData();
		  			    /*  $('#successmsg').show();
		  				 if($('#successmsg').is(':visible'))
		  				 {  
		  					 $('#errormsg').hide();    
		  				 } */
	  	    	   	 
		  	        
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  

		  	      $('#myModalUpdate').modal('hide');	   
		  	      /* $('#errormsg').show();
		  	      
		  	      if($('#errormsg').is(':visible'))
				  {  
						 $('#successmsg').hide();   
			  	  }
	 	   	 	  */
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
		  	    var json = {"Id":idDelete};
		  	    
		  	    
		  	    
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
		  	        /* $('#successmsg').show();	
	  	    	    if($('#successmsg').is(':visible'))
	  				 {  
	  					 $('#errormsg').hide();    
	  				 } */

		  	    	 
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  	  	      
		  	    	  
		  	    	  /* $('#errormsg').show();  	    	 
		  	    	  if($('#errormsg').is(':visible'))
		  			  {  
		  				 $('#successmsg').hide();    
		  			  } */
					  $("#message").html('<div class="alert alert-danger" role="alert">Error</div>');

		  	     }  
		  	    }); 
		  	   
		    }
		      
		      
	      
	      
	  	   
	});
	
	
	
	
	
	
	
</script>
</head>
<body>
<div class="container">

<br/>
<br/>


<h2>Family</h2>
		
<br><br>
		
<div id="message"></div>
<div id="outputajax" class="form-group">	


<!-- <div id="successmsg" class="alert alert-success" role="alert">
  <a href="#" class="alert-link">Success...</a>
</div>


<div id="errormsg" class="alert alert-danger" role="alert">
  <a href="#" class="alert-link">Please try again...</a>
</div>
 -->

 <table id="tableResult" class="table table-striped table-bordered">
	    <thead>
            <tr> 
                <th>id</th>
                <th>Family Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Occupation</th> 
                <th>Te</th>
                <th>RelationId</th> 
                <th>Relation</th> 
                <th></th>
                <th></th>
            </tr>
        </thead>

 
      
	   <tbody>
	   
	   </tbody>
   </table>
   
   <div align="right">
  	 <!-- <button id="create" type="button" class="btn btn-default" data-toggle="modal" data-target="#addModal"><span class="glyphicon glyphicon-pencil">Create</span> </button> -->   
     
		<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#addModal">Add
   </div>

   <br/>
   <br/>
   
   
   
 
 
<!-- Modal Add data-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="label.add"/> Family</h4>
      </div>
      <div class="modal-body">
          
             
          
            <f:form id="formAdd" name="FamilyForm" method="post" commandName="family" class="form-horizontal" role="form">	      	 
	      
	        
	        <br/>
	        <br/>
	       
		    <div class="form-group form-group-sm">
			    
			        
			      <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			           <spring:message code="family.form.firstname" var="firstName"/> ${firstName} :
			      </label>	 		
			     
				     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input  id="firstName" name="firstName" path="firstName" cssClass="form-control required" placeholder="${firstName}" />
			     		<f:errors path="firstName"/>
			     </div>
		   </div>
		   
		   
		   <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            <spring:message code="family.form.lastname" var="lastName"/> ${lastName} :
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input id="lastName" path="lastName" cssClass="form-control required" placeholder="${lastName}" />
			     		<f:errors path="lastName"/>
			     </div>
		   </div>
		   
		   
		   <div class="form-group form-group-sm">
			    
			     
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			          <spring:message code="family.list.gender" var="gender"/> ${gender} :
			     </label>	 		


			      <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				       <label class="radio-inline" for="gender_male" > 
		 			     	<f:radiobutton id="genderMale" name="gender" path="gender" value="Male" checked="true"/><spring:message code="family.form.gender.male"/>
		 			   </label>
		 			 <label class="radio-inline" for="gender_female"> 
		 			     <f:radiobutton id="genderFemale" name="gender" path="gender" value="Female"/><spring:message code="family.form.gender.female"/>
				     </label>  	
				     	<f:errors path="gender"/>					     		 
				  </div>
		           
		   </div>
		   
		   
		   <div class="form-group form-group-sm">
		   
		        
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="age" >
			         <spring:message code="family.list.age" var="age"/> ${age} :
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input  type="number" id="age" name="age" path="age" cssClass="form-control required" placeholder="${age}" />
			     		<f:errors path="age"/>
			     </div>		   
		   
		   </div>	
		   
		      
		   <div class="form-group form-group-sm">
		   
		   
			    <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="mobile" >
			        <spring:message code="family.list.tel" var="mobile"/> ${mobile} :
			    </label>	 		

			    
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input  type="tel" id="mobile" name="mobile" path="mobile" cssClass="form-control required" placeholder="${mobile}" />
			     		<f:errors path="mobile"/>
			     </div>		   
		   
		   </div>
		   
		   
		   
		   
		   
		    <div class="form-group">
		   
		              
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="address" >
			           <spring:message code="family.form.address" var="address"/> ${address} :
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:textarea rows="3" id="address" name="address"  path="address" cssClass="form-control required" placeholder="${address}" />
			     		<f:errors path="address"/>
			     </div>	
			     	   
		  
		   </div>
	
		   
		   
		   
		   <div class="form-group form-group-sm">
		   
		         
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label" for="occupation">
			           <spring:message code="family.list.occupation" var="occupation"/> ${occupation} :
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input id="occupation" name="occupation" path="occupation" cssClass="form-control" placeholder="${occupation}" />
			     		<f:errors path="occupation"/>
			     </div>		   
		   
		   </div>
		   
		   
		      
		   <div class="form-group form-group-sm">
		   
		         
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label" for="position">
			           <spring:message code="family.form.position" var="position"/> ${position} :
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input id="position" name="position" path="position" cssClass="form-control" placeholder="${position}" />
			     		<f:errors path="position"/>
			     </div>		   
		   
		   </div>
		   
		   
		    
		    <div class="form-group form-group-sm">
		   
		           
		        <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="masRelation" >
			           <spring:message code="family.list.relation" var="masRelation"/> ${masRelation} :
			    </label>	 		
			    
			     
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		

			     		 <f:select id="masRelation" path="masRelation" cssClass="form-control required" >
						  <f:option  value="" label="please select data"/>								
							<c:forEach var="obj" items="${ masRelationTypeList }">									
									<option value="${obj.id}" >${obj.relationType}</option> 									
							</c:forEach>
						</f:select> 
								
			     </div>		   
		   
		   </div>
		   
		  
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="label.close"/></button>
		        <button id="saveBtn" name="saveBtn" type="button" class="btn btn-primary"><spring:message code="label.save"/></button>
		      </div>
 
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
        <h4 class="modal-title" id="deleteModalLabel">Delete Experience</h4>
      </div>
      <div class="modal-body">
      	Do you want to delete experience ?
      </div>
      <div class="modal-footer">
		<button id="delete" type="button" class="btn btn-danger yesButton" >Yes</button>
      	<button type="button" class="btn btn-info" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>
 

 
 
 </div>

</body>
</html>