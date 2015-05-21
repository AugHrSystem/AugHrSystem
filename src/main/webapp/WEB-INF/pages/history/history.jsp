<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>History</title>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- jQuery -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

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
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.min.css" />" rel="stylesheet" media="all">

<!-- dataTable Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>

<style>
.datepicker{z-index:1151 !important;}

</style>

</head>
<body>
<div class="container">

<form:form id ="listForm" method="post" commandName="history">

<h2>History</h2> 

<br></br>

<!-- Table -->
<div class="form-group">
<table id="tbResult" class="table">
	<thead>
		<tr>
			<th>Position</th>
			<th>Salary</th>
			<th>Old Salary</th>
			<th>Date Of Adjustment</th>
			<th>Reason Of Adjustment</th>
			<th>Adjustment Time</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="history">

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
	  
	  <div class="form-group">
	    <label>Salary :</label>
	    <form:input path="salary" type="text" class="form-control" id="salary" placeholder="Enter Salary"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Old Salary :</label>
	    <form:input path="oldSalary" type="text" class="form-control" id="oldSalary" placeholder="Enter Old Salary"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Date Of Adjustment :</label>
	    <form:input path="dateOfAdjustment" type="text" class="form-control" id="dateOfAdjustment"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Reason Of Adjustment :</label>
	    <form:input path="reasonOfAdjustment" type="text" class="form-control" id="reasonOfAdjustment" placeholder="Enter Reason Of Adjustment"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Adjustment Time :</label>
	    <form:input path="adjustmentTime" type="text" class="form-control" id="adjustmentTime" placeholder="Enter Adjustment Time"/>
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

<form:form id="deleteForm" commandName="history" method="post">

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
		
		var date1 = $( "#dateOfAdjustment" ).datepicker({
			clearBtn : true,
			autoclose : true,
			forceParse : false,
			language : "en",
			format : "dd-mm-yyyy",
			todayHighlight : true
		});
		
		dt = $('#tbResult').dataTable();
		listAll();
		
		/* --- addProduct,updateProduct --- */
		$("#addModal").on("show.bs.modal",function(event) {
			
			clearModal();
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var historyid = button.data("id") //Extract info from data-* attribute
			
			if(historyid != null){
				getId(historyid);
			} 
			
			$(this).find(".btnSave").off("click").on("click",function() {
				if(historyid != null){
					updateHistory(button, historyid);
				}else{
					addHistory();
					
				 }
				
			});
			
		});
		
		/* --- DeleteName --- */
		$("#deleteModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var historyid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".btnYes").off("click").on("click",function() {
				deleteHistory(button, historyid);
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
		
		function addHistory(){
			$.ajax({
				url : "${pageContext.request.contextPath}/history/add",
				data : JSON.stringify({
					position : $("#position").val(),
					salary :$("#salary").val(),
					oldSalary :$("#oldSalary").val(),
					dateOfAdjustment :$("#dateOfAdjustment").val(),
					reasonOfAdjustment :$("#reasonOfAdjustment").val(),
					adjustmentTime :$("#adjustmentTime").val(),
					employee: {id: 2 }
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
						data.salary,
						data.oldSalary,
						data.dateOfAdjustment,
						data.reasonOfAdjustment,
						data.adjustmentTime,
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
		
		function updateHistory(button, historyid){
			$.ajax({
				url : "${pageContext.request.contextPath}/history/update",
				data : JSON.stringify({
					id : historyid,
					position : $("#position").val(),
					salary :$("#salary").val(),
					oldSalary :$("#oldSalary").val(),
					dateOfAdjustment :$("#dateOfAdjustment").val(),
					reasonOfAdjustment :$("#reasonOfAdjustment").val(),
					adjustmentTime :$("#adjustmentTime").val(),
					employee: {id: 2 }
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
					
					dt.fnUpdate(data.position,tr,0);
					dt.fnUpdate(data.salary,tr,1);
					dt.fnUpdate(data.oldSalary,tr,2);
					dt.fnUpdate(data.dateOfAdjustment,tr,3);
					dt.fnUpdate(data.reasonOfAdjustment,tr,4);
					dt.fnUpdate(data.adjustmentTime,tr,5);
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
		
		function getId(historyid){
			$.ajax({
				url : "${pageContext.request.contextPath}/history/findById",
				data : "historyid=" + historyid,
				type : "POST",
				success : function(data) {
	 				//alert(JSON.stringify(data));
					//alert("ok");
					$("#position").val(data.position);
					$("#salary").val(data.salary);
					$("#oldSalary").val(data.oldSalary);
					$("#dateOfAdjustment").val(data.dateOfAdjustment);
					$("#reasonOfAdjustment").val(data.reasonOfAdjustment);
					$("#adjustmentTime").val(data.adjustmentTime);
					employee: {id: data.employeeId };
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
		
		function deleteHistory(button, historyid){
			$.ajax({
				url : "${pageContext.request.contextPath}/history/delete",
				data : "historyid=" + historyid,
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
			alert("id >>>>"+id);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/history/listAll/"+id,
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

