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
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet">


<!-- dataTable Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>

<title>Site</title>


<style type="text/css">

  #tableResult {
        width: 90%;
        /* margin-top: 35%; */
    }
  
#nav {
       margin-top: 3%;
    }
 
</style>




<script>

	var dt;  	
	
	$(function(){
	
	
		dt = $('#tableResult').dataTable();  
	/* 	
		$( "#dateFrom" ).datepicker({
			clearBtn : true,
			autoclose : true,
			forceParse : false,
			language : "en",
			format : "dd-mm-yyyy",
			todayHighlight : true
		});
		
		
		$( "#dateTo" ).datepicker({
			clearBtn : true,
			autoclose : true,
			forceParse : false,
			language : "en",
			format : "dd-mm-yyyy",
			todayHighlight : true
		}); */
		 $('#datetimepicker1').datetimepicker({
			 
			 viewMode: 'days',
			 format : 'DD-MM-YYYY',
			 defaultDate: moment(),
			 minDate: moment(),
			 
		 });

	});
</script>




</head>
<body>
	
	
<br/>
<br/>


<h2>Site</h2>
		
<br><br>
		
<div id="message"></div>
<div id="outputajax" class="form-group"></div>	



 <table id="tableResult" class="table table-striped table-bordered">
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
 
      
	   <tbody>
	   
	   </tbody>
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
          
             
          
            <f:form id="formAdd" name="siteForm" method="post" commandName="site" class="form-horizontal" role="form">	      	 
	      
	        
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
			    
                
			     <div  class="input-group date" id='datetimepicker1'>		     		
			     		<f:input id="dateFrom" path="startDate" cssClass="form-control"/>
			     		<span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
			     </div>
		   </div>
		   
		   
		   <div class="form-group form-group-sm">
			    
			     <label class="col-lg-4 col-md-4 col-sm-3 col-xs-3 control-label required" >
			            End Date:
			     </label>	 		
			    
			     
			     <div id="dateto" class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">		     		
			     		<%-- <f:input id="dateTo" path="endDate" cssClass="input-append date"/>  --%>
			     		<input id="dateTo" name="endDate" class="input-append date"/> 
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
 
   
</div>

</body>
</html>