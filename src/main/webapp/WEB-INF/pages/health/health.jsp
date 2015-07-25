<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<jsp:include page="../employeeMenu.jsp"></jsp:include>
<input id="empId" type="hidden" value="${id}">
<script>

var dt;  	

$(function(){
	
	    $('#congenitalDisease_no').change(function() {
		//alert("no");
			
		$("#congenitalDiseaseExplain").prop('readonly',true);
		$('#congenitalDiseaseExplain2').prop('readonly',true);
		$('#congenitalDiseaseExplain3').prop('readonly',true); 		
		$('#congenitalDiseaseExplain').val('');
	    $('#congenitalDiseaseExplain2').val('');
		$('#congenitalDiseaseExplain3').val('');
			
	});
	
	
	$('#congenitalDisease_yes').change(function() {
		//alert("yes");
		if($('#congenitalDisease_yes').prop('checked')){
			
			 $("#congenitalDiseaseExplain").prop('readonly',false);
			 $('#congenitalDiseaseExplain2').prop('readonly',false);
			 $('#congenitalDiseaseExplain3').prop('readonly',false);
				
		} 
			
	});
	
	
	  if($('#congenitalDisease_no').prop('checked')==true){
			
		    $("#congenitalDiseaseExplain").prop('readonly','readonly');
			$('#congenitalDiseaseExplain2').prop('readonly','readonly');
			$('#congenitalDiseaseExplain3').prop('readonly','readonly');				  		  	    		
			$('#congenitalDiseaseExplain').val('');
		    $('#congenitalDiseaseExplain2').val('');
			$('#congenitalDiseaseExplain3').val('');
			
		 	
			
			
		    
			
	   } 
	 
	 
	 
	 $('#geneticDisease_no').change(function() {
			//alert("no");
				
			$("#geneticDiseaseExplain").prop('readonly','readonly');
			$('#geneticDiseaseExplain2').prop('readonly','readonly');
			$('#geneticDiseaseExplain3').prop('readonly','readonly');
			$('#geneticDiseaseExplain').val('');
			$('#geneticDiseaseExplain2').val('');
			$('#geneticDiseaseExplain3').val('');		
	
	 });
		
	 
	 
	 $('#geneticDisease_yes').change(function() {
			//alert("yes");
		   if($('#geneticDisease_yes').prop('checked')){
				
				$("#geneticDiseaseExplain").prop('readonly',false);
				$('#geneticDiseaseExplain2').prop('readonly',false);
				$('#geneticDiseaseExplain3').prop('readonly',false);
					
			} 
				
	 });
	 
		
	   if($('#geneticDisease_no').prop('checked')==true){
			
			$("#geneticDiseaseExplain").prop('readonly','readonly');
			$('#geneticDiseaseExplain2').prop('readonly','readonly');
			$('#geneticDiseaseExplain3').prop('readonly','readonly');
			$('#geneticDiseaseExplain').val('');
			$('#geneticDiseaseExplain2').val('');
			$('#geneticDiseaseExplain3').val('');
		} 
	   
	   
	   
	   
	   
	   $('#takeMedicine_no').change(function() {
			//alert("no");
			
			$("#takeMedicineExplain").prop('readonly','readonly');
		    $('#takeMedicineExplain').val('');
					
	   });
		
	 
	 
	  $('#takeMedicine_yes').change(function() {
			//alert("yes");
		   if($('#takeMedicine_yes').prop('checked')){
				
			   $("#takeMedicineExplain").prop('readonly',false);
					
			} 
				
	   });
	 
		
	   if($('#takeMedicine_no').prop('checked')==true){
			
		   $("#takeMedicineExplain").prop('readonly','readonly');
		   $('#takeMedicineExplain').val('');			
		} 
	 

	   
	   
	   $('#intolerance_no').change(function() {
			//alert("no");
			
			$("#intoleranceExplain").prop('readonly','readonly');
			$('#intoleranceExplain').val('');
	   });
		
	 
	 
	   $('#intolerance_yes').change(function() {
			//alert("yes");
		   if($('#intolerance_yes').prop('checked')){
				
			   $("#intoleranceExplain").prop('readonly',false);
					
			} 
				
	   });
	 
		
	   if($('#intolerance_no').prop('checked')==true){
			
		   $("#intoleranceExplain").prop('readonly','readonly');
		   $('#intoleranceExplain').val('');
	   }  	 
	 
	
	  alert($('#idHealth').val());
	  var idHealth2;
	  
	  if($('#idHealth').val()===''||$('#idHealth').val()===''){
		  alert('null');
		  $('#deleteBtn').hide();	     
	  }
	  
	  
	  if($('#idHealth').val()!=null&&$('#idHealth').val()!==''){
		  alert('aaa');
		  $('#saveBtn').text("<spring:message code="label.update" />");
		
	  }
	  
	  
	  $(this).find("#saveBtn").off("click").on("click", function(){
		  
	      $("#createModal").on("show.bs.modal", function(event){
	    	  
	      $(this).find("#create").off("click").on("click", function(){
		
 	      $("#createModal").modal('hide');

		  
		  if($('#idHealth').val()==null||$('#idHealth').val()===''){
			  addHealth(function(d) {
		          //processing the data
		          console.log(d);
		          idHealth2 = d;
		          if(idHealth2!=null&&idHealth2!==''){
			    	  doInitEdit(idHealth2);
			    	  $('#saveBtn').text("<spring:message code="label.update" />");
			    	  $('#deleteBtn').show();
			      }
		      });
			
			
		  }else if($('#idHealth').val()!=null&&$('#idHealth').val()!==''){
			  $('#saveBtn').text("<spring:message code="label.update" />");
	    	  $('#deleteBtn').show();
			  doEdit($('#idHealth').val());			  
		  }
	    });
	  });
  }); 
	   
	  
	  
	  $( "#renew" ).on( "click", function() {
		  if($('#idHealth').val()===''||$('#idHealth').val()===''){
		 	  clear();
		  }
		  if($('#idHealth').val()!=null&&$('#idHealth').val()!==''){
			  doFindData();
		  }
	  });
	  
	  
	  
	  function doFindData() {  
	   	   
 	     var id = $("#empId").val();
	  	     $.ajax({  
	  	      type : "POST",   
	  	      url : "<%=request.getContextPath()%>/health/list/"+id,   
	  	      dataType : 'json', 
	  	      contentType :"application/json; charset=utf-8",
	  	     
	  	      success : function(data) {  	  	    	
	  	    
	  	        clear();
	  	        for(var i=0;i<data.length;i++){
	  	        	

					if(data[i].congenitalDisease == "Yes"){
			  			
			  			$('#congenitalDisease_yes').prop('checked', 'checked');
			  			
			  		}else if(data[i].abilitySpeaking == "No"){
			  			
			  			$('#congenitalDisease_no').prop('checked','checked');
			  			
			  		}
					
					

					
					if(data[i].geneticDisease=="Yes"){
						
						$('#geneticDisease_yes').prop('checked', 'checked');
			  			
			  		}else if(data[i].abilitySpeaking == "No"){
			  			
			  			$('#geneticDisease_no').prop('checked','checked');
			  			
			  		}
					
					
					
					if(data[i].takeMedicine=="Yes"){
						
						$('#takeMedicine_yes').prop('checked', 'checked');
			  			
			  		}else if(data[i].abilitySpeaking == "No"){
			  			
			  			$('#takeMedicine_no').prop('checked','checked');
			  			
			  		}
			  		
					
					
					if(data[i].intolerance=="Yes"){
						
						$('#intolerance_yes').prop('checked', 'checked');
			  			
			  		}else if(data[i].abilitySpeaking == "No"){
			  			
			  			$('#intolerance_no').prop('checked','checked');
			  			
			  		}
	    		
					
					$('#congenitalDiseaseExplain').val(data[i].congenitalDiseaseExplain);
					$('#congenitalDiseaseExplain2').val(data[i].congenitalDiseaseExplain2);
					$('#congenitalDiseaseExplain3').val(data[i].congenitalDiseaseExplain3);
					$('#geneticDiseaseExplain').val(data[i].geneticDiseaseExplain);
					$('#geneticDiseaseExplain2').val(data[i].geneticDiseaseExplain2);
					$('#geneticDiseaseExplain3').val(data[i].geneticDiseaseExplain3);
					$('#takeMedicineExplain').val(data[i].takeMedicineExplain);
					$('#intoleranceExplain').val(data[i].intoleranceExplain);
					
	  	 

		  	     }
	  	        		  	        
	  	     }
	  	  }); 
	  	   
	    }
	  
	  
	  
	  
	  
	 
	 function addHealth(callback){
		 
// 		    var id = getUrlParameter('Id');
		    var id = $("#empId").val();
		    //id=2;
		    var congenitalDisease;
		    var geneticDisease;
		    var takeMedicine;
		    var intolerance;
		    var idHealth;
		    
		    if($('#congenitalDisease_no').is(':checked')){
			
		    	congenitalDisease = $('#congenitalDisease_no').val();	
	  			
	  		}else if($('#congenitalDisease_yes').is(':checked')){
	  			
	  			congenitalDisease = $('#congenitalDisease_yes').val();	
	  			
	  		}
		    
		    
		    
		    if($('#geneticDisease_no').is(':checked')){
			
		    	geneticDisease = $('#geneticDisease_no').val();	
	  			
	  		}else if($('#geneticDisease_yes').is(':checked')){
	  			
	  			geneticDisease = $('#geneticDisease_yes').val();	
	  			
	  		}
		    
		    
		    if($('#takeMedicine_no').is(':checked')){
				
		    	takeMedicine = $('#takeMedicine_no').val();	
	  			
	  		}else if($('#takeMedicine_yes').is(':checked')){
	  			
	  			takeMedicine = $('#takeMedicine_yes').val();	
	  			
	  		}
		    
		    
		    
			if($('#intolerance_no').is(':checked')){
				
				intolerance = $('#intolerance_no').val();	
	  			
	  		}else if($('#intolerance_yes').is(':checked')){
	  			
	  			intolerance = $('#intolerance_yes').val();	
	  			
	  		}
		    
		    
	  	    
	  	    $.ajax({  
	  	      type : "POST",   
	  	      url : "<%=request.getContextPath()%>/health/add",   
	  	      dataType : 'json', 
	  	      data : JSON.stringify(
	  	    		{"congenitalDisease":congenitalDisease,
	    			"congenitalDiseaseExplain" : $('#congenitalDiseaseExplain').val(),
  	    			"congenitalDiseaseExplain2": $('#congenitalDiseaseExplain2').val(),
  	    			"congenitalDiseaseExplain3":$('#congenitalDiseaseExplain3').val(),
  	    			"projectOwnerContact":$('#projectOwnerContact').val(),
  	    			"geneticDisease":geneticDisease,
  	    			"geneticDiseaseExplain":$('#geneticDiseaseExplain').val(),
  	    			"geneticDiseaseExplain2":$('#geneticDiseaseExplain2').val(),
  	    			"geneticDiseaseExplain3":$('#geneticDiseaseExplain2').val(),
  	    			"takeMedicine":takeMedicine,
  	    			"takeMedicineExplain":$('#takeMedicineExplain').val(),
  	    			"intolerance":intolerance,
  	    			"intoleranceExplain":$('#intoleranceExplain').val(),
  	    			"employeeId":id}
	  	    		),  
	  	      contentType :"application/json; charset=utf-8",
	  	     
	  	      success : function(data) { 
	  	    	  
	  	    	   /* $("#createModal").modal('hide'); */
	  	    	   $('#idHealth').val(data.id);			  	    	   
	  	    	   idHealth = data.id;
	  	    	   callback(idHealth);
	  	    	   $(function(){ new PNotify({
						 title: 'Success',
						 type: 'success',
						 animation: {
							effect_in: 'show',
							effect_out: 'slide'
						}
				  	});
  	       		   });
	  	     }
	  	    }); 
	  	 
	  	return idHealth;
	 }
	
	
	
	 
	 
	
	 function doInitEdit(idUpdate){
		 
		 
		 $.ajax({  
	  	      type : "POST",   
	  	      url : "<%=request.getContextPath()%>/health/initedit",   
	  	      dataType : 'json', 
	  	      data : JSON.stringify({"id":idUpdate}),  
	  	      contentType :"application/json; charset=utf-8",
	  	     
	  	      success : function(data) {  

	  	    	  
					if(data.congenitalDisease == "Yes"){
			  			
			  			$('#congenitalDisease_yes').prop('checked', 'checked');
			  			
			  		}else if(data.abilitySpeaking == "No"){
			  			
			  			$('#congenitalDisease_no').prop('checked','checked');
			  			
			  		}
					
					

					
					if(data.geneticDisease=="Yes"){
						
						$('#geneticDisease_yes').prop('checked', 'checked');
			  			
			  		}else if(data.abilitySpeaking == "No"){
			  			
			  			$('#geneticDisease_no').prop('checked','checked');
			  			
			  		}
					
					
					
					if(data.takeMedicine=="Yes"){
						
						$('#takeMedicine_yes').prop('checked', 'checked');
			  			
			  		}else if(data.abilitySpeaking == "No"){
			  			
			  			$('#takeMedicine_no').prop('checked','checked');
			  			
			  		}
			  		
					
					
					if(data.intolerance=="Yes"){
						
						$('#intolerance_yes').prop('checked', 'checked');
			  			
			  		}else if(data.abilitySpeaking == "No"){
			  			
			  			$('#intolerance_no').prop('checked','checked');
			  			
			  		}
	    		
					
					$('#congenitalDiseaseExplain').val(data.congenitalDiseaseExplain);
					$('#congenitalDiseaseExplain2').val(data.congenitalDiseaseExplain2);
					$('#congenitalDiseaseExplain3').val(data.congenitalDiseaseExplain3);
					$('#geneticDiseaseExplain').val(data.geneticDiseaseExplain);
					$('#geneticDiseaseExplain2').val(data.geneticDiseaseExplain2);
					$('#geneticDiseaseExplain3').val(data.geneticDiseaseExplain3);
					$('#takeMedicineExplain').val(data.takeMedicineExplain);
					$('#intoleranceExplain').val(data.intoleranceExplain);
					
	  	 
	  	    	
	  	     }
	  	    }); 
	  	   
		 
	 }
	
	
	 
	  function doEdit(idUpdate){
		  
		  var idemp =  $("#empId").val();
		  //var idemp=2;
		  var congenitalDisease;
		  var geneticDisease;
		  var takeMedicine;
		  var intolerance;
		    
		    
		    if($('#congenitalDisease_no').is(':checked')){
			
		    	congenitalDisease = $('#congenitalDisease_no').val();	
	  			
	  		}else if($('#congenitalDisease_yes').is(':checked')){
	  			
	  			congenitalDisease = $('#congenitalDisease_yes').val();	
	  			
	  		}
		    
		    
		    
		    if($('#geneticDisease_no').is(':checked')){
			
		    	geneticDisease = $('#geneticDisease_no').val();	
	  			
	  		}else if($('#geneticDisease_yes').is(':checked')){
	  			
	  			geneticDisease = $('#geneticDisease_yes').val();	
	  			
	  		}
		    
		    
		    if($('#takeMedicine_no').is(':checked')){
				
		    	takeMedicine = $('#takeMedicine_no').val();	
	  			
	  		}else if($('#takeMedicine_yes').is(':checked')){
	  			
	  			takeMedicine = $('#takeMedicine_yes').val();	
	  			
	  		}
		    
		    
		    
			if($('#intolerance_no').is(':checked')){
				
				intolerance = $('#intolerance_no').val();	
	  			
	  		}else if($('#intolerance_yes').is(':checked')){
	  			
	  			intolerance = $('#intolerance_yes').val();	
	  			
	  		}
		    
		    
	    	 
	  	    $.ajax({  
	  	      type : "POST",   
	  	      url : "<%=request.getContextPath()%>/health/edit",   
	  	      dataType : 'json', 
	  	      data :  JSON.stringify(
		  	    		{	"id":idUpdate,
		  	    			"congenitalDisease":congenitalDisease,
			    			"congenitalDiseaseExplain" : $('#congenitalDiseaseExplain').val(),
		  	    			"congenitalDiseaseExplain2": $('#congenitalDiseaseExplain2').val(),
		  	    			"congenitalDiseaseExplain3":$('#congenitalDiseaseExplain3').val(),
		  	    			"geneticDisease":geneticDisease,
		  	    			"geneticDiseaseExplain":$('#geneticDiseaseExplain').val(),
		  	    			"geneticDiseaseExplain2":$('#geneticDiseaseExplain2').val(),
		  	    			"geneticDiseaseExplain3":$('#geneticDiseaseExplain3').val(),
		  	    			"takeMedicine":takeMedicine,
		  	    			"takeMedicineExplain":$('#takeMedicineExplain').val(),
		  	    			"intolerance":intolerance,
		  	    			"intoleranceExplain":$('#intoleranceExplain').val(),
		  	    			"employeeId":idemp}
			  	    		),  
	  	      contentType :"application/json; charset=utf-8",
	  	     
	  	      success : function(data) {  
	  	    	
	  	    	/* $("#createModal").modal('hide'); */
	  	    	doInitEdit($('#idHealth').val());
	  	    	$(function(){ new PNotify({
					 title: 'Success',
					 type: 'success',
					 animation: {
						effect_in: 'show',
						effect_out: 'slide'
					}
				  });
 	       		});
	  	        
	  	     }
	  	    }); 	  	    
		 
	 }
	 
	
	$("#deleteModal").on("show.bs.modal", function(event){
		 			
					
 					var idDelete = $('#idHealth').val();
 					alert('iddel: '+idDelete)
		 			$(this).find("#delete").off("click").on("click", function(){
		 			
		 			
			     			$.ajax({  
				  		  	      type : "POST",   
				  		  	      url : "<%=request.getContextPath()%>/health/delete",   
				  		  	      dataType : 'json', 
				  		  	      data : JSON.stringify({"id":idDelete}),  
				  		  	      contentType :"application/json; charset=utf-8",
			  		  	     
				  		  	      success : function(data) {  
				  		    		
				  		  	    	 if(data=='successs'){
				  		  	    		 $("#deleteModal").modal('hide');
				  		  	    		 $('#deleteBtn').hide();
				  				    	 $('#saveBtn').text("<spring:message code="label.save" />");
				  				    	 clear();
					  	    		     $("#idHealth").val('');
					  	    		  	 $(function(){ new PNotify({
											 title: 'Success',
											 type: 'success',
											 animation: {
												effect_in: 'show',
												effect_out: 'slide'
											}
										  });
						  	       		 });
				  		  	    	 }	  	      
				  		  	    	 
				  		  	     }
			  		  	    }); 
			 
			    });
		 
	 });
	
	
	
	function clear(){
			 $('#congenitalDisease_no').prop('checked', 'checked');
	   		 $('#geneticDisease_no').prop('checked', 'checked');				  		  	    		
	   		 $('#takeMedicine_no').prop('checked', 'checked');
	   	     $('#intolerance_no').prop('checked', 'checked');				  		  	    		
			 $('#congenitalDiseaseExplain').val('');
		     $('#congenitalDiseaseExplain2').val('');
			 $('#congenitalDiseaseExplain3').val('');			
		 	 $('#geneticDiseaseExplain').val('');
			 $('#geneticDiseaseExplain2').val('');
			 $('#geneticDiseaseExplain3').val('');		
		     $('#takeMedicineExplain').val('');
		     $('#intoleranceExplain').val('');
	}
			
	
});
</script>


