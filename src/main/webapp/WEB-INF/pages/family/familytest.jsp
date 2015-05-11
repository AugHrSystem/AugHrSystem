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

   
	$(document).ready(function(){
		
		 
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
		  
		  
		  
		  dt = $('#tableResult').DataTable();
	
		  var name;
		  var gender;
		  var occupation;
		  var mobile;
		  var relation;
		  
		  
		   $('#saveBtn').on( 'click', function () {
			   
			    name = $('#firstName').val()+' '+$('#lastName').val();
			   
		        dt.row.add( [
		           name,
		        ] ).draw();
		 
		       
		    } );
  	
		  
	});
	
</script>
</head>


<body>
<div class="container">

<br/>
<br/>


<nav class="navbar navbar-default navbar-fixed-top" id="nav">
  <div class="container"> 
      
      <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">

                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>

            </button>
            <a class="navbar-brand" href="#">
               <label>Home</label>
            </a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">About</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>
      
  </div>
</nav>




<br/>
<br/>
<br/>
<br/>
<br/>





 <table id="tableResult" class="table table-striped table-bordered">
	    <thead>
            <tr> 
                
                <th><spring:message code="family.list.familyname"/></th>
                <th><spring:message code="family.list.age"/></th>
                <th><spring:message code="family.list.gender"/></th>
                <th><spring:message code="family.list.occupation"/></th> 
                <th><spring:message code="family.list.tel"/></th>
                <th><spring:message code="family.list.relation"/></th> 
                <th><spring:message code="family.list.edit"/></th>
                              
            </tr>
        </thead>

 
        <tfoot>
            <tr>
     
                <th><spring:message code="family.list.familyname"/></th>
                <th><spring:message code="family.list.age"/></th>
                <th><spring:message code="family.list.gender"/></th>
                <th><spring:message code="family.list.occupation"/></th> 
                <th><spring:message code="family.list.tel"/></th>
                <th><spring:message code="family.list.relation"/></th> 
                <th><spring:message code="family.list.edit"/></th>
                
            </tr>
        </tfoot>
        
	   <tbody>
	   
	   </tbody>
   </table>
   
   <div align="right">
  	 <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil">Create</span> </button>   
   </div>

   <br/>
   <br/>
   
   
   
 
 
<!-- Modal Add data-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
          
             
          
            <f:form id="formAdd" name="FamilyForm" method="post" commandName="family" class="form-horizontal" role="form">	      	 
	      	
	      	<spring:message code="label.add"/>
	        
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
 
 
 
 </div>

</body>
</html>