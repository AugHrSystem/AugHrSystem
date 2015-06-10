<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>


<jsp:include page="../employeeMenu.jsp"></jsp:include>


<!-- jquery-->
<%-- <script src="<c:url value="/resources/resource/bootstrap/js/jquery-1.11.2.js" />"></script> 
<script src="<c:url value="/resources/resource/bootstrap/js/jquery.validate.js" />"></script>
<script src="<c:url value="/resources/resource/bootstrap/js/additional-methods.js" />"></script> --%>

<!-- validate -->
<%-- <link href="<c:url value="/resource/bootstrapvalidator/dist/css/bootstrapValidator.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrapvalidator/dist/js/bootstrapValidator.js" />"></script>--%>

<!-- bootstrap version 3.3.4-->
<%-- <link href="<c:url value="/resources/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resources/resource/bootstrap/js/bootstrap.js" />"></script> --%>


<!-- datatable version 1.10.6 -->
<%-- <script src="<c:url value="/resources/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resources/resource/bootstrap/css/dataTables.bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resources/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>--%>


<style type="text/css">

.required:after {
  margin-bottom: 0px;
  content:"*";
  color:red;
}  

</style>


<input id="empId" type="hidden" value="${id}">
<script type="text/javascript">
    var dt;
    
	$(document).ready(function(){
		
		

		$("#saveBtn").on("click",function(){
			
			//$('#formAddUpdate').bootstrapValidator('resetForm', true);
			$('#formAddUpdate').bootstrapValidator();
			$('#formAddUpdate').data('bootstrapValidator').resetForm();


		});
		
		
		 
		 $("#formAddUpdate").bootstrapValidator({
			   
			   message: 'This value is not valid',
		        //container: 'tooltip',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        
		        	masSkillLanguage: {
		                validators: {
		                    notEmpty: {
		                        message: 'Language is required and cannot be empty'
		                    },
		                    digits: {
		                    	min:0,
		                    	message: 'Language is required'
		                    },
		                  
		                }
		            },
		        }
		 
    });
	
	
		 dt=$('#tableResult').dataTable();
		 doFindData();
		 
		 
		   function doFindData() {  
		   	   
// 			     var id = getUrlParameter('Id');
			  	  var id = $("#empId").val();
		  	     $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/skilllanguage/list/"+id,   
		  	      dataType : 'json', 
		  	      contentType :"application/json; charset=utf-8",
		  	     
		  	      success : function(data) {  
		    		
		  	      
		  	        dt.fnClearTable();
		  	    	
		  	        for(var i=0;i<data.length;i++){
		  	        	
	
		  	        	   dt.fnAddData([  data[i].masSkillLanguageName,
					  			           data[i].abilitySpeaking,
					  			           data[i].abilityWriting,
					  			           data[i].abilityReading,
					  			           data[i].abilityUnderstanding,
					  			          '<button type="button" class="btn btn-warning btn-sm active" data-idupdate="' + data[i].id+ '" data-target="#addModal" data-toggle="modal">Edit</button>'+' '+
					    				  '<button type="button" class="btn btn-danger btn-sm active" data-iddelete="' + data[i].id+ '" data-target="#deleteModal" data-toggle="modal">Delete</button>'
					    					
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
	    				$('#formAddUpdate').bootstrapValidator();
	    				$('#formAddUpdate').data('bootstrapValidator').validate();
	    				if($('#formAddUpdate').data('bootstrapValidator').isValid()){
	    					 doEditDataPost(idUpdate);
	    				}
	    			}
	    			else {
	    				$('#formAddUpdate').bootstrapValidator();
	    				$('#formAddUpdate').data('bootstrapValidator').validate();
	    				if($('#formAddUpdate').data('bootstrapValidator').isValid()){
	    					 addSkilllanguage();
	    				}
	    			}
	    		});
	    	  
	      });
	
		
			
		   
		   $('#addModal').on("hide.bs.modal",function(event){
			   
			   $('#formAddUpdate')[0].reset();
		       //$('#formAddUpdate').bootstrapValidator('resetForm', true);
			   $('#formAddUpdate').bootstrapValidator();
			   $('#formAddUpdate').data('bootstrapValidator').resetForm();

		  
		   });
		   
		   
		   
		   
		   function clearModal(){
			   
			   $("#fairSpeaking").prop('checked', 'checked');
			   $('#fairWriting').prop('checked','checked');
			   $('#fairReading').prop('checked','checked');
			   $('#fairUnderstanding').prop('checked','checked');
			   $('#masSkillLanguage').val(-1);
		 
		   }
		   
		   
		   
		   function addSkilllanguage(){
			   		
			  		var masSkillLanguageId = $('#masSkillLanguage').val();
			  		var speaking;
			  		var writing;
			  		var reading;
			  		var understanding;
			  		var masSkillLanguageName= $("#masSkillLanguage option:selected").text();
			  		
			  		
			  		if($('#excSpeaking:checked').val()!=null){
			  			
			  			speaking = $('#excSpeaking:checked').val();
			  			
			  		}else if($('#goodSpeaking:checked').val()!=null){
			  			
			  			speaking = $('#goodSpeaking:checked').val();
			  			
			  		}else if($('#fairSpeaking:checked').val()!=null){
			  			
			  			speaking = $('#fairSpeaking:checked').val();
			  			
			  		}
			  		
			  		
			  		
			  		
					if($('#excWriting:checked').val()!=null){
			  			
						writing = $('#excWriting:checked').val();
			  			
			  		}else if($('#goodWriting:checked').val()!=null){
			  			
			  			writing = $('#goodWriting:checked').val();
			  			
			  		}else if($('#fairWriting:checked').val()!=null){
			  			
			  			writing = $('#fairWriting:checked').val();
			  			
			  		}
			  	
			  		

					
					
					if($('#excReading:checked').val()!=null){
			  			
						reading = $('#excReading:checked').val();
			  			
			  		}else if($('#goodReading:checked').val()!=null){
			  			
			  			reading = $('#goodReading:checked').val();
			  			
			  		}else if($('#fairReading:checked').val()!=null){
			  			
			  			reading = $('#fairReading:checked').val();
			  			
			  		}
					
					
					
					
					if($('#excUnderstanding:checked').val()!=null){
			  			
						understanding = $('#excUnderstanding:checked').val();
			  			
			  		}else if($('#goodUnderstanding:checked').val()!=null){
			  			
			  			understanding = $('#goodUnderstanding:checked').val();
			  			
			  		}else if($('#fairUnderstanding:checked').val()!=null){
			  			
			  			understanding = $('#fairUnderstanding:checked').val();
			  			
			  		}
			  		
			  		
			  			  	    
			  	    /* var language = {masSkillLanguage:{"id":masSkillLanguageId},
			  	    				"abilitySpeaking":speaking,
			  	    				"abilityReading" : reading,
			  	    				"abilityUnderstanding":understanding,
			  	    				"abilityWriting":writing}; */
			  	    				
			  	 
			  	    
			  	    //var language =  "masSkillLanguage.id="+masSkillLanguageId+"&abilitySpeaking="+speaking+"&abilityReading="+reading+"&abilityUnderstanding="+understanding+"&abilityWriting="+writing;
			  	     
// 			  	    var id = getUrlParameter('Id');	
			  	  var id = $("#empId").val();
			  	    var language =  "masSkillLanguageId="+masSkillLanguageId+"&masSkillLanguageName="+masSkillLanguageName+"&abilitySpeaking="+speaking+"&abilityReading="+reading+"&abilityUnderstanding="+understanding+"&abilityWriting="+writing+"&employeeId="+id;
			 
	                
			  	    $.ajax({  
			  	      type : "POST",   
			  	      url : "<%=request.getContextPath()%>/skilllanguage/add",   
			  	      data: language,			  	     
			  	      success : function(data) {  
			  	    	 
			  	    	    $('#addModal').modal('hide');
			  	    	    doFindData();
			  	    		$("#message").html('<div class="alert alert-success" role="alert">Success</div>');
				    		
			  	     },  
			  	      error : function(data,testStatus,jqXHR) {  
			  	           
			  	    	  
			  	    	   $('#addModal').modal('hide');			  	 
			  	    	   $("#message").html('<div class="alert alert-danger" role="alert">Error</div>'); 
			  	    	   //$('#formAddUpdate').bootstrapValidator('validate');
			  	     }  
			  	    });   	
		   }
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   function doInitEditDataPost(idUpdate) {  
		   	   
			     		  	   
		  	    var language = "id="+idUpdate;
		  	    //alert("id: "+idUpdate);
		  	    
		  	   
		  	     $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/skilllanguage/initedit",   		  	    
		  	      data : language,  
		  	     
		  	      success : function(data) {  
		    		
		  	    	//alert(" "+data.abilitySpeaking);
		  	    	
		  	    	//$('#formAddUpdate')[0].reset();
			  		
			  		if(data.abilitySpeaking == "Excellent"){
			  			
			  			$('#excSpeaking').prop('checked', 'checked');
			  			
			  		}else if(data.abilitySpeaking == "Good"){
			  			
			  			$('#goodSpeaking').prop('checked','checked');
			  			
			  		}else if(data.abilitySpeaking == "Fair"){
			  			
			  			
			  			$('#fairSpeaking').prop('checked','checked');
			  			
			  		}
			  		
			  		
			  		
			  		
					if(data.abilityWriting == "Excellent"){
			  			
						$('#excWriting').prop('checked','checked');
			  			
			  		}else if(data.abilityWriting == "Good"){
			  			
			  		    $('#goodWriting').prop('checked','checked');
			  			
			  		}else if(data.abilityWriting == "Fair"){
			  			
			  		    $('#fairWriting').prop('checked','checked');
			  			
			  		}
			  	
			  		

					
					
					if(data.abilityReading == "Excellent"){
			  			
						$('#excReading').prop('checked','checked');
			  			
			  		}else if(data.abilityReading == "Good"){
			  			
			  			$('#goodReading').prop('checked','checked');
			  			
			  		}else if(data.abilityReading == "Fair"){
			  			
			  			$('#fairReading').prop('checked','checked');
			  			
			  		}
					
					
					
					
					if(data.abilityUnderstanding == "Excellent"){
			  			
						$('#excUnderstanding').prop('checked','checked');
			  			
			  		}else if(data.abilityUnderstanding == "Good"){
			  			
			  			$('#goodUnderstanding').prop('checked','checked');
			  			
			  		}else if(data.abilityUnderstanding == "Fair"){
			  			
			  			$('#fairUnderstanding').prop('checked','checked');
			  			
			  		}
			  		
			  		
			  	
					$('#masSkillLanguage').val(data.masSkillLanguageId);
			  	  
		  	    	  
		  	    	
					
		  	    	 
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  	
		  	    	  
		  	    	$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
	
		  	      }  
		  	    }); 
		  	   
		    }
		   
		   
		   
		   
		   
		   
		   
		   
		   function doEditDataPost(idUpdate) {  
		   	   
 		  	   

		  	    var speaking;
		  	    var reading;
		  	    var writing;
		  	    var understanding;
				var masSkillLanguage;

				
		  		if($('#excSpeaking').is(':checked')){
		  			
		  			speaking = $('#excSpeaking').val();
		  			
		  		}else if($('#goodSpeaking').is(':checked')){
		  			
		  			speaking = $('#goodSpeaking').val();

		  		}else if($('#fairSpeaking').is(':checked')){
		  			
		  			speaking = $('#fairSpeaking').val();
		  			
		  		}
		  		
		  		
		  		
		  		
				if($('#excWriting').is(':checked')){
		  			
					writing = $('#excWriting').val();
		  			
		  		}else if( $('#goodWriting').is(':checked')){
		  			
		  			writing = $('#goodWriting').val();
		  			
		  		}else if($('#fairWriting').is(':checked')){
		  			
		  			writing = $('#fairWriting').val();
		  			
		  		}
		  	
				
				//alert("writing: "+writing)
		  		

				
				
				if($('#excReading').is(':checked')){
					
					reading = $('#excReading').val();
		  			
		  		}else if($('#goodReading').is(':checked')){
		  			
		  			reading = $('#goodReading').val();
		  			
		  		}else if($('#fairReading').is(':checked')){
		  			
		  			reading = $('#fairReading').val();		  			
		  		}
				
				
				
				
				if($('#excUnderstanding').is(':checked')){
				
					understanding = $('#excUnderstanding').val();	
		  			
		  		}else if($('#goodUnderstanding').is(':checked')){
		  			
		  			understanding = $('#goodUnderstanding').val();	
		  			
		  		}else if($('#fairUnderstanding').is(':checked')){
		  			
		  			understanding = $('#fairUnderstanding').val();	
		  		}
		  		
		  		
				masSkillLanguageId = $('#masSkillLanguage').val();
				
				var masSkillLanguageName= $("#masSkillLanguage option:selected").text();
		  	  
// 				var id = getUrlParameter('Id');	
				var id = $("#empId").val();
				
		  	    //var language =  "id="+idUpdate+"&masSkillLanguage.id="+masSkillLanguageId+"&abilitySpeaking="+speaking+"&abilityReading="+reading+"&abilityUnderstanding="+understanding+"&abilityWriting="+writing;
                var language =  "id="+idUpdate+"&masSkillLanguageId="+masSkillLanguageId+"&masSkillLanguageName="+masSkillLanguageName+"&abilitySpeaking="+speaking+"&abilityReading="+reading+"&abilityUnderstanding="+understanding+"&abilityWriting="+writing+"&employeeId="+id;
		  	    //alert("masid: "+masSkillLanguageId);
		  	    
		  	    
		  	   
		  	     $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/skilllanguage/edit",   		  	    
		  	      data : language,  
		  	     
		  	      success : function(data) {  
		    		
		  	    	$('#addModal').modal('hide');
	  	    	    doFindData();
	  	    		$("#message").html('<div class="alert alert-success" role="alert">Success</div>');				
		  	    	 
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  	
		  	    	  
		  	    	$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
		  	    	//$('#formAddUpdate').bootstrapValidator('validate');
	
		  	      }  
		  	    }); 
		  	   
		    }
		   
	
		   
		   
		   $("#deleteModal").on("show.bs.modal", function(event){
		    	  
	    	    clearModal();
	    	    var button = $(event.relatedTarget);
	    		var idDelete = button.data("iddelete"); 
	    		
	
	    		$(this).find("#delete").off("click").on("click", function()
	    		{
	    			
	    				 doDeleteData(idDelete);
	    			
	    		});
	    	  
	      });
		   
		   
		   
		   
		   
		   
		   
		   function doDeleteData(idDelete) {  
		   	   
 		  	   

	  	    	  
		  	    var language =  "id="+idDelete;
		  	   
		  	     $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/skilllanguage/delete",   		  	    
		  	      data : language,  
		  	     
		  	      success : function(data) {  
		    		
		  	    	$('#deleteModal').modal('hide');
	  	    	    doFindData();
	  	    		$("#message").html('<div class="alert alert-success" role="alert">Success</div>');				
		  	    	 
		  	     },  
		  	      error : function(data,testStatus,jqXHR) {  	
		  	    	  
		  	    	$('#deleteModal').modal('hide');
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
		<h2>Language</h2>
	</div>

    <div class="col-md-6">
    	<br/>
    	<div class="form-group" align="right">
					<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#addModal">New Record</button>
		</div>
		<br/>
	</div>
</div>		

<div class="row">
	<div id="message"></div>
	<div id="outputajax" class="form-group"></div>
</div>		

 <table id="tableResult">
	    <thead>
            <tr> 
                <th>Language</th>
                <th>Speaking</th>
                <th>Writing</th>
                <th>Reading</th> 
                <th>Understanding</th>
                <th>Action</th>
            </tr>
        </thead>
</table>








<!-- Modal Add and Update data-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Language</h4>
      </div>
      <div class="modal-body">
          
             
          
            <f:form id="formAddUpdate" name="skillLanguageForm" method="post" commandName="skillLanguage" class="form-horizontal" role="form">	      	 
	      
	
		    <div class="form-group form-group-sm">
		   
		           
		        <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="masSkillLanguage" >
			           Skill language Name:
			    </label>	 		
			    
			     
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		

			     		<%-- <f:select id="masSkillLanguage"  path="masSkillLanguage" cssClass="form-control" >
						  <option  value="-1" label="please select data"/>								
							<c:forEach var="obj" items="${ masSkillLanguageList }">									
									<option value="${obj.id}" >${obj.skillLanguageName}</option> 									
							</c:forEach>
						</f:select> --%> 
						
						
						<f:select  id="masSkillLanguage" path="masSkillLanguage" cssClass="form-control">
   						<f:option value="-1" label="--- Select ---"/>
 					    <f:options items="${masSkillLanguageList}" itemValue="id" itemLabel="skillLanguageName"/>
 					    </f:select>
 					    
						
								
			     </div>	
		   
		   </div>
		   
		   
		   
		<div class="form-group form-group-sm">
			    
			     
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			          Speaking:
			     </label>	 		


			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				       <label class="radio-inline" for=abilitySpeaking > 
		 			     	<f:radiobutton id="excSpeaking" name="speaking" path="abilitySpeaking" value="Excellent"/>
		 			  		Excellent
		 			   </label>
		 			 <label class="radio-inline" for="abilitySpeaking"> 
		 			     <f:radiobutton id="goodSpeaking" name="speaking" path="abilitySpeaking" value="Good"/>
				     		Good
				     </label> 
				     <label class="radio-inline" for="abilitySpeaking"> 
		 			     <f:radiobutton id="fairSpeaking" name="speaking" path="abilitySpeaking" value="Fair" checked="true"/>
				    		Fair
				     </label> 	
				     			     		 
				  </div> 
		           
		   </div>
		   
		   
		   
		   
		   <div class="form-group form-group-sm">
			    
			     
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >			        
			          Writing:
			     </label>	 		


			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				       <label class="radio-inline" for="abilityWriting" > 
		 			     	<f:radiobutton id="excWriting" name="writing" path="abilityWriting" value="Excellent"/>
		 			  		Excellent
		 			   </label>
		 			 <label class="radio-inline" for="abilityWriting"> 
		 			     <f:radiobutton id="goodWriting" name="writing" path="abilityWriting" value="Good"/>
				     		Good
				     </label> 
				     <label class="radio-inline" for="abilityWriting"> 
		 			     <f:radiobutton id="fairWriting" name="writing" path="abilityWriting" value="Fair" checked="true"/>
				    		Fair
				     </label> 	
				     			     		 
				  </div> 
		           
		   </div>
		   
		   
		   
		     <div class="form-group form-group-sm">
			    
			     
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			           Reading:
			     </label>	 		


			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				       <label class="radio-inline" for="abilityReading" > 
		 			     	<f:radiobutton id="excReading" name="reading" path="abilityReading" value="Excellent"/>
		 			  		Excellent
		 			   </label>
		 			 <label class="radio-inline" for="abilityReading"> 
		 			     <f:radiobutton id="goodReading" name="reading" path="abilityReading" value="Good"/>
				     		Good
				     </label> 
				     <label class="radio-inline" for="abilityReading"> 
		 			     <f:radiobutton id="fairReading" name="reading" path="abilityReading" value="Fair" checked="true"/>
				    		Fair
				     </label> 	
				     			     		 
				  </div> 
		           
		   </div>
		   
		   
		   
		    <div class="form-group form-group-sm">
			    
			     
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			          Understanding:
			     </label>	 		


			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				       <label class="radio-inline" for="abilityUnderstanding" > 
		 			     	<f:radiobutton id="excUnderstanding" name="understanding" path="abilityUnderstanding" value="Excellent"/>
		 			  		Excellent
		 			   </label>
		 			 <label class="radio-inline" for="abilityUnderstanding"> 
		 			     <f:radiobutton id="goodUnderstanding" name="understanding" path="abilityUnderstanding" value="Good"/>
				     		Good
				     </label> 
				     <label class="radio-inline" for="abilityUnderstanding"> 
		 			     <f:radiobutton id="fairUnderstanding" name="understanding" path="abilityUnderstanding" value="Fair"  checked="true"/>
				    		Fair
				     </label> 	
				     			     		 
				  </div> 
		           
		   </div>
		  
		  
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		     	<button id="saveBtn" name="saveBtn" type="button" class="btn btn-primary">Save</button>
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
        <h4 class="modal-title" id="deleteModalLabel">Delete language</h4>
      </div>
      <div class="modal-body">
      	Do you want to delete language?
      </div>
      <div class="modal-footer">
		<button id="delete" type="button" class="btn btn-danger yesButton" >Yes</button>
      	<button type="button" class="btn btn-info" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>
 
