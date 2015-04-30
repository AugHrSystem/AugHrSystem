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

		<form:form commandName="ability">


			<ol class="breadcrumb">
				<li role="presentation" class="active"><a href="#">Home</a></li>
				<li role="presentation"><a href="‪#‎addModal‬"
					data-toggle="modal">Add Ability</a></li>
			</ol>
			<h2>Ability</h2>
			<table id="tbResult" class="table table-striped table-bordered">
				<thead>
					<tr class="success">
						<th>#</th>
						<th>Special</th>
						<th>Action</th>

					</tr>


				</thead>
				<tbody></tbody>
			</table>

			
		


		<!-- Button trigger modal -->
		<div class="form-group" align="right">
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">ADD</button>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Ability Add</h4>
					</div>
					<div class="modal-body">


						<div class="form-group" >

							<div class="col col-lg-4 col-md-5 col-sm-6 col-xs-12" >
								<label>Employee :</label>
								<div class="dropdown">
									<select class="form-control">
										<option>Code Employee</option>
										<option>TH001</option>
										<option>TH002</option>
										<option>TH003</option>
										<option>TH004</option>
									</select>
								</div>
							</div>
							
							
							<div class="form-group">
	    <label>Special :</label>
	    
		<div class="form-group">
		  <select class="form-control" >
			<option value="-1" label="---Select Special---" />
			<c:forEach var="obj" items="${masspecialList}">
				<option value="${obj.id }">${ obj.name}</option>
			</c:forEach>
		</select>
		</div>
	  </div> 

							<%-- <div class="col col-lg-4 col-md-5 col-sm-6 col-xs-12">
								<label>Special :</label>
								 <form:select path="masspecialty" class="form-control"
			id="masspecialty">
										<form:option value="-1" label="--- Select Special ---"/>
										<c:forEach var="obj" items="${specialList}">
											<option value="${obj.id }">${ obj.name}</option>
										</c:forEach>
									</form:select>
								
							</div>
 --%>
						</div>


<br>



					</div>



					<div class="form-group" align="center" >

						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
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
			
			/* var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var id = button.data("id") //Extract info from data-* attribute
			
			if(id != null){
				getId(id);
			} */
			
			$(this).find(".btnSave").off("click").on("click",function() {
				/* if(id != null){
					updateAbility(button, id);
				}else{ */
					addAbility();
				/* } */
				
			});
			
		});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */

		function addAbility(){
			$.ajax({
				url : "${pageContext.request.contextPath}/ability/add",
				data : JSON.stringify({
					
					masspecialty : {id:$("#masspecialty").val(), name: $("#masspecialty option:selected").text()},
				
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
						
						data.masspecialty.name,
						
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