<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Allowances</title>

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

<form:form id ="listForm" method="post" commandName="allowances">

<div class="row">
<div class="col-md-6">
<h2>Allowances</h2> 
</div>
<br>

<!-- Button trigger modal -->
<div class="form-group" align="right">
<div class="col-md-6">
<button type="button" id="addBtnAll" class="btn btn-info" data-toggle="modal" data-target="#addModal">New record</button> 
</div>
</div>
</div>

<!-- Table -->
<div class="form-group">
<table id="tbResult" class="table">
	<thead>
		<tr>
			<th>Allowances Type</th>
			<th>Amount Allowances</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="allowances">

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Allowances Add</h4>
      </div>
      
      <div class="modal-body">
        
	  <div class="form-group">
	    <label>Allowances Type :</label>
	    <form:select path="masallowances" class="form-control"
			id="masallowances" onchange="myFunction(this.value)">
			<form:option value="-1" label="---Select Allowances---" />
			<c:forEach var="obj" items="${ masallowancesList }">
				<option value="${obj.id }">${ obj.allowances_type}</option>
			</c:forEach>
		</form:select>
	  </div>
	  
	  <div class="form-group">
	    <label>Amount Allowances :</label>
	    <form:input path="amount" type="text" class="form-control" id="amount" placeholder="Enter Amount Allowances"/>
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

<form:form id="deleteForm" commandName="allowances" method="post">

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

function myFunction(value) {
	if (value == 1){
		document.getElementById("amount").value = "30000";
    } 
}

</script>

<script type="text/javascript">

	var dt;
	
	$(document).ready(function(){
		
		$("#addBtnAll").on("click",function(){clearModal();});
		
		$('#tbResult').dataTable({ 
			"bLengthChange": false,
			"iDisplayLength": 10,
			"pagingType": "simple_numbers",
			"ordering": false,
			"info": false
		});
		
		dt = $('#tbResult').dataTable();
		listAll();
		
		/* --- addProduct,updateProduct --- */
		$("#addModal").on("show.bs.modal",function(event) {
			
			//clearModal();
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var allowancesid = button.data("id") //Extract info from data-* attribute
			
			if(allowancesid != null){
				getId(allowancesid);
			} 
			
			$(this).find(".btnSave").off("click").on("click",function() {
				if(allowancesid != null){
					updateAllowances(button, allowancesid);
				}else{
					addAllowances();
					
				 }
				
			});
			
		});
		
		/* --- DeleteName --- */
		$("#deleteModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var allowancesid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".btnYes").off("click").on("click",function() {
				deleteAllowances(button, allowancesid);
			});
			
		});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */
		
		function clearModal(){
			$("#masallowances").val("-1");
			$("#amount").val("");
		}
		
		function addAllowances(){
			var id = getUrlParameter('Id');
			$.ajax({
				url : "${pageContext.request.contextPath}/allowances/add",
				data : JSON.stringify({
					masAllowancesId : $("#masallowances").val(), 
					masallowances : $("#masallowances option:selected").text(),
					amount :$("#amount").val(),
					employeeId: id
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
					
//	 				alert(JSON.stringify(data));
						
// 					dt.fnClearTable();
					
// 					dt.fnAddData([
// 						/* $("#Name").val(),
// 						$("#ProductCategory").val(),
// 						$("#Unit").val(),
// 						$("#Price").val(),
// 						$("#Description").val(), */
// 						data.masallowances,
// 						data.amount,
// 						/* data.company,
// 						data.salary,
// 						data.time, */
						
// 						'<button type="button" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > Edit</button>',
// 						'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> Delete</button>'
// 					]);
					
					$('#addModal').modal('toggle');
					listAll();
					
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function updateAllowances(button, allowancesid){
			var id = getUrlParameter('Id');
			$.ajax({
				url : "${pageContext.request.contextPath}/allowances/update",
				data : JSON.stringify({
					id : allowancesid,
					masAllowancesId : $("#masallowances").val(), 
					masallowances : $("#masallowances option:selected").text(),
					amount :$("#amount").val(),
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
					
// 					var tr = button.closest("tr")
					
// 					dt.fnUpdate(data.masallowances,tr,0);
// 					dt.fnUpdate(data.amount,tr,1);
					/* dt.fnUpdate(data.company, tr ,1);
					dt.fnUpdate(data.salary, tr ,2);
					dt.fnUpdate(data.time, tr ,3); */
					
					$('#addModal').modal('toggle');
					listAll();
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function getId(allowancesid){
			$.ajax({
				url : "${pageContext.request.contextPath}/allowances/findById",
				data : "allowancesid=" + allowancesid,
				type : "POST",
				success : function(data) {
	 				//alert(JSON.stringify(data));
					//alert("ok");
					$("#masallowances").val(data.masAllowancesId);
					$("#amount").val(data.amount);
					
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
		
		function deleteAllowances(button, allowancesid){
			$.ajax({
				url : "${pageContext.request.contextPath}/allowances/delete",
				data : "allowancesid=" + allowancesid,
				type : "POST",
				success : function(data) {
//	 					alert(JSON.stringify(data));
					
					var tr = button.closest("tr")
					
					dt.fnDeleteRow(tr);
					
					$('#deleteModal').modal('toggle');
					
					listAll();
					
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
				url : "${pageContext.request.contextPath}/allowances/listAll/"+id,
				type : "POST",
				success : function(data) {
					dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([
					              data[i].masallowances,
					              data[i].amount,
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

