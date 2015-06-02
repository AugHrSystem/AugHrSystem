<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Certification</title>

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

<!-- Date Time Picker -->
<script src="<c:url value="/resource/moment/js/moment.js" />"></script>
<script src="<c:url value="/resource/datetimepicker/js/bootstrap-datetimepicker.js" />"></script>
<link href="<c:url value="/resource/datetimepicker/css/bootstrap-datetimepicker.min.css" />" rel="stylesheet" media="all">


<!-- jQuery dataTable -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.min.css" />" rel="stylesheet" media="all">

<!-- dataTable Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>

</head>
<body>
<div class="container">

<form:form id ="listForm" method="post" commandName="certification">

<h2>Certification</h2> 

<br></br>

<!-- Table -->
<div class="form-group">
<table id="tbResult" class="table">
	<thead>
		<tr>
			<th>Year</th>
			<th>Certification Name</th>
			<th>Certification From</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="certification">

<!-- Button trigger modal -->
<div class="form-group" align="right">
<button type="button" id="addBtnCer" class="btn btn-info" data-toggle="modal" data-target="#addModal">Add</button> 
</div>

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Certification Add</h4>
      </div>
      
      <div class="modal-body">
        
	  <div class="form-group">
	    <label>Year :</label>
	    <form:input path="year" type="text" class="form-control" id="year" placeholder="Enter Year"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Certification Name :</label>
	    <form:input path="name" type="text" class="form-control" id="name" placeholder="Enter Certification Name"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Certification From :</label>
	    <form:input path="certificationFrom" type="text" class="form-control" id="certificationFrom" placeholder="Enter Certification From"/>
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

<form:form id="deleteForm" commandName="certification" method="post">

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
		
		$("#addBtnCer").on("click",function(){clearModal();});
		
		dt = $('#tbResult').dataTable();
		listAll();
		
		/* --- addProduct,updateProduct --- */
		$("#addModal").on("show.bs.modal",function(event) {
			
			//clearModal();
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var certificationid = button.data("id") //Extract info from data-* attribute
			
			if(certificationid != null){
				getId(certificationid);
			} 
			
			$(this).find(".btnSave").off("click").on("click",function() {
				if(certificationid != null){
					updateCertification(button, certificationid);
				}else{
					addCertification();
					
				 }
				
			});
			
		});
		
		/* --- DeleteName --- */
		$("#deleteModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var certificationid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".btnYes").off("click").on("click",function() {
				deleteCertification(button, certificationid);
			});
			
		});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */
		
		function clearModal(){
			$("#year").val("");
			$("#name").val("");
			$("#certificationFrom").val("");
		}
		
		function addCertification(){
			var id = getUrlParameter('Id');
			$.ajax({
				url : "${pageContext.request.contextPath}/certification/add",
				data : JSON.stringify({
					year : $("#year").val(),
					name :$("#name").val(),
					certificationFrom :$("#certificationFrom").val(),
					employeeId: id
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
						data.year,
						data.name,
						data.certificationFrom,
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
		
		function updateCertification(button, certificationid){
			var id = getUrlParameter('Id');
			$.ajax({
				url : "${pageContext.request.contextPath}/certification/update",
				data : JSON.stringify({
					id : certificationid,
					year : $("#year").val(),
					name :$("#name").val(),
					certificationFrom :$("#certificationFrom").val(),
					employeeId : id
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
					
					dt.fnUpdate(data.year,tr,0);
					dt.fnUpdate(data.name,tr,1);
					dt.fnUpdate(data.certificationFrom,tr,2);
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
		
		function getId(certificationid){
			$.ajax({
				url : "${pageContext.request.contextPath}/certification/findById",
				data : "certificationid=" + certificationid,
				type : "POST",
				success : function(data) {
	 				//alert(JSON.stringify(data));
					//alert("ok");
					$("#year").val(data.year);
					$("#name").val(data.name);
					$("#certificationFrom").val(data.certificationFrom);
					
					/* employee: {id: data.position } */
					/* $("#company").val(data.company),
					$("#salary").val(data.salary),
					$("#time").val(data.time); */
			
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function deleteCertification(button, certificationid){
			$.ajax({
				url : "${pageContext.request.contextPath}/certification/delete",
				data : "certificationid=" + certificationid,
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
		
		/* function listAll(){
			$.ajax({
				url : "${pageContext.request.contextPath}/history/listAll",
				type : "POST",
				success : function(data) {
					dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([data[i].position,
					              data[i].salary,data[i].oldSalary, 
					              data[i].dateOfAdjustment,data[i].reasonOfAdjustment,data[i].adjustmentTime,
						'<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
						'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
			
					}
				},
				error : function() {
					alert("ERROR");
				}
			}); 
		} */
		
		function listAll(){
			
			var id = getUrlParameter('Id');
			
			$.ajax({
				url : "${pageContext.request.contextPath}/certification/listAll/"+id,
				type : "POST",
				success : function(data) {
					dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([data[i].year,
					              data[i].name,
					              data[i].certificationFrom, 
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

</body>
</html>

