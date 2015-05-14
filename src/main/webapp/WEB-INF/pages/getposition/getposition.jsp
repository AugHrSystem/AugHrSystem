<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GetPosition</title>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- jQuery -->
<script src="/resource/bootstrap/js/jquery-1.11.2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>

<!-- jQuery dataTable -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.min.css" />" rel="stylesheet" media="all">

<!-- dataTable Bootstrap -->
<link href="<c:url value="/resource/bootstrap/css/dataTables.bootstrap.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>

</head>
<body>
<div class="container">

<form:form id ="listForm" method="post" commandName="getposition">

<!-- <ol class="breadcrumb">
	<li role="presentation" class="active"><a href="#">Home</a></li>
	<li role="presentation"><a href="#addModal" data-toggle="modal">Add Education</a></li>
</ol>
 -->
<h2>GetPosition</h2> 
 
<!-- Table -->
<div class="form-group">
<table id="tbResult" class="table">
	<thead>
		<tr>
			<th>Position</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="getposition">

<!-- Button trigger modal -->
<div class="form-group" align="right">
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#addModal">Add</button> 
</div>

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Position Add</h4>
      </div>
      
      <div class="modal-body">
        
	  <div class="form-group">
	    <label>Position :</label>
	    <form:input path="position" type="text" class="form-control" id="position" placeholder="Enter Position"/>
	  </div>
	  
	  <%-- <div class="form-group">
	    <label>Company :</label>
	    <form:input path="company" type="text" class="form-control" id="company" placeholder="Enter Company"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Salary :</label>
	    <form:input path="salary" type="text" class="form-control" id="salary" placeholder="Enter Salary"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Time :</label>
	    <form:input path="time" type="text" class="form-control" id="time" placeholder="Enter Time"/>
	  </div> --%>
	  
	 <%--  <div class="form-group">
	    <label>Degree :</label>
	    
		  <form:select path="masdegreetype" class="form-control"
			id="masdegreetype">
			<form:option value="-1" label="---Select Degree---" />
			<c:forEach var="obj" items="${ masdegreetypeList }">
				<option value="${obj.id }">${ obj.name}</option>
			</c:forEach>
		</form:select>
	  </div> --%>

      </div>
      
      <div class="form-group" align="center">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      	<button type="button" class="btn btn-info btnSave">Save</button>
      </div>
      
    </div>
  </div>
</div>

</form:form>

<form:form id="deleteForm" commandName="getposition" method="post">

		<!-- Modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Delete</h4>
					</div>
					<div class="modal-body">
						<h4>Are you sure?</h4>
						<form:hidden path="id"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger btnYes">Yes</button>
						<button type="button" class="btn btn-info" data-dismiss="modal">No</button>
					</div>
				</div>
			</div>
		</div>

</form:form>

</div>

<script type="text/javascript">

	var dt;
	
	$(document).ready(function(){
		dt = $('#tbResult').dataTable();
		listAll();
		
		/* --- addProduct,updateProduct --- */
		$("#addModal").on("show.bs.modal",function(event) {
			
			clearModal();
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var getpositionid = button.data("id") //Extract info from data-* attribute
			
			if(getpositionid != null){
				getId(getpositionid);
			} 
			
			$(this).find(".btnSave").off("click").on("click",function() {
				if(getpositionid != null){
					updateGetPosition(button, getpositionid);
				}else{
					addGetPosition();
					
				 }
				
			});
			
		});
		
		/* --- DeleteName --- */
		$("#deleteModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var getpositionid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".btnYes").off("click").on("click",function() {
				deleteGetPosition(button, getpositionid);
			});
			
		});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */

		function clearModal(){
			$("#position").val("");
			/* $("#company").val(""),
			$("#salary").val(""),
			$("#time").val(""); */
			/* $("#masdegreetype").val("-1"); */
		}
		
		function addGetPosition(){
			$.ajax({
				url : "${pageContext.request.contextPath}/getposition/add",
				data : JSON.stringify({
					position : $("#position").val(),
					/* company :$("#company").val(),
					salary :$("#salary").val(),
					time :$("#time").val(), */
				
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
					
//	 				alert(JSON.stringify(data));
						
					dt.fnClearTable();
					
					dt.fnAddData([
						/* $("#Name").val(),
						$("#ProductCategory").val(),
						$("#Unit").val(),
						$("#Price").val(),
						$("#Description").val(), */
						data.position,
						/* data.company,
						data.salary,
						data.time, */
						
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
		
		function updateGetPosition(button, getpositionid){
			$.ajax({
				url : "${pageContext.request.contextPath}/getposition/update",
				data : JSON.stringify({
					position : $("#position").val(),
					/* company :$("#company").val(),
					salary :$("#salary").val(),
					time :$("#time").val(), */
					
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
//	 					alert(JSON.stringify(data));
					
					var tr = button.closest("tr")
					
					dt.fnUpdate(data.position);
					/* dt.fnUpdate(data.company, tr ,1);
					dt.fnUpdate(data.salary, tr ,2);
					dt.fnUpdate(data.time, tr ,3); */
					
					$('#addModal').modal('toggle');
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function getId(getpositionid){
			$.ajax({
				url : "${pageContext.request.contextPath}/getposition/findById",
				data : "getpositionid=" + getpositionid,
				type : "POST",
				success : function(data) {
	 				//alert(JSON.stringify(data));
					//alert("ok");
					$("#position").val(data.position);
					/* $("#company").val(data.company),
					$("#salary").val(data.salary),
					$("#time").val(data.time); */
			
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function deleteGetPosition(button, getpositionid){
			$.ajax({
				url : "${pageContext.request.contextPath}/getposition/delete",
				data : "getpositionid=" + getpositionid,
				type : "POST",
				success : function(data) {
//	 					alert(JSON.stringify(data));
					
					var tr = button.closest("tr")
					
					dt.fnDeleteRow(tr);
					
					$('#deleteModal').modal('toggle');
					
				},
				
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function listAll(){
			$.ajax({
				url : "${pageContext.request.contextPath}/getposition/listAll",
				type : "POST",
				success : function(data) {
					dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([data[i].position,
					              /* data[i].company,data[i].salary, 
					              data[i].time, */
						'<button type="button" class="btn btn-info btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
						'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
			
					}
				},
				error : function() {
					alert("ERROR");
				}
			}); 
		}
		
	});
	
</script>

</body>
</html>

