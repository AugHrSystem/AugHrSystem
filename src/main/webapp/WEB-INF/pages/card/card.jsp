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
<title>card</title>
<style>
.datepicker{z-index:1151 !important;}

</style>

</head>
<body>
	<div class="container" style="padding-top: 5px"">
		<form:form id ="listForm" method="post" commandName="card">	
			<div style="padding-bottom: 10px">
				<h2>Card</h2>		
			</div>
			<div class="form-group">
			<br><br>
				<table id="tbResult" class="table">
					<thead>					
						<tr>								
							<th>Card No.</th>
							<th>Start Date</th>					
							<th>End Date</th>
							<th>Status</th>
							<th>Remark</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>		
	   </form:form>		

	<form:form id ="addForm" method="post" commandName="card">
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
       					 <h4 class="modal-title" id="addModalLabel">Add Card</h4>
      				</div>
      					
      		<div class="col col-lg-12 " style="padding-top: 10px">	
      			<div class="form-group "  align="left">
							<label for="cardno" >Card No.:</label>
							<form:input path="card_no" type="text" class="form-control" id="cardno" placeholder="Card No."/>							
				</div>			
      					
																																		
				    <div class="form-group "  align="left">
							<label for="startdate">Start Date:</label>
						<div class='input-group date' id='datetimepicker1'>
	   						 <form:input path="startdate" type="text" class="form-control" id="startdate"/>
	  						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>	  	
					  	</div>													
					</div>
				    		
			
				    <div class="form-group "  align="left">
							<label for="enddate">End Date:</label>
						<div class='input-group date' id='datetimepicker2'>
	   						 <form:input path="enddate" type="text" class="form-control" id="enddate"/>
	  						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>	  	
					  	</div>													
					</div>    		
				    		
				    		<div class="form-group " align="left">
									 <label>Status :</label>
									<form:select path="status" class="form-control" id="status">
										<form:option value="-1" label="---Select status---" />
										<%-- <c:forEach var="obj" items="${ masdegreetypeList }"> --%>						
										<option value="Onsite">On site</option>
										<option value="Office">Office</option>
										<option value="Resign">Resign</option>	
										<%-- </c:forEach> --%>
									</form:select>
								</div>
				    						    		
				    			    
				    <div class="form-group "  align="left">
							<label for="remark" >Remark:</label>
							<form:input path="remark" type="text" class="form-control" id="remark" placeholder="Remark"/>							
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
		
		$('#datetimepicker2').datetimepicker({
			 
			 format : 'DD-MM-YYYY',
			 
		 });
		
		
	
		dt = $('#tbResult').dataTable();	
		 listAll();
		 
		$("#addModal").on("show.bs.modal",function(event) {
						
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var cardid = button.data("id") //Extract info from data-* attribute
						
			 if(cardid != null){				 
				 getcardById(cardid);
			} 
						
			$(this).find(".btnSave").off("click").on("click",function() {
				
				 if(cardid != null){
					updatecard(button, cardid);
					console.log("updatecard");
				}else{ 
					addcard();
					console.log("addcard");
				 } 
				
			});
			
		});
		
		
//		------------------------------------------------------------------------------------------------------------

	 	$("#deleteModal").on("show.bs.modal", function (event) {
				
	 			var button = $(event.relatedTarget); // select การกระทำของปุ่ม
	 			var cardid = button.data("id"); //กดไอดีฝังในปุ่ม 
				
		
	 			$(this).find('.DeleteButton').off('click').on("click", function() {
								
	 					deleteById(button ,cardid);
	 
	 				})
					
	 			})
								
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */
		function clearModal(){
			$("#cardno").val(""),
			$("#startdate").val("");
			$("#enddate").val(""),
			$("#status").val(""),
			$("#remark").val("")
		
		}

		function addcard(){
			var id = getUrlParameter('Id');
			$.ajax({
				url : "${pageContext.request.contextPath}/card/add",
				data : JSON.stringify({
					card_no : $("#cardno").val(),
					startdate : $("#startdate").val(),
					enddate : $("#enddate").val(),
					status : $("#status").val(),
					remark :$("#remark").val(),
					employeeId : id	
					//employeeId : {id:2}		
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {

					dt.fnClearTable();					
					dt.fnAddData([             
									data.card_no,
									data.startdate,	
									data.enddate,
									data.status,
									data.remark,
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
		
		
		
		function updatecard(button,cardid) {
			var id = getUrlParameter('Id');
			$.ajax({
				url:'${pageContext.request.contextPath}/card/update',			
				data: JSON.stringify({    //แปลงจาก obj ของจาวาสคริปให้ไปเป็น string  ของเจสัน
					
								id :cardid,
								card_no: $("#cardno").val(),	
								startdate: $("#startdate").val(), 
								enddate: $("#enddate").val(),
								status: $("#status").val(),
								remark: $("#remark").val(),
								employeeId : id	
								//employeeId: {id:2}
											
					}),
					type:"POST",
					contentType:"application/json",
					datatype: "json",
					success : function(data) {
						
					var tr = button.closest("tr"); // หาเเถวจากปุ่ม
						
					
					dt.fnUpdate(data.card_no, tr, 0),
					dt.fnUpdate(data.startdate, tr, 1),
					dt.fnUpdate(data.enddate, tr, 2),
					dt.fnUpdate(data.status, tr, 3),
					dt.fnUpdate(data.remark, tr, 4),
				
						$('#addModal').modal('toggle');
						listAll();
					},
					error : function(jqXHR,	textStatus,	error) {	
							alert("error");
					}
			});
			
		}
		
		
		
		function getcardById(cardid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/card/findById/"+ cardid,
				//data : "id=" +cardid,
				type : "POST", 
				success : function(data) {
					$("#cardno").val(data.card_no); 
					$("#startdate").val(data.startdate);
					$("#enddate").val(data.enddate);
					$("#status").val(data.status);
					$("#remark").val(data.remark);
					employeeId: data.employeeId;
					
					},
				error : function(jqXHR,	textStatus,	error) {				
						alert("error");
									}
							});
						}	
		
		
		
		function deleteById(button,cardid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/card/delete/"+ cardid,
				//data : "id=" +cardid,
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
					url : "${pageContext.request.contextPath}/card/listAll"+id,
					type : "POST",
					success : function(data) {
						dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([data[i].card_no,
						              data[i].startdate, 		
						              data[i].enddate, 
						              data[i].status, 
						              data[i].remark, 
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