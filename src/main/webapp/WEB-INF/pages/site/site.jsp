<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>


<style>
.required:after {
  margin-bottom: 0px;
  content:"*";
  color:red;
}
</style>

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
		                        message: '<spring:message code="site.required.projectname" />'
		                    }
		                }
		            },
		            projectOwner: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="site.required.projectOwner" />'
		                    }
		                }
		            },
		            projectOwnerContact: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="site.required.projectOwnerContact" />'
		                    },
		                }
		            },
		            startDate: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="site.required.startDate" />'
		                    },
		                    date: {
		                        format: 'DD-MM-YYYY'
		                    }
		                }
		            },
		            endDate: {
		                validators: {
		                    notEmpty: {
		                        message: '<spring:message code="site.required.endDate" />'
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

		//$('#startDate').mask("99-99-9999",{placeholder:"DD-MM-YYYY"});
		//$('#endDate').mask("99-99-9999",{placeholder:"DD-MM-YYYY"});
		
		
	
	  $('#startDate').datetimepicker({
			 
 						 //viewMode: 'days',
						 format : 'DD-MM-YYYY',
   				 	     defaultDate: 'moment',
		 				 //minDate: 'moment',
						 //showClear: true,
 						 //showClose:true,		
						
		});
	  
	  
	  
	  $('#startDate').data("DateTimePicker").date(moment());
	  $("input[name='startDate']").val($('#startDate').data("DateTimePicker").date().format('DD-MM-YYYY')); 
	  
	  
	  
	  
	  
			 
		var defaultDate = new Date();
		defaultDate.setDate(defaultDate.getDate()+1);
		
		
		$('#endDate').datetimepicker({			 
 			 //viewMode: 'days',
			 format : 'DD-MM-YYYY',	 
			 defaultDate: defaultDate,
 			 minDate: 'moment',
			 //ShowClear: true,
 			 //showClose:true					 
		
		});
		
		  $('#endDate').data("DateTimePicker").minDate(defaultDate);
		  $('#endDate').data("DateTimePicker").date(defaultDate);
		  $("input[name='endDate']").val($('#endDate').data("DateTimePicker").date().format('DD-MM-YYYY')); 
		  
		  

		
		
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
				  			          '<button type="button" style="margin-right :15px;" class="btn btn-warning btn-sm active" data-idupdate="' + data[i].id + '" data-target="#addModal" data-toggle="modal"><spring:message code="label.edit" /></button>'+
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
			   
			  	   

			   /*for set date*/
	
			   //$('#startDate').data("DateTimePicker").minDate(moment());
			   $('#startDate').data("DateTimePicker").date(moment());
			   $("input[name='startDate']").val($('#startDate').data("DateTimePicker").date().format('DD-MM-YYYY'));
			   //$("input[name='startDate']").val(moment().format("DD-MM-YYYY"));
			  
 		       var d = new Date($('#startDate').data("DateTimePicker").date());
			   d.setDate(d.getDate()+1);
			   //alert("d "+d);
			   //$('#endDate').data("DateTimePicker").minDate(d);
           	   //$('#endDate').data("DateTimePicker").date(d);
           	   
           	   
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
	  	    	
	  	    
	  	    	
	  	    	//$('#startDate').data("DateTimePicker").minDate(data.startDate).date(data.startDate);	  	    	
	  	    	$('#startDate').data("DateTimePicker").date(data.startDate);	  	    	
	  	    	
	  	    	var date = new Date();
	  	    	date.setDate($('#startDate').data("DateTimePicker").date());
	  	    	date.setDate(date.getDate()+1);
	  	    	$('#endDate').data("DateTimePicker").minDate(data.startDate+1);
	            $('#endDate').data("DateTimePicker").date(data.endDate); 
	   	    	
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
		<%-- <h2><spring:message code="site.name" /></h2> --%>
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
 <caption title=""><spring:message code="site.name" /></caption>
	    <thead>
            <tr> 
                <th><spring:message code="site.startDate" var="startDate"/>${startDate }</th>
                <th><spring:message code="site.endDate" var="endDate"/>${endDate }</th>
                <th><spring:message code="site.projectname" var="projectname"/>${projectname }</th>
                <th><spring:message code="site.projectOwner" var="projectOwner"/>${projectOwner }</th> 
                <th><spring:message code="site.projectOwnerContact" var="projectOwnerContact"/>${projectOwnerContact }</th>
                <th><spring:message code="label.action" /></th>
            </tr>
        </thead>
 
   </table>
  
   
   
   
<!-- Modal Add and Update data-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="site.name" /></h4>
      </div>
      <div class="modal-body">
          
             
          
            <f:form id="formAddUpdate" name="siteForm" method="post" commandName="site" class="form-horizontal" role="form">	      	 
	      
	   <spring:message code="default.date" var="date"/>
		   <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            ${startDate}:
			     </label>	 		
			    
                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		
				     <div  class="input-group date" id='startDate'>		     		
				     		<f:input name="startDate" path="startDate" cssClass="form-control" placeholder="${date}"/>
				     		<span class="input-group-addon">
	                        	<span class="glyphicon glyphicon-calendar"></span>
	                    	</span>
				     </div>
				</div>
		   </div>
		   
		   
		   <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            ${endDate}:
			     </label>	 		
			    
			     
			   
			    <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		
				     <div  class="input-group date" id='endDate'>		     		
				     		<f:input name="endDate" path="endDate" cssClass="form-control" placeholder="${date}"/>
				     		<span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
				     </div>
				</div>		   
		   </div>
		   
		   
		   
		     <div class="form-group form-group-sm">
			    
			        
			      <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            ${projectname}:
			      </label>	 		
			     
				     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input  id="projectName" path="projectName" cssClass="form-control required" placeholder="${projectname}" />			     		
			     </div>
		   </div>
		   
		   
		    <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            ${projectOwner}:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input id="projectOwner" path="projectOwner" cssClass="form-control required" placeholder="${projectOwner}"/>
			     </div>
		           
		   </div>
		   
		   
		   
		  <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            ${projectOwnerContact}:
			     </label>	 		
			    
			     
			     <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<f:input id="projectOwnerContact" path="projectOwnerContact" cssClass="form-control required" placeholder="${projectOwnerContact}"/>
			     </div>
		           
		   </div>
		   
		   
		  
		      <div class="form-group" align="center">
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
	        <h4 class="modal-title" id="deleteModalLabel"><spring:message code="site.name" /></h4>
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
	   
