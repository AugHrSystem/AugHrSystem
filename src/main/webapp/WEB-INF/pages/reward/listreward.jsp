<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reward</title>

<style>
.datepicker{z-index:1151 !important;}

</style>

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


<!-- Date Picker -->
<script src="<c:url value="/resource/datepicker/js/bootstrap-datepicker.js" />"></script>
<link href="<c:url value="/resource/datepicker/css/datepicker.css" />" rel="stylesheet" media="all">


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


	<div class="container" style="padding-top: 5px"">

		<form:form id ="listForm" method="post" commandName="reward">
		<div>
		<ol class="breadcrumb">
			<li role ="presentation" class="active"><a href="#">Home</a></li>
			<li role ="presentation"><a href="‪#‎addModal‬" data-toggle="modal">Add Reward</a></li>
		</ol>
		
		
			<div style="padding-bottom: 10px">
				<h2>Reward</h2>
			</div>
			<div class="form-group">

				<table id="tbResult" class=" table table-striped table-bordered">
					<thead>
					
						<tr>								
							<th>NAME</th>
							<th>YEAR</th>
							<th>DETAILREWARD</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			
	   </form:form>		

<form:form id ="addForm" method="post" commandName="reward">
		<!-- Button trigger modal -->
	<div class="form-group" align="right">
		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#addModal">Add Reward</button> 
	</div>
	
	<!-- ---------------------------------------Modal------------------------------------------------------------------ -->
	
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
			
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
				
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       					 <h4 class="modal-title" id="addModalLabel">Add Reward</h4>
      					</div>
							
																									
				<div class="col col-lg-12 " style="padding-top: 10px">	
									
					<div class="form-group " align="left">
							<label for="name">Name:</label>
							<form:input path="name" type="text" class="form-control" id="name" placeholder="Name"/>					
				    </div>


							<div class="form-group " align="left">
								<label> year :</label> <input type="text" class="form-control" id="year" placeholder="Year">
							</div>



						<div class="form-group "  align="left">
							<label for="detailreward">Detailreward:</label>
							<form:input path="detailreward" type="text" class="form-control" id="detailreward" placeholder="detailreward"/>							
				    </div>
				    		   
					
					<div align="right">
						<button type="button" class="btn btn-info btnSave">Save changes</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>	
				</div>
					<div class="modal-footer">
						
					</div>
				</div>			
			</div>
		</div>
	  </div> 
	  
	  
	  
<!------------------------------------------Button  modal 2----------------------------------------------------->
		
		
		<div class="modal fade" id="deleteModal" tabindex ="-1" role ="dialog" aria-labelledby ="myModalLabel" aria-hidden ="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-body">

						<label >ARE YOU DELETE !!</label>

					</div>
						<div class="modal-footer">
						  <button type="button" class="btn btn-default" data-dismiss ="modal"> NO </button>
						  <button type="button" class="btn btn-primary DeleteButton"> Delete </button>
					   </div>
				</div>

				
			</div>
		</div>
	
		   
	  
</form:form>

		
	<script type="text/javascript">

	var dt;
	
	$(document).ready(function(){
		
		var date1 = $( "#year" ).datepicker({
			clearBtn : true,
			autoclose : true,
			forceParse : false,
			language : "en",
			format : "dd/mm/yyyy",
			todayHighlight : true
		});
		
	
		dt = $('#tbResult').dataTable();
		
		 listAll();
		 
		$("#addModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var rewardid = button.data("id") //Extract info from data-* attribute
			
			
			clearModal();
			
			 if(rewardid != null){				 
				 getRewardById(rewardid);
			} 
			
	
			$(this).find(".btnSave").off("click").on("click",function() {
				
				 if(rewardid != null){
					updateReward(button, rewardid);
				}else{ 
					addReward();
					
				 } 
				
			});
			
		});
		
	
//		------------------------------------------------------------------------------------------------------------

	 	$("#deleteModal").on("show.bs.modal", function (event) {
				
	 			var button = $(event.relatedTarget); // select การกระทำของปุ่ม
	 			var rewardid = button.data("id"); //กดไอดีฝังในปุ่ม 
				
	 			
					
	 		$(this).find('.DeleteButton').off('click').on("click", function() {
								
	 					deleteById(button ,rewardid);
	 			
			
	 				})
					
	 			})
				
				
				
			});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */


		function clearModal(){
			$("#name").val(""),
			$("#year").val(""),
			$("#detailreward").val("");
			
		}

		

		function addReward(){
			$.ajax({
				url : "${pageContext.request.contextPath}/reward/add",
				data : JSON.stringify({
					name : $("#name").val(),
					year :$("#year").val(),
					detailreward :$("#detailreward").val(),					
//					employee :{id:2},
				
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
					
//	 				alert(JSON.stringify(data));
						
					dt.fnClearTable();
					
					dt.fnAddData([
					
						data.name,
						data.year,
						data.detailreward,
						
						
						
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
		
		
		
		
		function updateReward(button,rewardid) {
			$.ajax({
				url:'${pageContext.request.contextPath}/reward/update',
				type:"POST",
				contentType:"application/json",
				datatype: "json",
				data: JSON.stringify({    //แปลงจาก obj ของจาวาสคริปให้ไปเป็น string  ของเจสัน
					
								id :rewardid,
								name: $("#name").val(),	
								year: $("#year").val(),	
								detailreward :$("#detailreward").val(),
								
		
					}),
					
					success : function(data) {
						
					var tr = button.closest("tr"); // หาเเถวจากปุ่ม
						
					
					dt.fnUpdate(data.name, tr, 0),
					dt.fnUpdate(data.year, tr, 1),
					dt.fnUpdate(data.detailreward, tr, 2),
					
					'<button class="btn btn-info btn-small" type="button" data-toggle="modal" data-target="#addModal" data-id="'+ data.id +'"><i class="icon-white icon-pencil"></i> Edit</button>',
					'<button class="btn btn-danger btn-small" type="button" data-toggle="modal" data-target="#addModal" data-id="'+ data.id +'" ><i class="icon-white icon-trash"></i> Delete</button>'
					
						
						$('#addModal').modal('toggle');
					},
					error : function() {
						alert("ERROR");
					}
			});
			
		}
		
		
		function getRewardById(rewardid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/reward/findById",
				data : "id=" +rewardid,
				type : "POST", 
				success : function(data) {
					$("#name").val(data.name); 
					$("#year").val(data.year);
					$("#detailreward").val(data.detailreward);
					
					
					
						},
				error : function(jqXHR,	textStatus,	error) {
					
							alert("error");
									}
							});
		}
		
		
		
		
		function deleteById(button ,rewardid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/reward/delete",
				data : "id=" +rewardid,
				type : "POST", 
				
				success : function(data) {
					
					var tr = button.closest("tr"); // หาเเถวจากปุ่ม
											
					dt.fnDeleteRow(tr);
					
						$('#deleteModal').modal('toggle');
					},
					
						
				error : function(jqXHR,	textStatus,	error) {
					
							alert("error ----");
						}
				});
			
			
			
		}
			function listAll(){
				$.ajax({
					url : "${pageContext.request.contextPath}/reward/listAll",
					type : "POST",
					success : function(data) {
						dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([data[i].name,data[i].year, 
						              data[i].detailreward,
							'<button type="button" class="btn btn-info btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
							'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
				
						}
					},
					error : function(data,testStatus,jqXHR) {
						$("#outputajax").text(testStatus);
						}
					}); 
			}
			
		
			
			
		
	
	
</script>
	
		
	
</body>
</html>