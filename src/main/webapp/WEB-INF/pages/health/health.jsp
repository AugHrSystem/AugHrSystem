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
			
	   } 
	 
	 
	 
	 $('#geneticDisease_no').change(function() {
			//alert("no");
				
			$("#geneticDiseaseExplain").prop('readonly','readonly');
			$('#geneticDiseaseExplain2').prop('readonly','readonly');
			$('#geneticDiseaseExplain3').prop('readonly','readonly');
				
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
			
		} 
	   
	   
	   
	   
	   
	   $('#takeMedicine_no').change(function() {
			//alert("no");
			
			$("#takeMedicineExplain").prop('readonly','readonly');
				
	   });
		
	 
	 
	  $('#takeMedicine_yes').change(function() {
			//alert("yes");
		   if($('#takeMedicine_yes').prop('checked')){
				
			   $("#takeMedicineExplain").prop('readonly',false);
					
			} 
				
	   });
	 
		
	   if($('#takeMedicine_no').prop('checked')==true){
			
		   $("#takeMedicineExplain").prop('readonly','readonly');
			
		} 
	 

	   
	   
	   $('#intolerance_no').change(function() {
			//alert("no");
			
			$("#intoleranceExplain").prop('readonly','readonly');
				
	   });
		
	 
	 
	   $('#intolerance_yes').change(function() {
			//alert("yes");
		   if($('#intolerance_yes').prop('checked')){
				
			   $("#intoleranceExplain").prop('readonly',false);
					
			} 
				
	   });
	 
		
	   if($('#intolerance_no').prop('checked')==true){
			
		   $("#intoleranceExplain").prop('readonly','readonly');
			
	   }  
	 
	 
	   $('#tableResult').dataTable({ 
			"bLengthChange": false,
			"iDisplayLength": 10,
			"pagingType": "simple_numbers",
			"ordering": false,
			"info": false
		});
	dt = $('#tableResult').dataTable();
	 
	 
	doFindData(); 
	
	
	
	
	 $("#addModal").on("show.bs.modal", function(event){
			 
			 
    	    var button = $(event.relatedTarget);
    		var idUpdate = button.data("idupdate"); 
    		if(idUpdate != null){
    		
    			doInitEdit(idUpdate);
    			
			}
     		
    		$(this).find("#saveBtn").off("click").on("click", function()
    		{
    			if(idUpdate != null){
    				 doEdit(idUpdate);
    			}
    			else {
    				 addHealth();
    			}
    		});
    	  
      });
	 
	
	 $('#addModal').on("hidden.bs.modal",function(event){
		   
		   $('#formAddUpdate')[0].reset();
	  
	  });
	   

	 
	 function addHealth(){
		 
// 		    var id = getUrlParameter('Id');
		    var id = $("#empId").val();
		    //id=2;
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
	  	    	 
	  	    	    $('#addModal').modal('hide');
	  	    	    doFindData();
	  	    		$("#message").html('<div class="alert alert-success" role="alert">Success</div>');
		    		
	  	     }
	  	    }); 
	  	    
		 
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
		  	    			"projectOwnerContact":$('#projectOwnerContact').val(),
		  	    			"geneticDisease":geneticDisease,
		  	    			"geneticDiseaseExplain":$('#geneticDiseaseExplain').val(),
		  	    			"geneticDiseaseExplain2":$('#geneticDiseaseExplain2').val(),
		  	    			"geneticDiseaseExplain3":$('#geneticDiseaseExplain2').val(),
		  	    			"takeMedicine":takeMedicine,
		  	    			"takeMedicineExplain":$('#takeMedicineExplain').val(),
		  	    			"intolerance":intolerance,
		  	    			"intoleranceExplain":$('#intoleranceExplain').val(),
		  	    			"employeeId":idemp}
			  	    		),  
	  	      contentType :"application/json; charset=utf-8",
	  	     
	  	      success : function(data) {  
	  	    	
	  	    	 
	  	    	  
	  	    	  //alert(JSON.stringify(data));
	  	    	 
	  	    	
	  	       		 $('#addModal').modal('hide');	  
	  	         	 $("#message").html('<div class="alert alert-success" role="alert">Success</div>');
	  	       	     doFindData();		  			 
	  	        
	  	     }
	  	    }); 	  	    
		 
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	
	function doFindData() {  
	   	  
// 		  var id = getUrlParameter('Id');
		  var congenitalDiseaseExplain;
		  var geneticDiseaseExplain;
		  var id = $("#empId").val();
   	     
	  	     $.ajax({  
	  	      type : "POST",   
	  	      url : "<%=request.getContextPath()%>/health/list/"+id,   
	  	      dataType : 'json', 
	  	      contentType :"application/json; charset=utf-8",
	  	     
	  	      success : function(data) {  
	    		
	  	    
	  	        dt.fnClearTable();
	  	    	
	  	        for(var i=0;i<data.length;i++){
	  	        	
	  	       
	  	        	if(data[i].congenitalDiseaseExplain=="{null}"){

	  	        		congenitalDiseaseExplain = "";
	  	        		
	  	        	}if(data[i].congenitalDiseaseExplain2=="{null}"){
	  	        		//alert('aaa');
	  	        		congenitalDiseaseExplain = "";
	  	        	}if(data[i].congenitalDiseaseExplain3!="{null}"){
	  	        		
	  	        		congenitalDiseaseExplain = "";
	  	        	}
	  	        	
	  	        	
	  	        	
	  	        	if(data[i].congenitalDiseaseExplain!="{null}"){

	  	        		congenitalDiseaseExplain = data[i].congenitalDiseaseExplain;
	  	        		
	  	        	}if(data[i].congenitalDiseaseExplain2!="{null}"){
	  	        		//alert('aaa');
	  	        		congenitalDiseaseExplain = data[i].congenitalDiseaseExplain+', '+data[i].congenitalDiseaseExplain2;
	  	        	}if(data[i].congenitalDiseaseExplain3!="{null}"){
	  	        		
	  	        		congenitalDiseaseExplain = data[i].congenitalDiseaseExplain+', '+data[i].congenitalDiseaseExplain2+',  '+data[i].congenitalDiseaseExplain3;
	  	        	}
	  	        	
	  	        	
	  	        	
	  	        	
	  	        	if(data[i].geneticDiseaseExplain=="{null}"){

	  	        		geneticDiseaseExplain = "";
	  	        		
	  	        	}if(data[i].geneticDiseaseExplain2=="{null}"){
	  	        		
	  	        		geneticDiseaseExplain = "";
	  	        		
	  	        	}if(data[i].geneticDiseaseExplain3!="{null}"){
	  	        		
	  	        		geneticDiseaseExplain = "";
	  	        	}
	  	        	
	  	        	

	  	        	if(data[i].geneticDiseaseExplain!="{null}"){
	  	        		
	  	        		geneticDiseaseExplain = data[i].geneticDiseaseExplain;
	  	        		
	  	        	}if(data[i].geneticDiseaseExplain2!="{null}"){
	  	        		//alert('aaa');
	  	        		geneticDiseaseExplain = data[i].geneticDiseaseExplain+', '+data[i].geneticDiseaseExplain2;
	  	        	}if(data[i].geneticDiseaseExplain3!="{null}"){
	  	        		
	  	        		geneticDiseaseExplain = data[i].geneticDiseaseExplain+', '+data[i].geneticDiseaseExplain2+',  '+data[i].geneticDiseaseExplain3;
	  	        	}
	  	            
	  	        	
	  	        	
	  	        	
	  	        	
					if(data[i].takeMedicineExplain=="{null}"){
	  	        		
						takeMedicineExplain = "";
	  	        		
	  	        	}
					
					if(data[i].takeMedicineExplain!="{null}"){
	  	        		//alert('aaa');
	  	        		takeMedicineExplain = data[i].takeMedicineExplain;
	  	        	}
					

					
					
					if(data[i].intoleranceExplain=="{null}"){
	  	        		
						intoleranceExplain = "";
	  	        		
	  	        	}
					
					if(data[i].intoleranceExplain!="{null}"){
	  	        		//alert('aaa');
	  	        		intoleranceExplain = data[i].intoleranceExplain;
	  	        	}
	  	            
	  	            
	  	            
	  	         
	  	        	   dt.fnAddData([ 
				  			           data[i].congenitalDisease,
				  			           congenitalDiseaseExplain,
				  			           data[i].geneticDisease,
				  			           geneticDiseaseExplain,
				  			           data[i].takeMedicine,
				  			           takeMedicineExplain,
				  			           data[i].intolerance,
				  			           intoleranceExplain,
				  			          '<button type="button" class="btn btn-warning btn-sm active" data-idupdate="' + data[i].id + '" data-target="#addModal" data-toggle="modal"><spring:message code="label.edit" /></button>'+
				    				  '<button type="button" class="btn btn-danger btn-sm active" data-iddelete="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal"><spring:message code="label.delete" /></button>'
				    					
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
	  	    	  //$("#outputajax").text(testStatus); 
	  	     }  
	  	    }); 
	  	   
	    }
	
	
	
	
	
	
	
	$("#deleteModal").on("show.bs.modal", function(event){
		 
			var button = $(event.relatedTarget);
 			var idDelete = button.data("iddelete"); 
				
	 		
		 			$(this).find("#delete").off("click").on("click", function(){
		 			
		 			
			     			$.ajax({  
				  		  	      type : "POST",   
				  		  	      url : "<%=request.getContextPath()%>/health/delete",   
				  		  	      dataType : 'json', 
				  		  	      data : JSON.stringify({"id":idDelete}),  
				  		  	      contentType :"application/json; charset=utf-8",
			  		  	     
				  		  	      success : function(data) {  
				  		    		
				  		  	    	
				  		  	    	$('#deleteModal').modal('hide');
				  		  	    	$("#message").html('<div class="alert alert-success" role="alert">Success</div>');	
				  	  	       	    doFindData();		  	      
				  		  	    	 
				  		  	     }
			  		  	    }); 
			 
			    });
		 
	 });
	
	
	
	

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
		<h2><spring:message code="health.name" /></h2>
	</div>

    <div class="col-md-6">
       <div class="form-group" align="right">
        <br/>
    		<button type="button" class="btn btn-warning active btn-md" data-toggle="modal" data-target="#addModal"><spring:message code="label.newRecord" /></button>
      	<br/>
      </div>	
	</div>
</div>

<div class="row">
	<div id="message"></div>
	<div id="outputajax" class="form-group"></div>
</div>

 <table id="tableResult" class="dataTable stripe table-bordered">
	    <thead>
            <tr> 
                <th><spring:message code="health.congenitalDisease" /></th>
                <th><spring:message code="health.congenitaldiseaseSpecified" /></th>
                <th><spring:message code="health.GeneticDisease" /></th>
                <th><spring:message code="health.GeneticDiseaseSpecified" /></th> 
                <th><spring:message code="health.TakeMedicine" /></th>
                <th><spring:message code="health.TakeMedicineSpecified" /></th>
                <th><spring:message code="health.Intolerance" /></th>
                <th><spring:message code="health.IntoleranceSpecified" /></th>
                <th><spring:message code="label.action" /></th>
<!--                 <th></th> -->
            </tr>
        </thead>
</table>




<!-- Modal Add and Update data-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="health.name" /></h4>
      </div>
      <div class="modal-body">
          
             
          
            <f:form id="formAddUpdate" name="healthForm" method="post" commandName="health" class="form-horizontal" role="form">	      	 
	  
	  
		    <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
		           
		        <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="congenitalDisease" >
			            <spring:message code="health.question.congenitalDisease" />?
			    </label>	 		
			    
			     
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
			     
			        <label class="radio-inline" for=congenitalDisease > 
		 			     	<f:radiobutton id="congenitalDisease_no" name="congenitalDisease" path="congenitalDisease" value="No" checked="true"/>
		 			  		<spring:message code="default.no" />
		 			 </label>
		 			 <label class="radio-inline" for="congenitalDisease"> 
		 			     <f:radiobutton id="congenitalDisease_yes" name="congenitalDisease" path="congenitalDisease" value="Yes"/>
				     		<spring:message code="default.yes" />
				     </label> 	     		
				     								
			     </div>	
		   
		   </div>
		   
		   
		   
		   
		   
		   <div class="form-group form-group-sm  col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
			     <div class="row">
			           
			        <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="congenitalDisease" >
				            <spring:message code="health.congenitalDiseaseExplain1" var="congenitalDiseaseExplain1"/>${congenitalDiseaseExplain1 }:
				    </label>	 		

     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="congenitalDiseaseExplain" path="congenitalDiseaseExplain" cssClass="form-control required" placeholder="${congenitalDiseaseExplain1 }" />					     								
				     </div>	
			     
			     </div>
		   </div>
			     
			 
		   <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
			      <div class="row">
			         <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="congenitalDisease2" >
			           		<spring:message code="health.congenitalDiseaseExplain2" var="congenitalDiseaseExplain2"/>${congenitalDiseaseExplain2 }: 
			   		 </label>	 		
		     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="congenitalDiseaseExplain2" path="congenitalDiseaseExplain2" cssClass="form-control required" placeholder="${congenitalDiseaseExplain2 }" />					     								
				     </div>			 	 
			 	 </div>
		   
		   </div>
		   
		   
		   
		   
		      <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
			     <div class="row">
		   
			         <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="congenitalDisease3" >
			           		<spring:message code="health.congenitalDiseaseExplain3" var="congenitalDiseaseExplain3"/>${congenitalDiseaseExplain3 }: 
			   		 </label>	 		
		     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="congenitalDiseaseExplain3" path="congenitalDiseaseExplain3" cssClass="form-control required" placeholder="${congenitalDiseaseExplain3 }" />					     								
				     </div>	
				 </div>
			</div>
			 	
			 	
		   
		   
		   
		   
		   
		   
		     <div class="form-group form-group-sm  col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
		           
		        <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="geneticDisease" >
			           <spring:message code="health.question.GeneticDisease" />?
			    </label>	 		
			    
			     
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
			     
			        <label class="radio-inline" for=geneticDisease > 
		 			     	<f:radiobutton id="geneticDisease_no" name="geneticDisease" path="geneticDisease" value="No" checked="true"/>
		 			  		<spring:message code="default.no" />
		 			 </label>
		 			 <label class="radio-inline" for="congenitalDisease"> 
		 			     <f:radiobutton id="geneticDisease_yes" name="geneticDisease" path="geneticDisease" value="Yes"/>
				     		<spring:message code="default.yes" />
				     </label> 	     		
				     								
			     </div>	
		   
		   </div>
		   
		   
		
		   
		   
		   
		   
		   <div class="form-group form-group-sm  col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
			     <div class="row">
			           
			        <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="geneticDisease" >
				           <spring:message code="health.geneticDiseaseExplain1" var="geneticDiseaseExplain1"/>${geneticDiseaseExplain1 }: 
				    </label>	 		

     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="geneticDiseaseExplain" path="geneticDiseaseExplain" cssClass="form-control required" placeholder="${geneticDiseaseExplain1 }" />					     								
				     </div>	
				 
		        
			 	 </div>
		   
		   </div>
		   
		   
		   
		    <div class="form-group form-group-sm  col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
			     <div class="row">
			           
			     
		           
			         <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="congenitalDisease2" >
			           		<spring:message code="health.geneticDiseaseExplain2" var="geneticDiseaseExplain2"/>${geneticDiseaseExplain2 }: 
			   		 </label>	 		
		     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="geneticDiseaseExplain2" path="geneticDiseaseExplain2" cssClass="form-control required" placeholder="${geneticDiseaseExplain1 }" />					     								
				     </div>			 	 			 
			         
			 	 </div>
		   
		   </div>
		   
		   
		   
		    <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
			     <div class="row">
		   
				    <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="congenitalDisease3" >
					    <spring:message code="health.geneticDiseaseExplain3" var="geneticDiseaseExplain3"/>${geneticDiseaseExplain3 }: 
				    </label>	 		
		     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="geneticDiseaseExplain3" path="geneticDiseaseExplain3" cssClass="form-control required" placeholder="${geneticDiseaseExplain1 }" />					     								
		 			</div>	
		 		</div>
		 	</div>
			 	 
		   
		   
		   
		   
		    <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
		     
		           
			        <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="geneticDisease" >
				          <spring:message code="health.question.TakeMedicine" />?			          
				    </label>	 		
				    
				     
				     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				     
				        <label class="radio-inline" for=takeMedicine > 
			 			     	<f:radiobutton id="takeMedicine_no" name="takeMedicine" path="takeMedicine" value="No" checked="true"/>
			 			  		<spring:message code="default.no" />
			 			 </label>
			 			 <label class="radio-inline" for="congenitalDisease"> 
			 			     <f:radiobutton id="takeMedicine_yes" name="takeMedicine" path="takeMedicine" value="Yes"/>
					     		<spring:message code="default.yes" />
					     </label> 	     							     								
				     </div>	
				     
			    </div>
			    
			    
			  
			  
			    
			     <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
			           
			        <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="takeMedicineExplain" >
				           <spring:message code="health.takeMedicineExplain1" var="takeMedicineExplain1"/>${takeMedicineExplain1 }: 
				    </label>	 		

     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="takeMedicineExplain" path="takeMedicineExplain" cssClass="form-control required" placeholder="${takeMedicineExplain1 }" />					     								
				     </div>	
				
			    </div>
			    
			    
			    
			    
			    
			    
			    
			     <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
		   
		     
		           
			        <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="intolerance" >
				          <spring:message code="health.question.Intolerance" />?
				    </label>	 		
				    
				     
				     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				     
				        <label class="radio-inline" for=intolerance > 
			 			     	<f:radiobutton id="intolerance_no" name="intolerance" path="intolerance" value="No" checked="true"/>
			 			  		<spring:message code="default.no" />
			 			 </label>
			 			 <label class="radio-inline" for="congenitalDisease"> 
			 			     <f:radiobutton id="intolerance_yes" name="intolerance" path="intolerance" value="Yes"/>
					     		<spring:message code="default.yes" />
					     </label> 	     							     								
				     </div>	
				     
			    </div>
			    
			    
			  
			  
			    
			     <div class="form-group form-group-sm col col-lg-12 col-md-12 col-sm-12 col-xs-12">
			           
			        <label class="col-lg-4 col-md-4 col-sm-6 col-xs-6 control-label required" for="intoleranceExplain" >
				          <spring:message code="health.intoleranceExplain" var="intoleranceExplain"/>${intoleranceExplain }: 
				    </label>	 		

     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="intoleranceExplain" path="intoleranceExplain" cssClass="form-control required" placeholder="${intoleranceExplain }" />					     								
				     </div>	
				
			    </div>
	

		
		  
		      <div align="center">
		        <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="label.close" /></button>
		        <button id="saveBtn" name="saveBtn" type="button" class="btn btn-primary"><spring:message code="label.save" /></button>
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
        <h4 class="modal-title" id="deleteModalLabel"><spring:message code="health.name" /></h4>
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
 
 
