<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave</title>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- jQuery -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>

<!-- Bootstrap -->
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>

<!-- Date Picker -->
<script src="<c:url value="/resource/datepicker/js/bootstrap-datepicker.js" />"></script>
<link href="<c:url value="/resource/datepicker/css/datepicker.css" />" rel="stylesheet" media="all">

<!-- jQuery dataTable -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet" media="all">

<!-- dataTable Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>


<style>
.datepicker{z-index:1151 !important;}

</style>
</head>
<body>
<div class="container">



<form:form id ="listForm" method="post" commandName="leave">

<h2>Leave</h2> 

<br></br>

<!-- Table -->
<div class="form-group">
<table id="tbResult" class="table">
	<thead>
		<tr>
			<th>Leave type</th>
			<th>Date</th>
			<th>Time</th>
			<!-- <th>AIM</th> -->
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="leave" >
<!-- Button trigger modal -->
	<div align="right">
		<button id="clearModal" type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#addModal">
 	 	Add
		</button>
	</div>
	
	
	<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Leave</h4>
      </div>
      <div class="modal-body">
       
     
  				
  				
  				
  				
  		<div class="form-group">
	    <label>Leave type:</label>
	    
		<div class="form-group">
		  <form:select path="masleavetype" class="form-control" id="masleavetype">
			<form:option value="-1" label="---Select Leavetype---" />
			<c:forEach var="obj" items="${masleavetypeList}">
				<option value="${obj.id}">${ obj.name}</option>
			</c:forEach>
		</form:select>
		</div>
	  </div>
  				
  				
  				
  		<div class="form-group">
  			<p><label>Date : <input type="text" id="dateOfLeave" path="dateOfLeave"></label></p>
  		</div>
  		  		
  		
  		
  		<div class="form-group">
  			<label>Time :</label>
  			<input type="text" class="form-control" id="timeOfLeave" placeholder="Enter timeOfLeave">
  		</div>
	  
  	
  	
  	
  	<%-- <div class="form-group">
	    <label>AIM:</label>
	    
		 <div class="form-group">
		  <form:select path="Aim:" class="form-control"
			id="Aim">
			<form:option value="-1" label="---Select AIM---" />
			<c:forEach var="obj" items="${ masleavetypeList }">
				<option value="${obj.id }">${ obj.name}</option>
			</c:forEach>
		</form:select>
		</div>
	  </div>
  	 --%>
        
		<!-- <div class="form-group">
  			<label>Employee ID :</label>
  			<input type="text" class="form-control" id="employeeId" placeholder="Enter Employee Id">
  		</div> -->
      </div>
      <div class="form-group" align="center">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-info saveButton">Save</button>
      </div>
    </div>
  </div>
</div>
</form:form>

<form:form id="deleteForm" commandName="leave" method="post">

<!-- Modal Delete -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title" id="deleteModalLabel">Delete Leave</h4>
      </div>
      <div class="modal-body">
      	Do you want to delete leave ?
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-danger yesButton" >Yes</button>
      	<button type="button" class="btn btn-info" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>
</form:form>
</div>

<script>

