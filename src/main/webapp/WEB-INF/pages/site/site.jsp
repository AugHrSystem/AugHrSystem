<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<!-- Bootstrap -->
<%-- <script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>


<link href="<c:url value="/resource/bootstrapvalidator/dist/css/bootstrapValidator.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrapvalidator/dist/js/bootstrapValidator.js" />"></script>



<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script> --%>

<jsp:include page="../employeeMenu.jsp"></jsp:include>
<input id="empId" type="hidden" value="${id}">

<script>

	var dt;  	

	
	$(function(){
		
		
		
		$("#saveBtn").on("click",function(){
			
			$('#formAddUpdate').bootstrapValidator('resetForm', true);

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
		        	
		        	projectName: {
		                validators: {
		                    notEmpty: {
		                        message: 'Project name is required and cannot be empty'
		                    }
		                }
		            },
		            projectOwner: {
		                validators: {
		                    notEmpty: {
		                        message: 'Project Owner is required and cannot be empty'
		                    }
		                }
		            },
		            projectOwnerContact: {
		                validators: {
		                    notEmpty: {
		                        message: 'Project Owner Contact is required and cannot be empty'
		                    },
		                }
		            },
		            startDate: {
		                validators: {
		                    notEmpty: {
		                        message: 'Start Date is required and cannot be empty'
		                    },
		                    date: {
		                        format: 'DD-MM-YYYY'
		                    }
		                }
		            },
		            endDate: {
		                validators: {
		                    notEmpty: {
		                        message: 'End date is required and cannot be empty'
		                    },
		                    date: {
		                        format: 'DD-MM-YYYY'
		                    }
		                }
		            },
		           
		        }
		 
    });
	
			
			$('#tableResult').dataTable({ 
				"bLengthChange": false,
				"iDisplayLength": 10,
				"pagingType": "simple_numbers",
				"ordering": false,
				"info": false
			});
		dt = $('#tableResult').dataTable();  
		
		doFindData();
		
		/* var defaultDate = new Date();
		var defaultDateOne = new Date();
		defaultDateOne.setDate(defaultDate.getDate()+1);
		
		
		$('#startDate').daterangepicker({
	        format: 'DD-MM-YYYY',
	        startDate: defaultDate,
	        endDate: defaultDateOne,
	        dateLimit: { days: 6 }
	    }); */
		
		
		
		//$('#startDate').daterangepicker({ startDate: '2014-03-05', endDate: '2014-03-06' });

		//$('#startDate').data('daterangepicker').setStartDate('2014-03-01');
		//$('#startDate').data('daterangepicker').setEndDate('2014-03-31');

		
	
	  $('#startDate').datetimepicker({
			 
						 viewMode: 'days',
						 format : 'DD-MM-YYYY',
						 defaultDate: 'moment',
						 minDate: 'moment',
						 //showClear: true,
						 showClose:true,
			
						
		});
			 
		var defaultDate = new Date($('#startDate').data("DateTimePicker").date());
		defaultDate.setDate(defaultDate.getDate()+1);
		
		
		$('#endDate').datetimepicker({			 
			 viewMode: 'days',
			 format : 'DD-MM-YYYY',	 
			 defaultDate: defaultDate,
			 minDate: defaultDate,
			 //ShowClear: true,
			 showClose:true					 
		
		});
	
		
		
 		$("#startDate").on("dp.change", function (e) {
 			
 			$('#formAddUpdate')
            // Get the bootstrapValidator instance
            .data('bootstrapValidator')
            // Mark the field as not validated, so it'll be re-validated when the user change date
            .updateStatus('startDate', 'NOT_VALIDATED', null)
            // Validate the field
            .validateField('startDate');
 			
 			
 			var tempdate = new Date(e.date);
 			tempdate.setDate(tempdate.getDate()+1);
 			//alert('temp: '+tempdate);
            $('#endDate').data("DateTimePicker").minDate(tempdate);
            
            
        }); 
 		
 		
 		
		$("#endDate").on("dp.change", function (e) {
 			
 			$('#formAddUpdate')
            // Get the bootstrapValidator instance
            .data('bootstrapValidator')
            // Mark the field as not validated, so it'll be re-validated when the user change date
            .updateStatus('endDate', 'NOT_VALIDATED', null)
            // Validate the field
            .validateField('endDate');
 			
        }); 
 		 
 		 
 		 
 		 
 		function doFindData() {  
		   	   
//    	     var id = getUrlParameter('Id');
   	     
   	     	var id = $("#empId").val();
	  	     $.ajax({  
	  	      type : "POST",   
	  	      url : "<%=request.getContextPath()%>/site/list/"+id,   
	  	      dataType : 'json', 
	  	      contentType :"application/json; charset=utf-8",
	  	     
	  	      success : function(data) {  
	    		
	  	    
	  	        dt.fnClearTable();
	  	    	
	  	        for(var i=0;i<data.length;i++){
	  	        	
		  			 	
		  			        
	  	        	   dt.fnAddData([ 
				  			           
				  			           data[i].startDate,
				  			           data[i].endDate,
				  			           data[i].projectName,
				  			           data[i].projectOwner,
				  			           data[i].projectOwnerContact,
				  			          '<button type="button" class="btn btn-warning btn-sm active" data-idupdate="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>'+
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
	    				$('#formAddUpdate').bootstrapValidator();
	    				$('#formAddUpdate').data('bootstrapValidator').validate();
	    				if($('#formAddUpdate').data('bootstrapValidator').isValid()){
	    				 doEdit(idUpdate);
	    				}
	    			}
	    			else {
	    				$('#formAddUpdate').bootstrapValidator();
	    				$('#formAddUpdate').data('bootstrapValidator').validate();
	    				if($('#formAddUpdate').data('bootstrapValidator').isValid()){
	    				 addSite();
	    				}
	    			}
	    		});
	    	  
	      });
 		 
 		 
 		 
 		$('#addModal').on("hide.bs.modal",function(event){
 			
			   //$('#formAddUpdate').bootstrapValidator('resetForm', true);
			   $('#formAddUpdate').bootstrapValidator();
			   $('#formAddUpdate').data('bootstrapValidator').resetForm();
			   $('#formAddUpdate')[0].reset();
			   $("input[name='startDate']").val('');
			   $("input[name='endDate']").val('');
			   
			  	   
			   //alert(moment().format("DD-MM-YYYY"));
			   
			   $('#startDate').data("DateTimePicker").minDate(moment());
			   $('#startDate').data("DateTimePicker").date(moment());
			   $("input[name='startDate']").val($('#startDate').data("DateTimePicker").date().format('DD-MM-YYYY'));
			   //$("input[name='startDate']").val(moment().format("DD-MM-YYYY"));
			  
 		       var d = new Date();
			   d.setDate(d.getDate()+1);
			   //alert("d "+d);
			   $('#endDate').data("DateTimePicker").minDate(d);
           	   $('#endDate').data("DateTimePicker").date(d);
           	   $("input[name='endDate']").val($('#endDate').data("DateTimePicker").date().format('DD-MM-YYYY'));

			   		  
	    });
 		 
 		 
 		 
 		function addSite() {  
		   	   
    	    
//     	    var id = getUrlParameter('Id');
    	    var id = $("#empId").val();
    	    
	  		
	  	    
	  	    $.ajax({  
	  	      type : "POST",   
	  	      url : "<%=request.getContextPath()%>/site/add",   
	  	      dataType : 'json', 
	  	      data : JSON.stringify(
	  	    		{"projectName":$('#projectName').val(),
	    			"startDate" : $("input[name='startDate']").val(),
  	    			"endDate": $("input[name='endDate']").val(),
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
	  	    	   //$('#formAddUpdate').bootstrapValidator('validate');
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
	  	    	$("input[name='startDate']").val(data.startDate);
	  	    	$("input[name='endDate']").val(data.endDate);
	  	    	$('#projectOwner').val(data.projectOwner);
	  	    	$('#projectOwnerContact').val(data.projectOwnerContact);
	  	    	
	  	    
	  	    	
	  	    	$('#startDate').data("DateTimePicker").minDate(data.startDate).date(data.startDate);	  	    	
	  	    	//$('#startDate').data("DateTimePicker").date(data.startDate);	  	    	
	  	    	//$('#endDate').data("DateTimePicker").minDate($('#startDate').data("DateTimePicker"));
	            $('#endDate').data("DateTimePicker").date(data.endDate);
	  	    	
	  	    	
	  	    
	  	    	 
	  	    	
	  	     },  
	  	      error : function(data,testStatus,jqXHR) {  
	  	    	  
	  	    	$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
	  	     }  
	  	    }); 
	  	   
	    }
 		
 		
 		
 		 
 		
 		 
 		  function doEdit(idUpdate) {  
 			  
//  			   var id = getUrlParameter('Id');
 			  var id = $("#empId").val();
	    	 
		  	    $.ajax({  
		  	      type : "POST",   
		  	      url : "<%=request.getContextPath()%>/site/edit",   
		  	      dataType : 'json', 
		  	      data : JSON.stringify({
		  	    	  			"id":idUpdate,
	  	    		  			"projectName":$('#projectName').val(),
	  	    		    		"startDate":$("input[name='startDate']").val(),
	  	    		   	 		"endDate":$("input[name='endDate']").val(),
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
		  	        //$('#formAddUpdate').bootstrapValidator('validate');
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




<div class="row">
	<div class="col-md-6">
		<h2>Client Sites</h2>
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
                <th>Start Date</th>
                <th>End Date</th>
                <th>Project</th>
                <th>Project Owner</th> 
                <th>Project Owner Contract</th>
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
        <h4 class="modal-title" id="myModalLabel">Client Sites</h4>
      </div>
      <div class="modal-body">
          
             
          
            <f:form id="formAddUpdate" name="siteForm" method="post" commandName="site" class="form-horizontal" role="form">	      	 
	      
	   
		   <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            Start Date:
			     </label>	 		
			    
                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		
				     <div  class="input-group date" id='startDate'>		     		
				     		<f:input name="startDate" path="startDate" cssClass="form-control"/>
				     		<span class="input-group-addon">
	                        	<span class="glyphicon glyphicon-calendar"></span>
	                    	</span>
				     </div>
				</div>
		   </div>
		   
		   
		   <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            End Date:
			     </label>	 		
			    
			     
			   
			    <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		
				     <div  class="input-group date" id='endDate'>		     		
				     		<f:input name="endDate" path="endDate" cssClass="form-control"/>
				     		<span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
				     </div>
				</div>		   
		   </div>
		   
		   
		   
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
			            Project Owner:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input id="projectOwner" path="projectOwner" cssClass="form-control required" placeholder="Project Owner"/>
			     </div>
		           
		   </div>
		   
		   
		   
		  <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            Project Owner Contact:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input id="projectOwnerContact" path="projectOwnerContact" cssClass="form-control required" placeholder="Project Owner Contact"/>
			     </div>
		           
		   </div>
		   
		   
		  
		      <div class="form-group" align="center">
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
	        <h4 class="modal-title" id="deleteModalLabel">Delete Client Sites</h4>
	      </div>
	      <div class="modal-body">
	      	Do you want to delete Client Sites?
	      </div>
	      <div class="modal-footer">
			<button id="delete" type="button" class="btn btn-danger yesButton" >Yes</button>
	      	<button type="button" class="btn btn-info" data-dismiss="modal">No</button>
	      </div>
	    </div>
	  </div>
	</div>
	   
