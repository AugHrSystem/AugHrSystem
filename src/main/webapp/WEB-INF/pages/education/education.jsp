<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Education</title>

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
<link href="<c:url value="/resource/bootstrap/css/main.css" />" rel="stylesheet" media="all">

<!-- jQuery dataTable -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.min.js" />"></script>
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.min.css" />" rel="stylesheet" media="all">

<!-- dataTable Bootstrap -->
<link href="<c:url value="/resource/bootstrap/css/dataTables.bootstrap.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>

</head>
<body>
<div class="container">

<form:form id ="listForm" method="post" commandName="education">

<ol class="breadcrumb">
	<li role="presentation" class="active"><a href="#">Home</a></li>
	<li role="presentation"><a href="#addModal" data-toggle="modal">Add Education</a></li>
</ol>

<h2>Education</h2> 
 
<!-- Table -->
<div class="form-group">
<table id="tbResult" class="table">
	<thead>
		<tr>
			<th>University</th>
			<th>GPA</th>
			<th>Faculty</th>
			<th>Major</th>
			<th>Degree</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="education">

<!-- Button trigger modal -->
<div class="form-group" align="right">
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#addModal">Add Education</button> 
</div>

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Education Add</h4>
      </div>
      
      <div class="modal-body">
        
	  <div class="form-group">
	    <label>University :</label>
	    <form:input path="university" type="text" class="form-control" id="university" placeholder="Enter University"/>
	  </div>
	  
	  <div class="form-group">
	    <label>GPA :</label>
	    <form:input path="gpa" type="text" class="form-control" id="gpa" placeholder="Enter GPA"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Faculty :</label>
	    <form:input path="faculty" type="text" class="form-control" id="faculty" placeholder="Enter Faculty"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Major :</label>
	    <form:input path="major" type="text" class="form-control" id="major" placeholder="Enter Major"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Degree :</label>
	    
		  <form:select path="masdegreetype" class="form-control"
			id="masdegreetype">
			<form:option value="-1" label="---Select Degree---" />
			<c:forEach var="obj" items="${ masdegreetypeList }">
				<option value="${obj.id }">${ obj.name}</option>
			</c:forEach>
		</form:select>
	  </div>

      </div>
      
      <div class="form-group" align="center">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      	<button type="button" class="btn btn-info btnSave">Save</button>
      </div>
      
    </div>
  </div>
</div>

</form:form>

<form:form id="deleteForm" commandName="education" method="post">

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
						<h4 class="modal-title" id="myModalLabel">Delete Product</h4>
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
			var educationid = button.data("id") //Extract info from data-* attribute
			
			if(educationid != null){
				getId(educationid);
			} 
			
			$(this).find(".btnSave").off("click").on("click",function() {
				if(educationid != null){
					updateEducation(button, educationid);
				}else{
					addEducation();
					
				 }
				
			});
			
		});
		
		/* --- DeleteName --- */
		$("#deleteModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var educationid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".btnYes").off("click").on("click",function() {
				deleteEducation(button, educationid);
			});
			
		});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */

		function clearModal(){
			$("#university").val(""),
			$("#gpa").val(""),
			$("#faculty").val(""),
			$("#major").val(""),
			$("#masdegreetype").val("-1");
		}
		
		function addEducation(){
			$.ajax({
				url : "${pageContext.request.contextPath}/education/add",
				data : JSON.stringify({
					university : $("#university").val(),
					gpa :$("#gpa").val(),
					faculty :$("#faculty").val(),
					major :$("#major").val(),
					masdegreetype : {id:$("#masdegreetype").val(), name: $("#masdegreetype option:selected").text()},
				
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
						data.university,
						data.gpa,
						data.faculty,
						data.major,
						data.masdegreetype.name,
						
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
		
		function updateEducation(button, educationid){
			$.ajax({
				url : "${pageContext.request.contextPath}/education/update",
				data : JSON.stringify({
					id : educationid,
					university : $("#university").val(),
					gpa :$("#gpa").val(),
					faculty :$("#faculty").val(),
					major :$("#major").val(),
					masdegreetype : {id:$("#masdegreetype").val(), name: $("#masdegreetype option:selected").text()},
					
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
//	 					alert(JSON.stringify(data));
					
					var tr = button.closest("tr")
					
					dt.fnUpdate(data.university, tr ,0);
					dt.fnUpdate(data.gpa, tr ,1);
					dt.fnUpdate(data.faculty, tr ,2);
					dt.fnUpdate(data.major, tr ,3);
					dt.fnUpdate(data.masdegreetype.name, tr ,4);
					
					$('#addModal').modal('toggle');
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function getId(educationid){
			$.ajax({
				url : "${pageContext.request.contextPath}/education/findById",
				data : "educationid=" + educationid,
				type : "POST",
				success : function(data) {
	 				//alert(JSON.stringify(data));
					//alert("ok");
					$("#university").val(data.university),
					$("#gpa").val(data.gpa),
					$("#faculty").val(data.faculty),
					$("#major").val(data.major);
					$("#masdegreetype").val(data.masdegreetype.id);
			
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function deleteEducation(button, educationid){
			$.ajax({
				url : "${pageContext.request.contextPath}/education/delete",
				data : "educationid=" + educationid,
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
				url : "${pageContext.request.contextPath}/education/listAll",
				type : "POST",
				success : function(data) {
					dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([data[i].university,data[i].gpa,data[i].faculty, 
					              data[i].major,data[i].masdegreetype.name,
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

