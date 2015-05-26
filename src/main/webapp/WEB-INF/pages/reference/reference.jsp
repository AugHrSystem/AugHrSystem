<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reference</title>

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
<link href="<c:url value="/resource/bootstrap/css/main.css" />" rel="stylesheet" media="all">

<!-- jQuery dataTable -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.min.css" />" rel="stylesheet" media="all">

<!-- dataTable Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>


</head>


<body>


	<div class="container" style="padding-top: 5px"">

		<form:form id ="listForm" method="post" commandName="reference">
		
		
			<div style="padding-bottom: 10px">
			
			
				<h2>Reference</h2>
				
				
			</div>
			<div class="form-group">
<br><br>
				<table id="tbResult" class="table">
					<thead>
					
						<tr>								
							<th>NAME</th>
							<th>ADDRESS</th>
							<th>tel</th>
							<th>occupation</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			
	   </form:form>		

<form:form id ="addForm" method="post" commandName="reference">
		<!-- Button trigger modal -->
	<div class="form-group" align="right">
		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#addModal">Add</button> 
	</div>
	
	<!-- ---------------------------------------Modal------------------------------------------------------------------ -->
	
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
			
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
				
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       					 <h4 class="modal-title" id="addModalLabel">Add Reference</h4>
      					</div>
							
																									
				<div class="col col-lg-12 " style="padding-top: 10px">	
									
					<div class="form-group " align="left">
							<label for="name" >Name:</label>
							<form:input path="name" type="text" class="form-control" id="name" placeholder="Name"/>					
				    </div>
				    
				    <div class="form-group "  align="left">
							<label for="address" >Address:</label>		
							<form:textarea path="address" class="form-control" rows="1" id="address" placeholder="Address"/>		
				    </div>
				    
				    <div class="form-group "  align="left">
							<label for="tel" >tel:</label>
							<form:input path="tel" type="text" class="form-control" id="tel" placeholder="tel"/>							
				    </div>
				    
				    <div class="form-group "  align="left">
							<label for="occupation" >occupation:</label>
							<form:input path="occupation" type="text" class="form-control" id="occupation" placeholder="occupation"/>							
				    </div>
					
					<div class="form-group" align="center">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-info btnSave">Save</button>
					</div>	
				</div>
				</div>			
			</div>
		</div>
	  </div> 
	  
	  
	  
<!------------------------------------------Button  modal 2--------------------------------------------------------->
		
		
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

		
	<script type="text/javascript">

	var dt;
	
	
	$(document).ready(function(){
		dt = $('#tbResult').dataTable();
		
		 listAll();
		 
		$("#addModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var referenceid = button.data("id") //Extract info from data-* attribute
			
			
			clearModal();
			 if(referenceid != null){				 
				 getReferenceById(referenceid);
			} 
			
			else{
	
			} 
			
			$(this).find(".btnSave").off("click").on("click",function() {
				
				 if(referenceid != null){
					updateReference(button, referenceid);
				}else{ 
					addReference();
					
				 } 
				
			});
			
		});
		
		
		
		
//		------------------------------------------------------------------------------------------------------------

	 	$("#deleteModal").on("show.bs.modal", function (event) {
				
	 			var button = $(event.relatedTarget); // select การกระทำของปุ่ม
	 			var referenceid = button.data("id"); //กดไอดีฝังในปุ่ม 
				
	 			
					
	 		$(this).find('.DeleteButton').off('click').on("click", function() {
								
	 					deleteById(button ,referenceid);
	 			
			
	 				})
					
	 			})
				
				
				
			});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */


		function clearModal(){
			$("#name").val(""),
			$("#address").val(""),
			$("#Unit").val(""),
			$("#tel").val(""),
			$("#occupation").val("");
		}

		

		function addReference(){
			$.ajax({
				url : "${pageContext.request.contextPath}/reference/add",
				data : JSON.stringify({
					name : $("#name").val(),
					address :$("#address").val(),
					tel :$("#tel").val(),
					occupation :$("#occupation").val(),
					employee :{id:2},
				
				}),
				type : "POST",
				contentType : "application/json",
				//dataType: "json",
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
						data.address,
						data.tel,
						data.occupation,
						
						
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
		
		
		
		
		function updateReference(button,referenceid) {
			$.ajax({
				url:'${pageContext.request.contextPath}/reference/update',
				type:"POST",
				contentType:"application/json",
				datatype: "json",
				data: JSON.stringify({    //แปลงจาก obj ของจาวาสคริปให้ไปเป็น string  ของเจสัน
					
								id :referenceid,
								name: $("#name").val(),	
								address: $("#address").val(), 
								tel :$("#tel").val(),
								occupation: $("#occupation").val(),
								
					
					}),
					
					success : function(data) {
						
					var tr = button.closest("tr"); // หาเเถวจากปุ่ม
						
					
					dt.fnUpdate(data.name, tr, 0),
					dt.fnUpdate(data.address, tr, 1),
					dt.fnUpdate(data.tel, tr, 2),
					dt.fnUpdate(data.occupation, tr, 3),
					'<button class="btn btn-warning btn-small" type="button" data-toggle="modal" data-target="#addModal" data-id="'+ data.id +'"><i class="icon-white icon-pencil"></i> Edit</button>',
					'<button class="btn btn-danger btn-small" type="button" data-toggle="modal" data-target="#addModal" data-id="'+ data.id +'" ><i class="icon-white icon-trash"></i> Delete</button>'
					
						
						$('#addModal').modal('toggle');
					},
					error : function() {
						alert("ERROR");
					}
			});
			
		}
		
		
		function getReferenceById(referenceid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/reference/findById",
				data : "id=" +referenceid,
				type : "POST", 
				success : function(data) {
					$("#name").val(data.name); 
					$("#address").val(data.address);
					$("#tel").val(data.tel);
					$("#occupation").val(data.occupation);
					
					
						},
				error : function(jqXHR,	textStatus,	error) {
					
							alert("error");
									}
							});
		}
		
		
		
		
		function deleteById(button ,referenceid) {
			$.ajax({
				url : "${pageContext.request.contextPath}/reference/delete",
				data : "id=" +referenceid,
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
				var id = 2;
				var id = getUrlParameter('Id');
				$.ajax({
					url : "${pageContext.request.contextPath}/reference/listAll/"+id,
					type : "POST",
					success : function(data) {
						dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([data[i].name,data[i].address, 
						              data[i].tel,data[i].occupation,
							'<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
							'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
				
						}
					},
					error : function(data,testStatus,jqXHR) {
						$("#outputajax").text(testStatus);
						}
					}); 
			}
			
		

			function getUrlParameter(sParam){
	
				//alert("url "+document.referrer);
			    var sPageURL = document.referrer;
			    var sURLVariables = sPageURL.split('?');
			    var sParameterName;
			    //alert("spilt "+sURLVariables);

			   	
			    
			    sParameterName = sURLVariables[1].split('=');
			    //alert("Param "+parseInt(sParameterName[1]));
			    if (sParameterName[0] == sParam) 
			        {
			        	//alert("Param "+sParameterName[0]);
			        	return sParameterName[1];
			        	
			        }
			        //alert("Param2 "+parseInt(sParameterName[1]));
			    
			}     
			
		
	
	
</script>
	
		
	
</body>
</html>