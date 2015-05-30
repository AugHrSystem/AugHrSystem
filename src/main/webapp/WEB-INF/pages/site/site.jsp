<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>

<!-- Date Picker -->
<script src="<c:url value="/resource/moment/js/moment.js" />"></script>
<script src="<c:url value="/resource/datetimepicker/js/bootstrap-datetimepicker.js" />"></script>
<link href="<c:url value="/resource/datetimepicker/css/bootstrap-datetimepicker.min.css" />" rel="stylesheet" media="all">


<!-- Data Table -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.js" />"></script>
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>
<link href="<c:url value="/resources/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/resource/bootstrap/css/dataTables.bootstrap.css" />" rel="stylesheet" media="all">






<title>Site</title>






<script>

	var dt;  	
	
	$(function(){
	
	
		dt = $('#tableResult').dataTable({
 			 "columnDefs": [
 			                { "width": "16%", "targets": 0 },
 			                { "width": "16%", "targets": 1 },
 			                { "width": "16%", "targets": 2 },
 			                { "width": "16%", "targets": 3 },
 			                { "width": "16%", "targets": 4 },
 			               	{ "width": "10%", "targets": 5 },
 			               	{ "width": "10%", "targets": 6 }
 			              ]
		});  
		
		doFindData();
		
	
		$('#datetimepicker1').datetimepicker({
			 
						 viewMode: 'days',
						 format : 'DD-MM-YYYY',
						 defaultDate: 'moment',
						 minDate: 'moment',
						 //showClear: true,
						 showClose:true,
			
						
		});
			 
		var defaultDate = new Date($('#datetimepicker1').data("DateTimePicker").date());
		defaultDate.setDate(defaultDate.getDate()+1);
		
		
		$('#datetimepicker2').datetimepicker({			 
			 viewMode: 'days',
			 format : 'DD-MM-YYYY',	 
			 defaultDate: defaultDate,
			 minDate: defaultDate,
			 //ShowClear: true,
			 showClose:true					 
		
		});
	
		
		
 		
 		$("#datetimepicker1").on("dp.change", function (e) {
 			var tempdate = new Date(e.date);
 			tempdate.setDate(tempdate.getDate()+1);
 			//alert(tempdate);
            $('#datetimepicker2').data("DateTimePicker").minDate(tempdate);
        });
 		 
 		 
 		 
 		 
 		function doFindData() {  
		   	   
   	     var id = getUrlParameter('Id');
   	     
   	     
	  	     $.ajax({  
	  	      type : "POST",   
	  	      url : "<%=request.getContextPath()%>/site/list/"+id,   
	  	      dataType : 'json', 
	  	      contentType :"application/json; charset=utf-8",
	  	     
	  	      success : function(data) {  
	    		
	  	    
	  	        dt.fnClearTable();
	  	    	
	  	        for(var i=0;i<data.length;i++){
	  	        	
		  			 	
		  			        
	  	        	   dt.fnAddData([ 
				  			           data[i].projectName,
				  			           data[i].startDate,
				  			           data[i].endDate,
				  			           data[i].projectOwner,
				  			           data[i].projectOwnerContact,
				  			          '<button type="button" class="btn btn-info btn-sm active" data-idupdate="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
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
 			 
 			 
	    	    //clearModal();
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
	    				 addSite();
	    			}
	    		});
	    	  
	      });
 		 
 		 
 		 
 		$('#addModal').on("hidden.bs.modal",function(event){
			   
 			 var d = new Date();
 		     d.setDate(d.getDate()+1);
 			 
 			 $('#datetimepicker1').data("DateTimePicker").date(new Date());
 			 $('#datetimepicker2').data("DateTimePicker").date(d);
 		
			   		  
	    });
 		 
 		 
 		 
 		function addSite() {  
		   	   
    	    
    	    var id = getUrlParameter('Id');
    	    
	  		
	  	    
	  	    $.ajax({  
	  	      type : "POST",   
	  	      url : "<%=request.getContextPath()%>/site/add",   
	  	      dataType : 'json', 
	  	      data : JSON.stringify(
	  	    		{"projectName":$('#projectName').val(),
	    			"startDate" : $('#startDate').val(),
  	    			"endDate": $('#endDate').val(),
  	    			"projectOwner":$('#projectOwner').val(),
  	    			"projectOwnerContact":$('#projectOwnerContact').val(),
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
 		 
 		
 		
 		
 		
 		
 		function doInitEdit(idUpdate) {  
		   	
 			
	  	     $.ajax({  
	  	      type : "POST",   
	  	      url : "<%=request.getContextPath()%>/site/initedit",   
	  	      dataType : 'json', 
	  	      data : JSON.stringify({"id":idUpdate}),  
	  	      contentType :"application/json; charset=utf-8",
	  	     
	  	      success : function(data) {  
	    		
	  	    	//alert(JSON.stringify(data));
	  	    	
	  	    	$('#projectName').val(data.projectName);
	  	    	$('#startDate').val(data.startDate);
	  	    	$('#endDate').val(data.endDate);
	  	    	$('#projectOwner').val(data.projectOwner);
	  	    	$('#projectOwnerContact').val(data.projectOwnerContact);
	  	    	
	  	    	
	  	    	//$('#datetimepicker1').datetimepicker('minDate',date.startDate);
	  	    	
	  	    	$('#datetimepicker1').data("DateTimePicker").minDate(data.startDate);
	  	    	
	  	    	//$('#datetimepicker1').data("DateTimePicker").date('moment');
	  	    	
	  	    	$('#datetimepicker2').data("DateTimePicker").minDate($('#datetimepicker1').data("DateTimePicker").date());
	  	    	
	  	    	
	  	    
	  	    	 
	  	    	
	  	     },  
	  	      error : function(data,testStatus,jqXHR) {  
	  	    	  
	  	    	$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
	  	     }  
	  	    }); 
	  	   
	    }
 		
 		
 		
 		 
 		
 		 
 		  function doEdit(idUpdate) {  
 			  
 			   var id = getUrlParameter('Id');
	    	 
		  	    $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/site/edit",   
		  	      dataType : 'json', 
		  	      data : JSON.stringify({
		  	    	  			"id":idUpdate,
	  	    		  			"projectName":$('#projectName').val(),
	  	    		    		"startDate":$('#startDate').val(),
	  	    		   	 		"endDate":$('#endDate').val(),
	  	    		    		"projectOwner":$('#projectOwner').val(),
	  	    		    		"projectOwnerContact":$('#projectOwnerContact').val(),
	  	    		    		"employeeId":id
	  	    		    		}),  
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
 				
     		
     		$(this).find("#delete").off("click").on("click", function(){
     			
     			
	     			$.ajax({  
	  		  	      type : "POST",   
	  		  	      url : "<%=request.getContextPath()%>/site/delete",   
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




</head>
<body>

<div class="container">

<h2>Site</h2>
		
<br><br>
		
<div id="message"></div>
<div id="outputajax" class="form-group"></div>	




 <table id="tableResult" class="display"> 
	    <thead>
            <tr> 
                <th>Project Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Project Owner</th> 
                <th>Project Owner Contract</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
 
   </table>
   
   <div align="right">    
		<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#addModal">Add</button> 
   </div>

   <br/>
   <br/>
   
   
   
   
<!-- Modal Add and Update data-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Site</h4>
      </div>
      <div class="modal-body">
          
             
          
            <f:form id="formAddUpdate" name="siteForm" method="post" commandName="site" class="form-horizontal" role="form">	      	 
	      
	        
	        <br/>
	        <br/>
	       
		    <div class="form-group form-group-sm">
			    
			        
			      <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            Project Name:
			      </label>	 		
			     
				     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input  id="projectName" path="projectName" cssClass="form-control required" placeholder="Project Name" />			     		
			     </div>
		   </div>
		   
		   
		   <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            Start Date:
			     </label>	 		
			    
                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		
				     <div  class="input-group date" id='datetimepicker1'>		     		
				     		<f:input id="startDate" path="startDate" cssClass="form-control"/>
				     		<span class="input-group-addon">
	                        	<span class="glyphicon glyphicon-calendar"></span>
	                    	</span>
	                    	<span class="input-group-addon">
	                         	<span class="glyphicon glyphicon-remove"></span>
	                    	</span>
				     </div>
				</div>
		   </div>
		   
		   
		   <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            End Date:
			     </label>	 		
			    
			     
			   
			    <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		
				     <div  class="input-group date" id='datetimepicker2'>		     		
				     		<f:input id="endDate" path="endDate" cssClass="form-control"/>
				     		<span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-remove"></span>
	                    </span>
				     </div>
				</div>		   
		   </div>
		   
		   
		   
		    <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            Project Owner:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input id="projectOwner" path="projectOwner" cssClass="form-control required"/>
			     </div>
		           
		   </div>
		   
		   
		   
		  <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            Project Owner Contact:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input id="projectOwnerContact" path="projectOwnerContact" cssClass="form-control required"/>
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
	        <h4 class="modal-title" id="deleteModalLabel">Delete Site</h4>
	      </div>
	      <div class="modal-body">
	      	Do you want to delete Site ?
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