var dt;
$(document).ready(function() {
	$( "#dateOfLeave" ).datepicker({
		clearBtn : true,
		autoclose : true,
		forceParse : false,
		language : "en",
		format : "dd-mm-yyyy",
		todayHighlight : true
	});
	
	dt=$("#tbResult").dataTable();
		listAll();

		
		
		$("#addModal").on("show.bs.modal",function(event) {
			
// 			clearModal();
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var leaveid = button.data("id") //Extract info from data-* attribute
			 
			if(leaveid != null){
				getId(leaveid);
			}  
			
			$(this).find(".saveButton").off("click").on("click",function() {
				 if(leaveid != null){
					/*  alert("be up"); */
					updateLeave(button,leaveid);
					
				}else{ 
					addLeave();
					
				  } 
				
			});
			
		});
		
		
		/* --- DeleteName --- */
		$("#deleteModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var leaveid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".yesButton").off("click").on("click",function() {
				deleteLeave(button,leaveid);
			});
			
		});
		
		
		
		function addLeave(){
			var id = getUrlParameter('Id');
			$.ajax({
				url : "${pageContext.request.contextPath}/leave/add",
				data : JSON.stringify({
					
					
					masleavetypeId:$("#masleavetype").val(),
					masleavetype:$("#masleavetype option:selected").text(),
					dateOfLeave:$("#dateOfLeave").val(),
					timeOfLeave:$("#timeOfLeave").val(),
					employeeId :id 
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
					
				//alert(JSON.stringify(data));
						
				
					 dt.fnClearTable();
					
					dt.fnAddData([
					
					              
						data.masleavetype,
						data.dateOfLeave,
						data.timeOfLeave,
					
						
						'<button type="button" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > Edit</button>',
						'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> Delete</button>'
					]);
					
					$('#addModal').modal('toggle');
					listAll();
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function getId(leaveid){
			
			
			$.ajax({
				
				url : "${pageContext.request.contextPath}/leave/findById/"+ leaveid,
				//data : "id=" + abilityid,
				type : "POST",
				success : function(data) {
					//alert(JSON.stringify(data));
					
					$("#masleavetype").val(data.masleavetypeId);
					$("#dateOfLeave").val(data.dateOfLeave);
					$("#timeOfLeave").val(data.timeOfLeave);
					employeeId: data.employeeId;
				},
				error : function(data, textStatus, jqXML) {
					{
						alert("error");
					}
					;
				}
			});
		}
		
		
		
		function updateLeave(button,leaveid) {
			/* alert("fn up"); */
				var id = getUrlParameter('Id');
				$.ajax({
					url : "${pageContext.request.contextPath}/leave/update",
					data : JSON.stringify({
						id:leaveid,
						masleavetypeId : $("#masleavetype").val(),
						masleavetype : $("#masleavetype option:selected").text(),
						dateOfLeave:$("#dateOfLeave").val(),
						timeOfLeave:$("#timeOfLeave").val(),
						employeeId: id
					}),
					type : "POST",
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						//alert(abilityid);
						//alert(JSON.stringify(data));
						
						var tr = button.closest("tr");
						
						dt.fnUpdate(data.masleavetype.name, tr, 0);
						dt.fnUpdate(data.dateOfLeave, tr, 1 );
						dt.fnUpdate(data.timeOfLeave, tr, 2 );
						
						
						$('#addModal').modal('toggle');
						listAll();
					},
					error : function() {
						alert("ERROR");
					}
				});
			}
		
		
		
		
		
		
		function deleteLeave(button,leaveid) {
			
			$.ajax({
				url : "${pageContext.request.contextPath}/leave/delete/"+leaveid,
				
				type : "POST",
				success : function(data) {
					
					
					$('#deleteModal').modal('toggle');
					
					listAll();
				},
				error : function() {
					alert("ERROR");
				}
			
				});
		}
		
		
		function listAll(){
			//var id=2;
			var id = getUrlParameter('Id');
			//alert("id >>>>"+id);	
			$.ajax({
					url : "${pageContext.request.contextPath}/leave/listAll/"+id,
					type : "POST",
					success : function(data) {
						dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([data[i].masleavetype,
						              data[i].dateOfLeave,
						              data[i].timeOfLeave,
							'<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
							'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
				
						}
					},
					error : function() {
						alert("ERROR");
					}
				}); 
			}
		
		
		
		
		 function getUrlParameter(sParam)
		 {
		 	//alert("url "+document.referrer);
		     var sPageURL = document.referrer;
		     var sURLVariables = sPageURL.split('?');
		     var sParameterName;
		     //alert("spilt "+sURLVariables);
		    	
		     
		     sParameterName = sURLVariables[1].split('=');
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


</body>
</html>