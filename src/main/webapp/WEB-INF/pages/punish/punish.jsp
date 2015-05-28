<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- jQuery -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>

<!-- Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>

<!-- jQuery dataTable -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.min.css" />" rel="stylesheet" media="all">

<!-- Date Time Picker -->
<script src="<c:url value="/resource/moment/js/moment.js" />"></script>
<script src="<c:url value="/resource/datetimepicker/js/bootstrap-datetimepicker.js" />"></script>
<link href="<c:url value="/resource/datetimepicker/css/bootstrap-datetimepicker.min.css" />" rel="stylesheet" media="all">

<!-- dataTable Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>
<title>punish</title>
<style>
.datepicker{z-index:1151 !important;}

</style>

</head>
<body>
	<div class="container" style="padding-top: 5px"">
		<form:form id ="listForm" method="post" commandName="punish">	
			<div style="padding-bottom: 10px">
				<h2>Punish</h2>		
			</div>
			<div class="form-group">
			<br><br>
				<table id="tbResult" class="table">
					<thead>					
						<tr>								
							<th>DATE</th>
							<th>Punish Description</th>					
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>		
	   </form:form>		

	<form:form id ="addForm" method="post" commandName="punish">
		<!-- Button trigger modal -->
	<div class="form-group" align="right">
		<button type="button"  id="addBtn" class="btn btn-info" data-toggle="modal" data-target="#addModal">Add</button> 
	</div>
	
	<!-- ---------------------------------------Modal------------------------------------------------------------------ -->
	
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">		
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">			
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       					 <h4 class="modal-title" id="addModalLabel">Add Punish</h4>
      					</div>
																															
				<div class="col col-lg-12 " style="padding-top: 10px">		
				    <div class="form-group "  align="left">
							<label for="tel" >Date:</label>
						<div class='input-group date' id='datetimepicker1'>
	   						 <form:input path="datepunish" type="text" class="form-control" id="datepunish"/>
	  						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>	  	
					  	</div>													
				    </div>			    
				    <div class="form-group "  align="left">
							<label for="oocupation" >Punish Description:</label>
							<form:input path="description" type="text" class="form-control" id="description" placeholder="Description"/>							
				    </div>					
					<div class="form-group" align="center">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-info btnSave">Save</button>
					</div>	
				</div>
				</div>			
			</div>
		</div>
	</form:form>
	  
<!------------------------------------------Button  modal 2----------------------------------------------------->
	<form:form id="deleteForm" commandName="history" method="post">		
		
		<div class="modal fade" id="deleteModal" tabindex ="-1" role ="dialog" aria-labelledby ="myModalLabel" aria-hidden ="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-body">

						<label >ARE YOU DELETE !!</label>

					</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-danger DeleteButton"> Yes </button>
						  <button type="button" class="btn btn-info" data-dismiss ="modal"> NO </button>
					   </div>
				</div>
			</div>			
		</div>
	</form:form>
</div>
		   
<script type="text/javascript">

	var dt;
	$(document).ready(function() {
		
		$("#addBtn").on("click",function(){clearModal();});
		
		$('#datetimepicker1').datetimepicker({
			 
			 format : 'DD-MM-YYYY',
			 
		 });
	
		dt = $('#tbResult').dataTable();	
		 listAll();
		 
		$("#addModal").on("show.bs.modal",function(event) {
						
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var punishid = button.data("id") //Extract info from data-* attribute
						
			 if(punishid != null){				 
				 getpunishById(punishid);
			} 
						
			$(this).find(".btnSave").off("click").on("click",function() {
				
				 if(punishid != null){
					updatepunish(button, punishid);
				}else{ 
					addpunish();
					
				 } 
				
			});
			
		});
		
		
//		------------------------------------------------------------------------------------------------------------

	 	$("#deleteModal").on("show.bs.modal", function (event) {
				
	 			var button = $(event.relatedTarget); // select การกระทำของปุ่ม
	 			var punishid = button.data("id"); //กดไอดีฝังในปุ่ม 
				
		
	 			$(this).find('.DeleteButton').off('click').on("click", function() {
								
	 					deleteById(button ,punishid);
	 
	 				})
					
	 			})
								
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */
		function clearModal(){
			$("#datepunish").val(""),
			$("#description").val("");
		
		}

		function addpunish(){
			var id = getUrlParameter('Id');
			$.ajax({
				url : "${pageContext.request.contextPath}/punish/add",
				data : JSON.stringify({
					datepunish : $("#datepunish").val(),
					description :$("#description").val(),
					employeeId : id		
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {

					dt.fnClearTable();					
					dt.fnAddData([             
									data.datepunish,
									data.description,										
						'<button type="button" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > Edit</button>',
						'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> Delete</button>'
					]);
					
					$('#addModal').modal('toggle');
					listAll();
				},
				error : function(jqXHR,	textStatus,	error) {	
						alert("error");
				}
			});
		}
		
		
		
		function updatepunish(button,punishid) {
			var id = getUrlParameter('Id');
			$.ajax({
				url:'${pageContext.request.contextPath}/punish/update',			
				data: JSON.stringify({    //แปลงจาก obj ของจาวาสคริปให้ไปเป็น string  ของเจสัน
					
								id :punishid,
								datepunish: $("#datepunish").val(),	
								description: $("#description").val(), 
								employeeId: id 
											
					}),
					type:"POST",
					contentType:"application/json",
					datatype: "json",
					success : function(data) {
						
					var tr = button.closest("tr"); // หาเเถวจากปุ่ม
						
					
					dt.fnUpdate(data.datepunish, tr, 0),
					dt.fnUpdate(data.description, tr, 1),
				
						$('#addModal').modal('toggle');
						listAll();
					},
					error : function(jqXHR,	textStatus,	error) {	
							alert("error");
					}
			});
			
		}
		
		
		
		function getpunishById(punishid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/punish/findById/"+ punishid,
				//data : "id=" +punishid,
				type : "POST", 
				success : function(data) {
					$("#datepunish").val(data.datepunish); 
					$("#description").val(data.description);
					employeeId: data.employeeId;
					
					},
				error : function(jqXHR,	textStatus,	error) {				
						alert("error");
									}
							});
						}	
		
		
		
		function deleteById(button,punishid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/punish/delete/"+ punishid,
				//data : "id=" +punishid,
				type : "POST", 
				success : function(data) {				
					/* var tr = button.closest("tr"); // หาเเถวจากปุ่ม											
					dt.fnDeleteRow(tr); */					
						$('#deleteModal').modal('toggle');
						listAll();
					},										
				error : function(jqXHR,	textStatus,	error) {
						alert("error ----");
						}
				});							
		}
		
		
		
			function listAll(){
				
				var id = getUrlParameter('Id');
				//alert("id >>>>"+id);				
				$.ajax({
					url : "${pageContext.request.contextPath}/punish/listAll"+id,
					type : "POST",
					success : function(data) {
						dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([data[i].datepunish,
						              data[i].description, 					              
							'<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
							'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
				
						}
					},
					error : function(jqXHR,	textStatus,	error) {	
							alert("error");
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