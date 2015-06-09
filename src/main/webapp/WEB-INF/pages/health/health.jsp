<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<jsp:include page="../employeeMenu.jsp"></jsp:include>

<script>

var dt;  	

$(function(){
	
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
		 
		    var id = getUrlParameter('Id');
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
		    		
	  	     },  
	  	      error : function(data,testStatus,jqXHR) {  
	  	           
	  	    	   $('#addModal').modal('hide');
	  	    	   $("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
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
					
	  	    	
	  	    	
	  	     },  
	  	      error : function(data,testStatus,jqXHR) {  
	  	    	  
	  	    	$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
	  	     }  
	  	    }); 
	  	   
		 
	 }
	
	
	 
	  function doEdit(idUpdate){
		  
		  var idemp = getUrlParameter('Id');
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
	  	        
	  	     },  
	  	      error : function(data,testStatus,jqXHR) {  

	  	      $('#myModalUpdate').modal('hide');	   
	  	      $("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
	  	     }  
	  	    }); 	  	    
		 
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	
	function doFindData() {  
	   	  
		  var id = getUrlParameter('Id');
		  var congenitalDiseaseExplain;
		  var geneticDiseaseExplain;
   	     
   	     
	  	     $.ajax({  
	  	      type : "POST",   
	  	      url : "<%=request.getContextPath()%>/health/list/"+id,   
	  	      dataType : 'json', 
	  	      contentType :"application/json; charset=utf-8",
	  	     
	  	      success : function(data) {  
	    		
	  	    
	  	        dt.fnClearTable();
	  	    	
	  	        for(var i=0;i<data.length;i++){
	  	        	
	  	        	
	  	        	if(data[i].congenitalDiseaseExplain!=null&&data[i].congenitalDiseaseExplain!==""){
	  	        		
	  	        		congenitalDiseaseExplain = data[i].congenitalDiseaseExplain;
	  	        		
	  	        	}if(data[i].congenitalDiseaseExplain2!=null&&data[i].congenitalDiseaseExplain2!==""){
	  	        		//alert('aaa');
	  	        		congenitalDiseaseExplain = data[i].congenitalDiseaseExplain+', '+data[i].congenitalDiseaseExplain2;
	  	        	}if(data[i].congenitalDiseaseExplain3!=null&&data[i].congenitalDiseaseExplain3!==""){
	  	        		
	  	        		congenitalDiseaseExplain = data[i].congenitalDiseaseExplain+', '+data[i].congenitalDiseaseExplain2+',  '+data[i].congenitalDiseaseExplain3;
	  	        	}
	  	        	
	  	        	
	  	        	
	  	        	

	  	        	if(data[i].geneticDiseaseExplain!=null&&data[i].geneticDiseaseExplain!==""){
	  	        		
	  	        		geneticDiseaseExplain = data[i].geneticDiseaseExplain;
	  	        		
	  	        	}if(data[i].geneticDiseaseExplain2!=null&&data[i].geneticDiseaseExplain2!==""){
	  	        		//alert('aaa');
	  	        		geneticDiseaseExplain = data[i].geneticDiseaseExplain+', '+data[i].geneticDiseaseExplain2;
	  	        	}if(data[i].geneticDiseaseExplain3!=null&&data[i].geneticDiseaseExplain3!==""){
	  	        		
	  	        		geneticDiseaseExplain = data[i].geneticDiseaseExplain+', '+data[i].geneticDiseaseExplain2+',  '+data[i].geneticDiseaseExplain3;
	  	        	}
	  	            
	  	            
	  	            
	  	         
	  	        	   dt.fnAddData([ 
				  			           data[i].congenitalDisease,
				  			           congenitalDiseaseExplain,
				  			           data[i].geneticDisease,
				  			           geneticDiseaseExplain,
				  			           data[i].takeMedicine,
				  			           data[i].takeMedicineExplain,
				  			           data[i].intolerance,
				  			           data[i].intoleranceExplain,
				  			          '<button type="button" class="btn btn-warning btn-sm active" data-idupdate="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
				    				  '<button type="button" class="btn btn-danger btn-sm active" data-iddelete="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>'
				    					
				  			           ]);
	  	        	   
	  	        	 
		  		
		  	    	 }
	  	        	
	  	        		  	        
	  	     },  
	  	      error : function(data,testStatus,jqXHR) {  	  	      
	  	    	  $("#outputajax").text(testStatus); 
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
				  		  	    	 
				  		  	     },  
				  		  	     error : function(data,testStatus,jqXHR) {  	  	      
				  		  	    	
				  					  $("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
				
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
		<h2>Health</h2>
	</div>

    <div class="col-md-6">
       <div class="form-group" align="right">
        <br/>
    		<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#addModal">New Record</button>
      	<br/>
      </div>	
	</div>
</div>

<div class="row">
	<div id="message"></div>
	<div id="outputajax" class="form-group"></div>
</div>

 <table id="tableResult">
	    <thead>
            <tr> 
                <th>Congenital Disease</th>
                <th>Congenital Disease Specified</th>
                <th>Genetic Disease</th>
                <th>Genetic Disease Specified</th> 
                <th>Take Medicine</th>
                <th>Take Medicine Specified</th>
                <th>Intolerance</th>
                <th>Intolerance Specified</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
</table>




<!-- Modal Add and Update data-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Health</h4>
      </div>
      <div class="modal-body">
          
             
          
            <f:form id="formAddUpdate" name="healthForm" method="post" commandName="health" class="form-horizontal" role="form">	      	 
	  
	  
		    <div class="form-group form-group-sm">
		   
		           
		        <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="congenitalDisease" >
			            Do you have any congenital disease?
			    </label>	 		
			    
			     
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
			     
			        <label class="radio-inline" for=congenitalDisease > 
		 			     	<f:radiobutton id="congenitalDisease_no" name="congenitalDisease" path="congenitalDisease" value="No" checked="true"/>
		 			  		No
		 			 </label>
		 			 <label class="radio-inline" for="congenitalDisease"> 
		 			     <f:radiobutton id="congenitalDisease_yes" name="congenitalDisease" path="congenitalDisease" value="Yes"/>
				     		Yes
				     </label> 	     		
				     								
			     </div>	
		   
		   </div>
		   
		   
		   
		   
		   
		   <div class="form-group form-group-sm">
		   
			     <div class="row">
			           
			        <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="congenitalDisease" >
				            Specified Congenital Disease1: 
				    </label>	 		

     
				     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">	
				        	<f:input  id="congenitalDiseaseExplain" path="congenitalDiseaseExplain" cssClass="form-control required" placeholder="Specified Genetic Disease1" />					     								
				     </div>	
				  
			     
			    
			         <label class="col-lg-2 col-md-2 col-sm-3 col-xs-3 control-label required" for="congenitalDisease2" >
			           		Specified Congenital Disease2: 
			   		 </label>	 		
		     
				     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">	
				        	<f:input  id="congenitalDiseaseExplain2" path="congenitalDiseaseExplain2" cssClass="form-control required" placeholder="Specified Genetic Disease2" />					     								
				     </div>	
			 	 
			 	 
			 	 </div>
		   
		   </div>
		   
		   
		   
		   
		      <div class="form-group form-group-sm">
		   
			     <div class="row">
		   
			         <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="congenitalDisease3" >
			           		Specified Congenital Disease3: 
			   		 </label>	 		
		     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="congenitalDiseaseExplain3" path="congenitalDiseaseExplain3" cssClass="form-control required" placeholder="Specified Genetic Disease3" />					     								
				     </div>	
				 </div>
			</div>
			 	
			 	
		   
		   
		   
		   
		   
		   
		     <div class="form-group form-group-sm">
		   
		           
		        <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="geneticDisease" >
			           Do you have relative is genetic disease?
			    </label>	 		
			    
			     
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
			     
			        <label class="radio-inline" for=geneticDisease > 
		 			     	<f:radiobutton id="geneticDisease_no" name="geneticDisease" path="geneticDisease" value="No" checked="true"/>
		 			  		No
		 			 </label>
		 			 <label class="radio-inline" for="congenitalDisease"> 
		 			     <f:radiobutton id="geneticDisease_yes" name="geneticDisease" path="geneticDisease" value="Yes"/>
				     		Yes
				     </label> 	     		
				     								
			     </div>	
		   
		   </div>
		   
		   
		
		   
		   
		   
		   
		   <div class="form-group form-group-sm">
		   
			     <div class="row">
			           
			        <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="geneticDisease" >
				           Specified Genetic Disease1: 
				    </label>	 		

     
				     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">	
				        	<f:input  id="geneticDiseaseExplain" path="geneticDiseaseExplain" cssClass="form-control required" placeholder="Specified Genetic Disease1" />					     								
				     </div>	
				 
		           
			         <label class="col-lg-2 col-md-2 col-sm-3 col-xs-3 control-label required" for="congenitalDisease2" >
			           		Specified Genetic Disease2: 
			   		 </label>	 		
		     
				     <div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">	
				        	<f:input  id="geneticDiseaseExplain2" path="geneticDiseaseExplain2" cssClass="form-control required" placeholder="Specified Genetic Disease2" />					     								
				     </div>			 	 			 
			         
			 	 </div>
		   
		   </div>
		   
		   
		   
		   
		    <div class="form-group form-group-sm">
		   
			     <div class="row">
		   
				    <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="congenitalDisease3" >
					    Specified Genetic Disease3: 
				    </label>	 		
		     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="geneticDiseaseExplain3" path="geneticDiseaseExplain3" cssClass="form-control required" placeholder="Specified Genetic Disease3" />					     								
		 			</div>	
		 		</div>
		 	</div>
			 	 
		   
		   
		   
		   
		    <div class="form-group form-group-sm">
		   
		     
		           
			        <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="geneticDisease" >
				          Do you have to take medication regularly?			          
				    </label>	 		
				    
				     
				     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				     
				        <label class="radio-inline" for=takeMedicine > 
			 			     	<f:radiobutton id="takeMedicine_no" name="takeMedicine" path="takeMedicine" value="No" checked="true"/>
			 			  		No
			 			 </label>
			 			 <label class="radio-inline" for="congenitalDisease"> 
			 			     <f:radiobutton id="takeMedicine_yes" name="takeMedicine" path="takeMedicine" value="Yes"/>
					     		Yes
					     </label> 	     							     								
				     </div>	
				     
			    </div>
			    
			    
			  
			  
			    
			     <div class="form-group form-group-sm">
			           
			        <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="takeMedicineExplain" >
				           Specified Medicine: 
				    </label>	 		

     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="takeMedicineExplain" path="takeMedicineExplain" cssClass="form-control required" placeholder="Specified Medicine" />					     								
				     </div>	
				
			    </div>
			    
			    
			    
			    
			    
			    
			    
			     <div class="form-group form-group-sm">
		   
		     
		           
			        <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" for="intolerance" >
				          Have you got drug allergy?
				    </label>	 		
				    
				     
				     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				     
				        <label class="radio-inline" for=intolerance > 
			 			     	<f:radiobutton id="intolerance_no" name="intolerance" path="intolerance" value="No" checked="true"/>
			 			  		No
			 			 </label>
			 			 <label class="radio-inline" for="congenitalDisease"> 
			 			     <f:radiobutton id="intolerance_yes" name="intolerance" path="intolerance" value="Yes"/>
					     		Yes
					     </label> 	     							     								
				     </div>	
				     
			    </div>
			    
			    
			  
			  
			    
			     <div class="form-group form-group-sm">
			           
			        <label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label required" for="intoleranceExplain" >
				          Specified Intolerance: 
				    </label>	 		

     
				     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				        	<f:input  id="intoleranceExplain" path="intoleranceExplain" cssClass="form-control required" placeholder="Specified Intolerance" />					     								
				     </div>	
				
			    </div>
	

		
		  
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
		        <button id="saveBtn" name="saveBtn" type="button" class="btn btn-primary">add</button>
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
        <h4 class="modal-title" id="deleteModalLabel">Delete Health</h4>
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
 
 
