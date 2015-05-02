<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ability</title>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- jQuery -->
<script src="../js/jquery-1.10.2.min.js"></script>
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
<form:form id ="listForm" method="POST" commandName="ability">

<ol class="breadcrumb">
	<li role="presentation" class="active"><a href="#">Home</a></li>
	<li role="presentation"><a href="#addModal" data-toggle="modal">Add Ability</a></li>
</ol>

<h2>Ability</h2> 
 
<!-- Table -->
<div class="form-group">
<table id="tbResult" class="table">
	<thead>
		<tr>
			<!-- <th>#</th> -->
			<th>Specialty</th>
			<th>Rank</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="POST" commandName="ability" >

<!-- Button trigger modal -->
<div class="form-group" align="right">
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#addModal">Add Ability</button> 
</div>

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Ability Add</h4>
      </div>
      
      <div class="modal-body">
        
	  
	 
	  
	  <div class="form-group">
	    <label>Specialty :</label>
	    
		<div class="form-group">
		  <form:select path="" class="form-control"
			id="masspecialty">
			<form:option value="-1" label="---Select Specialty---" />
			<c:forEach var="obj" items="${ masspecialtyList }">
				<option value="${obj.id }">${ obj.name}</option>
			</c:forEach>
		</form:select>
		</div>
	  </div>
	  
	   <div class="form-group">
	    <label>Rank :</label>
	    <form:input path="rank" type="text" class="form-control" id="rank" placeholder="Enter Rank"/>
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
		
		clearModal();
		
		var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
		var abilityid = button.data("id") //Extract info from data-* attribute
		/* 
		if(abilityid != null){
			getId(abilityid);
		}  */
		
		$(this).find(".btnSave").off("click").on("click",function() {
			/* if(abilityid != null){
				updateAbility(button, abilityid);
			}else{ */
				
				//alert("be");
				addAbility();
				//alert("af");
			 /* } */
			
		});
		
	});
	
	
	
	
	/* ---------------------------------------------------------------------------------------------------------------------------------------------- */

	function clearModal(){
		
		$("#masspecialty").val("-1"),
		$("#rank").val("");
	}
	
	function addAbility(){
		$.ajax({
			url : "${pageContext.request.contextPath}/ability/add",
			data : JSON.stringify({
				masdegreetype : {id:$("#masspecialty").val(), name:$("#masspecialty option:selected").text()},
				rank : $("#rank").val(),
				employee : {id:2},
			}),
			type : "POST",
			contentType : "application/json",
			dataType: "json",
			success : function(data) {
				
			alert(JSON.stringify(data));
					
			
				 dt.fnClearTable();
				
				dt.fnAddData([
				
					data.masspecialty.name,
					data.rank,
					
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