<div class="row">
	<!-- <div id="message"></div>
	<div id="outputajax" class="form-group"></div> -->
</div>


<input id="empId" type="hidden" value="${id}"/>
<input  id="idHealth" name="ididHealth" type="hidden" value='${healthDto.id}'/>


		<div id="div-information" class="col-md-12" style="padding: 15px 0px 15px 0px;">
				<h2><spring:message code="label.health" />
					<i style="position: absolute; right: 20px; cursor:pointer;" id="icon1" class="fa fa-chevron-up"></i>
				</h2>
	    </div>
	

	<div class="container">     
	

          <f:form id="formAddUpdate" name="healthForm" method="post" commandName="healthDto" class="form-horizontal" role="form">	      	 
	  
	  
		    <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   	
		     <div class="row">       
		        <label class="col-lg-6 col-md-6 col-sm-6 col-xs-6 control-label required" for="congenitalDisease" >
			            <spring:message code="health.question.congenitalDisease" />?
			    </label>	 		
			    
			     
			     <div class="form-group col col-lg-6 col-md-6 col-sm-3 col-xs-3">
				       <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				       
				         <c:if test="${empty healthDto.congenitalDisease}">
					        <label class="radio-inline" for=congenitalDisease> 
				 			     	<f:radiobutton id="congenitalDisease_no" name="congenitalDisease" path="congenitalDisease" value="No" checked="true"/>
				 			  		<spring:message code="default.no" />
				 			 </label>
				 		
				 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
				 			     <f:radiobutton id="congenitalDisease_yes" name="congenitalDisease" path="congenitalDisease" value="Yes"/>
						     	 <spring:message code="default.yes" />
						     </label> 	     		
						 </c:if>
						 
						 <c:if test="${healthDto.congenitalDisease eq 'No'}">
					        <label class="radio-inline" for=congenitalDisease> 
				 			     	<f:radiobutton id="congenitalDisease_no" name="congenitalDisease" path="congenitalDisease" value="No" checked="true"/>
				 			  		<spring:message code="default.no" />
				 			 </label>
				 		
				 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
				 			     <f:radiobutton id="congenitalDisease_yes" name="congenitalDisease" path="congenitalDisease" value="Yes"/>
						     	 <spring:message code="default.yes" />
						     </label> 	     		
						 </c:if>
						 
						 <c:if test="${healthDto.congenitalDisease eq 'Yes'}">
					        <label class="radio-inline" for=congenitalDisease> 
				 			     	<f:radiobutton id="congenitalDisease_no" name="congenitalDisease" path="congenitalDisease" value="No"/>
				 			  		<spring:message code="default.no" />
				 			 </label>
				 		
				 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
				 			     <f:radiobutton id="congenitalDisease_yes" name="congenitalDisease" path="congenitalDisease" value="Yes" checked="true"/>
						     	 <spring:message code="default.yes" />
						     </label> 	     		
						</c:if>
				
					 
				  </div>   
		    </div>
		   </div>
		  </div> 
		   
		   
		   
		   
		   <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
			     <div class="row">
			           
			        <label class="col-lg-6 col-md-6 col-sm-6 col-xs-6 control-label required" for="congenitalDisease" >
				            <spring:message code="health.congenitalDiseaseExplain1" var="congenitalDiseaseExplain1"/>${congenitalDiseaseExplain1 }:
				    </label>	 		

     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="congenitalDiseaseExplain" path="congenitalDiseaseExplain" cssClass="form-control required" placeholder="${congenitalDiseaseExplain1 }" value="${healthDto.congenitalDiseaseExplain}"/>					     								
				     </div>	
			     
			     </div>
		   </div>
			     
			 
		   <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
			      <div class="row">
			         <label class="col-lg-6 col-md-6 col-sm-6 col-xs-6 control-label required" for="congenitalDisease2" >
			           		<spring:message code="health.congenitalDiseaseExplain2" var="congenitalDiseaseExplain2"/>${congenitalDiseaseExplain2 }: 
			   		 </label>	 		
		     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="congenitalDiseaseExplain2" path="congenitalDiseaseExplain2" cssClass="form-control required" placeholder="${congenitalDiseaseExplain2 }" value="${healthDto.congenitalDiseaseExplain2}"/>					     								
				     </div>			 	 
			 	 </div>
		   
		   </div>
		   
		   
		   
		   
		      <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
			     <div class="row">
		   
			         <label class="col-lg-6 col-md-6 col-sm-6 col-xs-6 control-label required" for="congenitalDisease3" >
			           		<spring:message code="health.congenitalDiseaseExplain3" var="congenitalDiseaseExplain3"/>${congenitalDiseaseExplain3 }: 
			   		 </label>	 		
		     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="congenitalDiseaseExplain3" path="congenitalDiseaseExplain3" cssClass="form-control required" placeholder="${congenitalDiseaseExplain3 }" value="${healthDto.congenitalDiseaseExplain3}"/>					     								
				     </div>	
				 </div>
			</div>
			 	
			 	
		   
		   
		   
		   
		   
		   
		     <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
		      <div class="row">
		           
		        <label class="col-lg-6 col-md-6 col-sm-6 col-xs-6 control-label required" for="geneticDisease" >
			           <spring:message code="health.question.GeneticDisease" />?
			    </label>	 		
			    
			     
			     
			   <div class="form-group col col-lg-6 col-md-6 col-sm-3 col-xs-3">
				  <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		
				  
			       <c:if test="${empty healthDto.geneticDisease}">
			        <label class="radio-inline" for=geneticDisease > 
		 			     	<f:radiobutton id="geneticDisease_no" name="geneticDisease" path="geneticDisease" value="No" checked="true"/>
		 			  		<spring:message code="default.no" />
		 			 </label>
		 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
		 			     <f:radiobutton id="geneticDisease_yes" name="geneticDisease" path="geneticDisease" value="Yes"/>
				     		<spring:message code="default.yes" />
				     </label> 	     		
				   </c:if>  	
				   
				    <c:if test="${healthDto.geneticDisease eq 'No'}">
			        <label class="radio-inline" for=geneticDisease > 
		 			     	<f:radiobutton id="geneticDisease_no" name="geneticDisease" path="geneticDisease" value="No" checked="true"/>
		 			  		<spring:message code="default.no" />
		 			 </label>
		 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
		 			     <f:radiobutton id="geneticDisease_yes" name="geneticDisease" path="geneticDisease" value="Yes"/>
				     		<spring:message code="default.yes" />
				     </label> 	     		
				   </c:if>  	
				   
				   <c:if test="${healthDto.geneticDisease eq 'Yes'}">
			        <label class="radio-inline" for=geneticDisease > 
		 			     	<f:radiobutton id="geneticDisease_no" name="geneticDisease" path="geneticDisease" value="No"/>
		 			  		<spring:message code="default.no" />
		 			 </label>
		 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
		 			     <f:radiobutton id="geneticDisease_yes" name="geneticDisease" path="geneticDisease" value="Yes" checked="true"/>
				     		<spring:message code="default.yes" />
				     </label> 	     		
				   </c:if>  	
				   							
			     </div>	
			   </div>
		    </div>
		   </div>
		   
		   
		
		   
		   
		   
		   
		   <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
			     <div class="row">
			           
			        <label class="col-lg-6 col-md-6 col-sm-6 col-xs-6 control-label required" for="geneticDisease" >
				           <spring:message code="health.geneticDiseaseExplain1" var="geneticDiseaseExplain1"/>${geneticDiseaseExplain1 }: 
				    </label>	 		

     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="geneticDiseaseExplain" path="geneticDiseaseExplain" cssClass="form-control required" placeholder="${geneticDiseaseExplain1 }" value="${healthDto.geneticDiseaseExplain}"/>					     								
				     </div>	
				 
		        
			 	 </div>
		   
		   </div>
		   
		   
		   
		    <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
			     <div class="row">
			           
			     
		           
			         <label class="col-lg-6 col-md-6 col-sm-6 col-xs-6 control-label required" for="congenitalDisease2" >
			           		<spring:message code="health.geneticDiseaseExplain2" var="geneticDiseaseExplain2"/>${geneticDiseaseExplain2 }: 
			   		 </label>	 		
		     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="geneticDiseaseExplain2" path="geneticDiseaseExplain2" cssClass="form-control required" placeholder="${geneticDiseaseExplain1}"  value="${healthDto.geneticDiseaseExplain2}"/>					     								
				     </div>			 	 			 
			         
			 	 </div>
		   
		   </div>
		   
		   
		   
		    <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
			     <div class="row">
		   
				    <label class="col-lg-6 col-md-6 col-sm-6 col-xs-6 control-label required" for="congenitalDisease3" >
					    <spring:message code="health.geneticDiseaseExplain3" var="geneticDiseaseExplain3"/>${geneticDiseaseExplain3 }: 
				    </label>	 		
		     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="geneticDiseaseExplain3" path="geneticDiseaseExplain3" cssClass="form-control required" placeholder="${geneticDiseaseExplain1}"  value="${healthDto.geneticDiseaseExplain3}"/>					     								
		 			</div>	
		 		</div>
		 	</div>
			 	 
		   
		   
		   
		   
		    <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
		       <div class="row">
		           
			        <label class="col-lg-6 col-md-6 col-sm-6 col-xs-6 control-label required" for="geneticDisease" >
				          <spring:message code="health.question.TakeMedicine" />?			          
				    </label>	 		
				    
				     
				     
				      <div class="form-group from-group-sm  col col-lg-6 col-md-6 col-sm-3 col-xs-3">
						 <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
						 
					   <c:if test="${empty healthDto.takeMedicine}">						     
					        <label class="radio-inline" for=takeMedicine > 
				 			     	<f:radiobutton id="takeMedicine_no" name="takeMedicine" path="takeMedicine" value="No" checked="true"/>
				 			  		<spring:message code="default.no" />
				 			 </label>
				 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
				 			     <f:radiobutton id="takeMedicine_yes" name="takeMedicine" path="takeMedicine" value="Yes"/>
						     		<spring:message code="default.yes" />
						     </label> 	     							     												    
				       </c:if>
				       
				       <c:if test="${healthDto.takeMedicine eq 'No'}">						     
					        <label class="radio-inline" for=takeMedicine > 
				 			     	<f:radiobutton id="takeMedicine_no" name="takeMedicine" path="takeMedicine" value="No" checked="true"/>
				 			  		<spring:message code="default.no" />
				 			 </label>
				 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
				 			     <f:radiobutton id="takeMedicine_yes" name="takeMedicine" path="takeMedicine" value="Yes"/>
						     		<spring:message code="default.yes" />
						     </label> 	     							     												    
				       </c:if>
				       
				        <c:if test="${healthDto.takeMedicine eq 'Yes'}">						     
					        <label class="radio-inline" for=takeMedicine > 
				 			     	<f:radiobutton id="takeMedicine_no" name="takeMedicine" path="takeMedicine" value="No"/>
				 			  		<spring:message code="default.no" />
				 			 </label>
				 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
				 			     <f:radiobutton id="takeMedicine_yes" name="takeMedicine" path="takeMedicine" value="Yes"  checked="true"/>
						     		<spring:message code="default.yes" />
						     </label> 	     							     												    
				       </c:if>
				    
				    
				     </div>	
				   </div>
				 </div>
			    </div>
			    
			    
			  
			  
			    
			     <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
			         <div class="row">
				        <label class="col-lg-6 col-md64 col-sm-6 col-xs-6 control-label required" for="takeMedicineExplain" >
					           <spring:message code="health.takeMedicineExplain1" var="takeMedicineExplain1"/>${takeMedicineExplain1 }: 
					    </label>	 		
	
	     
					     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
					        	<f:input  id="takeMedicineExplain" path="takeMedicineExplain" cssClass="form-control required" placeholder="${takeMedicineExplain1}"  value="${healthDto.takeMedicineExplain}" />					     								
					     </div>	
					  </div>
				
			    </div>
			    
			    
			    
			    
			    
			    
			    
			     <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
		     	  <div class="row">
		           
			        <label class="col-lg-6 col-md-6 col-sm-6 col-xs-6 control-label required" for="intolerance" >
				          <spring:message code="health.question.Intolerance" />?
				    </label>	 		
				    
				     
				     
				     <div class="form-group col col-lg-6 col-md-6 col-sm-3 col-xs-3">
				       <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				     
	                   <c:if test="${empty healthDto.takeMedicine}">				     
					        <label class="radio-inline" for=intolerance > 
				 			     	<f:radiobutton id="intolerance_no" name="intolerance" path="intolerance" value="No" checked="true"/>
				 			  		<spring:message code="default.no" />
				 			 </label>
				 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
				 			     <f:radiobutton id="intolerance_yes" name="intolerance" path="intolerance" value="Yes"/>
						     	 <spring:message code="default.yes" />
						     </label> 	
					    </c:if> 
					    
					    <c:if test="${healthDto.takeMedicine eq 'No'}">				     
					        <label class="radio-inline" for=intolerance > 
				 			     	<f:radiobutton id="intolerance_no" name="intolerance" path="intolerance" value="No" checked="true"/>
				 			  		<spring:message code="default.no" />
				 			 </label>
				 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
				 			     <f:radiobutton id="intolerance_yes" name="intolerance" path="intolerance" value="Yes"/>
						     	 <spring:message code="default.yes" />
						     </label> 	
					    </c:if> 
					    
					    <c:if test="${healthDto.takeMedicine eq 'Yes'}">				     
					        <label class="radio-inline" for=intolerance > 
				 			     	<f:radiobutton id="intolerance_no" name="intolerance" path="intolerance" value="No"/>
				 			  		<spring:message code="default.no" />
				 			 </label>
				 			 <label class="radio-inline" for="congenitalDisease" style="margin-left: 1px;"> 
				 			     <f:radiobutton id="intolerance_yes" name="intolerance" path="intolerance" value="Yes" checked="true"/>
						     	 <spring:message code="default.yes" />
						     </label> 	
					    </c:if> 
					          							     								
				     </div>	
				    </div>
				   </div> 
			    </div>
			    
			    
			  
			  
			    
			     <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
			      <div class="row">
			           
			        <label class="col-lg-6 col-md-6 col-sm-6 col-xs-6 control-label required" for="intoleranceExplain" >
				          <spring:message code="health.intoleranceExplain" var="intoleranceExplain"/>${intoleranceExplain }: 
				    </label>	 		

     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="intoleranceExplain" path="intoleranceExplain" cssClass="form-control required" placeholder="${intoleranceExplain}"  value="${healthDto.intoleranceExplain}"/>					     								
				     </div>	
				  </div>
			    </div>
	

		
		  
		      <div  align="center" style="margin-bottom: 5%;">
		       <div id="btn">
		        <button  id="renew" type="button" class="btn btn-info btn-md" ><spring:message code="label.renew" /></button>
		        <button id="saveBtn" name="saveBtn" type="button" class="btn btn-info btn-md"  data-toggle="modal" data-target="#createModal"><spring:message code="label.save" /></button>
		        <button id="deleteBtn" name="deleteBtn" type="button" class="btn btn-danger active btn-md" data-toggle="modal" data-target="#deleteModal"><spring:message code="label.delete" /></button>
		      </div>
		      </div>
 
      </f:form>
</div>
 



<!-- Modal Create and Update -->
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title" id="createModalLabel"><spring:message code="health.name" /></h4>
      </div>
      <div class="modal-body">
      	<spring:message code="default.create.confirm" />
      </div>
      <div class="modal-footer">
		<button id="create" type="button" class="btn btn-info yesButton" ><spring:message code="default.yes" /></button>
      	<button type="button" class="btn btn-danger" data-dismiss="modal"><spring:message code="default.no" /></button>
      </div>
    </div>
  </div>
</div>


<!-- Modal Delete -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title" id="deleteModalLabel"><spring:message code="health.name" /></h4>
      </div>
      <div class="modal-body">
      	<spring:message code="default.delete.confirm" />
      </div>
      <div class="modal-footer">
		<button id="delete" type="button" class=" btn btn-info yesButton" ><spring:message code="default.yes" /></button>
      	<button type="button" class="btn btn-danger" data-dismiss="modal"><spring:message code="default.no" /></button>
      </div>
    </div>
  </div>
</div>
 
 
