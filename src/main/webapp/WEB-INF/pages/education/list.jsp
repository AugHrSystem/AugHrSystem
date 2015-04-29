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
<script src="../js/jquery-1.10.2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<!-- jQuery dataTable -->
<script src="../js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="../css/jquery.dataTables.css">
<link rel="stylesheet" href="../css/jquery.dataTables.min.css">

<!-- dataTable Bootstrap -->
<script src="../js/dataTables.bootstrap.js"></script>
<link rel="stylesheet" href="../css/dataTables.bootstrap.css">

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
			<th>Action</th>
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
	    
		<div class="form-group">
		  <form:select path="degreetype" class="form-control"
			id="degreetype">
			<form:option value="-1" label="---Select Category---" />
			<c:forEach var="obj" items="${ degreetypeList }">
				<option value="${obj.id }">${ obj.name}</option>
			</c:forEach>
		</form:select>
		</div>
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

</div>

<script type="text/javascript">

	var dt;
	
	$(document).ready(function(){
		dt = $('#tbResult').dataTable();
		
		/* --- addProduct,updateProduct --- */
		$("#addModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var id = button.data("id") //Extract info from data-* attribute
			
			if(id != null){
				getId(id);
			}
			
			$(this).find(".btnSave").off("click").on("click",function() {
				if(id != null){
					updateEducation(button, id);
				}else{
					addEducation();
				}
				
			});
			
		});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */

		function addEducation(){
			$.ajax({
				url : "${pageContext.request.contextPath}/product/add",
				data : JSON.stringify({
					name : $("#Name").val(),
					description :$("#Description").val(),
					productCategory : {id:$("#ProductCategory").val(), name: $("#ProductCategory option:selected").text()},
					unit : $("#Unit").val(),
					price :$("#Price").val(),
					
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
						data.name,
						data.description,
						data.productCategory.name,
						data.unit,
						data.price,
						
						'<button type="button" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > Edit</button>',
						'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> Delete</button>'
					]);
					
					$('#addModal').modal('toggle');
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

