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
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>


<%-- <link href="<c:url value="/resource/bootstrapvalidator/vendor/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all"> --%>
<link href="<c:url value="/resource/bootstrapvalidator/dist/css/bootstrapValidator.css" />" rel="stylesheet" media="all">

<%-- <script src="<c:url value="/resource/bootstrapvalidator/vendor/jquery/jquery.min.js" />"></script> --%>
<%-- <script src="<c:url value="/resource/bootstrapvalidator/vendor/bootstrap/js/bootstrap.min.js" />"></script> --%>
<script src="<c:url value="/resource/bootstrapvalidator/dist/js/bootstrapValidator.js" />"></script>

<!-- jQuery dataTable -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet" media="all">

<!-- dataTable Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>

</head>
<body>
<div class="container">
<form:form id ="listForm" method="post" commandName="ability">

			<div class="row-md-12">

				<div class="col-md-6">
					<h2>Ability</h2>

				</div>

				<div class="col-md-6">

					<br>
					<!-- Button trigger modal -->
					<div class="form-group" align="right">
						<button type="button" id="addBtnAbi" class="btn btn-info"
							data-toggle="modal" data-target="#addModal">New record</button>
					</div>
					</br>


				</div>
			</div>


			<!-- Table -->
<div class="form-group">
<table id="tbResult" class="table">
	<thead>
		<tr>
			<!-- <th>#</th> -->
			<th>Specialty</th>
			<th>Rank</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="ability" >



<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Ability </h4>
      </div>
     
      
      <div class="modal-body">
        
	
	  
	  <div class="form-group">
	    <label>Specialty :</label>
	    
		<div class="form-group">
		  <form:select path="masspecialty" class="form-control"
			id="masspecialty">
			<form:option value="-1" label="---Select Specialty---" />
			<c:forEach var="obj" items="${ masspecialtyList }">
				<option value="${obj.id }">${ obj.name}</option>
			</c:forEach>
		</form:select>
		</div>
	  </div>
	  
	   <%-- <div class="form-group">
	    <label>Rank :</label>
	    <form:input path="rank" type="text" class="form-control" id="rank" placeholder="Enter Rank"/>
	  </div> --%>
	  
	  
	  <div class="form-group">
								<div class="col-md-3">
								
								<label class="radio-inline" for="rank" > 
		 			     	<form:radiobutton id="rank1" name="rank" path="rank" value="1" checked="true"/>1</label>
		 			     	
		 			     	<label class="radio-inline" for="rank" > 
		 			     	<form:radiobutton id="rank2" name="rank" path="rank" value="2" />2</label>
		 			     	
		 			     	<label class="radio-inline" for="rank" > 
		 			     	<form:radiobutton id="rank3" name="rank" path="rank" value="3" />3</label>
		 			     	
		 			   		<label class="radio-inline" for="rank" > 
		 			     	<form:radiobutton id="rank4" name="rank" path="rank" value="4" />4</label>
		 			     	
		 			     	<label class="radio-inline" for="rank" > 
		 			     	<form:radiobutton id="rank5" name="rank" path="rank" value="5" />5</label>
		 			     	
		 			     	<label class="radio-inline" for="rank" > 
		 			     	<form:radiobutton id="rank6" name="rank" path="rank" value="6" />6</label>
		 			     	
		 			     	<label class="radio-inline" for="rank" > 
		 			     	<form:radiobutton id="rank7" name="rank" path="rank" value="7" />7</label>
		 			     	
		 			     	<label class="radio-inline" for="rank" > 
		 			     	<form:radiobutton id="rank8" name="rank" path="rank" value="8" />8</label>
		 			     	
		 			     	<label class="radio-inline" for="rank" > 
		 			     	<form:radiobutton id="rank9" name="rank" path="rank" value="9" />9</label>
		 			     	
		 			     	<label class="radio-inline" for="rank" > 
		 			     	<form:radiobutton id="rank10" name="rank" path="rank" value="10" />10</label>
		 			  
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


<form:form id="deleteForm" commandName="ability" method="post">

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
						<h4 class="modal-title" id="myModalLabel">Delete Ability</h4>
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
	
	$("#addBtnAbi").on("click",function(){clearModal();});
	
	  

	
	$('#addForm').bootstrapValidator({
		
		  message: 'This value is not valid',
	        feedbackIcons: {
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	masspecialty: {
	                validators: {
	                    notEmpty: {
	                        message: 'The masspecialty is required and cannot be empty'
	                    }
	                }
	            },
	          /*   rank: {
	                validators: {
	                    notEmpty: {
	                        message: 'The rank is required and cannot be empty'
	                    },
	                    digits:{
	                    	message:'Plase Number'
	                    }
	                }
	            } */
	        }
		
	});
	
	dt = $('#tbResult').dataTable();
	listAll();
	/* --- addProduct,updateProduct --- */
	
	
	
	$("#addModal").on("show.bs.modal",function(event) {
		
		//clearModal();
		
		var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
		var abilityid = button.data("id") //Extract info from data-* attribute
		 
		if(abilityid != null){
			getId(abilityid);
		}  
		
		$(this).find(".btnSave").off("click").on("click",function() {
			 if(abilityid != null){
				/*  alert("be up"); */
				updateAbility(button,abilityid);
				
			}else{ 
				addAbility();
				
			  } 
			
		});
		
	});
	
	/* --- DeleteName --- */
	$("#deleteModal").on("show.bs.modal",function(event) {
		
		var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
		var abilityid = button.data("id") //Extract info from data-* attribute
		
		$(this).find(".btnYes").off("click").on("click",function() {
			deleteAbility(button,abilityid);
		});
		
	});
	
	
	
	/* ---------------------------------------------------------------------------------------------------------------------------------------------- */
	
	function addAbility(){
		
		
		
		if($('#rank1:checked').val()!=null){
  			
			rank = $('#rank1:checked').val();
  			
  		}else if($('#rank2:checked').val()!=null){
  			
  			rank = $('#rank2:checked').val();
  			
  		}else if($('#rank3:checked').val()!=null){
  			
  			rank = $('#rank3:checked').val();
  			
  		}else if($('#rank4:checked').val()!=null){
  			
  			rank = $('#rank4:checked').val();
  			
  		}else if($('#rank5:checked').val()!=null){
  			
  			rank = $('#rank5:checked').val();
  			
  		}else if($('#rank6:checked').val()!=null){
  			
  			rank = $('#rank6:checked').val();
  			
  		}else if($('#rank7:checked').val()!=null){
  			
  			rank = $('#rank7:checked').val();
  			
  		}else if($('#rank8:checked').val()!=null){
  			
  			rank = $('#rank8:checked').val();
  			
  		}else if($('#rank9:checked').val()!=null){
  			
  			rank = $('#rank9:checked').val();
  			
  		}else if($('#rank10:checked').val()!=null){
  			
  			rank = $('#rank10:checked').val();
  			
  		}
		
		
		
		
		var id = getUrlParameter('Id');
		$.ajax({
			url : "${pageContext.request.contextPath}/ability/add",
			data : JSON.stringify({
				masspecialtyId : $("#masspecialty").val(), 
				masspecialty : $("#masspecialty option:selected").text(),
				rank : rank,
				employeeId :id
			}),
			type : "POST",
			contentType : "application/json",
			dataType: "json",
			success : function(data) {
				
			//alert(JSON.stringify(data));
					
			
				 dt.fnClearTable();
				
				dt.fnAddData([
				
					data.masspecialty,
					data.rank,
					
					'<button type="button" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > Edit</button>',
					'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> Delete</button>'
				]);
				
				$('#addModal').modal('toggle');
				listAll();
			},
			error : function() {
				//alert("ERROR");
				$('#addForm').bootstrapValidator('validate');
			}
		});
	}
	
function getId(abilityid){
		
	if($('#rank1:checked').val()!=null){
			
		rank = $('#rank1:checked').val();
			
		}else if($('#rank2:checked').val()!=null){
			
			rank = $('#rank2:checked').val();
			
		}else if($('#rank3:checked').val()!=null){
			
			rank = $('#rank3:checked').val();
			
		}else if($('#rank4:checked').val()!=null){
			
			rank = $('#rank4:checked').val();
			
		}else if($('#rank5:checked').val()!=null){
			
			rank = $('#rank5:checked').val();
			
		}else if($('#rank6:checked').val()!=null){
			
			rank = $('#rank6:checked').val();
			
		}else if($('#rank7:checked').val()!=null){
			
			rank = $('#rank7:checked').val();
			
		}else if($('#rank8:checked').val()!=null){
			
			rank = $('#rank8:checked').val();
			
		}else if($('#rank9:checked').val()!=null){
			
			rank = $('#rank9:checked').val();
			
		}else if($('#rank10:checked').val()!=null){
			
			rank = $('#rank10:checked').val();
			
		}
		
	
		
		$.ajax({
			
			url : "${pageContext.request.contextPath}/ability/findById/"+ abilityid,
			//data : "id=" + abilityid,
			type : "POST",
			success : function(data) {
				//alert(JSON.stringify(data));
				
				$("#masspecialty").val(data.masspecialtyId);
				rank.val(data.rank);
				employeeId: data.employeeId;
			},
			error : function(data, textStatus, jqXML) {
				{
					alert("error");
				}
				;
			}
		});
	}
	
function updateAbility(button,abilityid) {
	
	if($('#rank1:checked').val()!=null){
			
		rank = $('#rank1:checked').val();
			
		}else if($('#rank2:checked').val()!=null){
			
			rank = $('#rank2:checked').val();
			
		}else if($('#rank3:checked').val()!=null){
			
			rank = $('#rank3:checked').val();
			
		}else if($('#rank4:checked').val()!=null){
			
			rank = $('#rank4:checked').val();
			
		}else if($('#rank5:checked').val()!=null){
			
			rank = $('#rank5:checked').val();
			
		}else if($('#rank6:checked').val()!=null){
			
			rank = $('#rank6:checked').val();
			
		}else if($('#rank7:checked').val()!=null){
			
			rank = $('#rank7:checked').val();
			
		}else if($('#rank8:checked').val()!=null){
			
			rank = $('#rank8:checked').val();
			
		}else if($('#rank9:checked').val()!=null){
			
			rank = $('#rank9:checked').val();
			
		}else if($('#rank10:checked').val()!=null){
			
			rank = $('#rank10:checked').val();
			
		}
		
	var id = getUrlParameter('Id');
	$.ajax({
		url : "${pageContext.request.contextPath}/ability/update",
		data : JSON.stringify({
			id: abilityid,
			masspecialtyId : $("#masspecialty").val(),
			masspecialty : $("#masspecialty option:selected").text(),
			rank : rank,
			//employee : {id:2},
			employeeId: id
		}),
		type : "POST",
		contentType : "application/json",
		dataType : "json",
		success : function(data) {
			//alert(abilityid);
			//alert(JSON.stringify(data));
			
			var tr = button.closest("tr");
			
			dt.fnUpdate(data.masspecialty.name, tr, 0);
			dt.fnUpdate(data.rank, tr, 1 );
			
			//alert(data.masspecialty.name);
			
			$('#addModal').modal('toggle');
			listAll();
		},
		error : function() {
			alert("ERROR");
		}
	});
}
	
function deleteAbility(button,abilityid) {
	
	$.ajax({
		url : "${pageContext.request.contextPath}/ability/delete/"+abilityid,
		//data :"id=" + abilityid,
		type : "POST",
		success : function(data) {
			//alert(JSON.stringify(data));
			
			/* var tr = button.closest("tr");
			
			dt.fnDeleteRow( tr ); */
			
			$('#deleteModal').modal('toggle');
			
			listAll();
		},
		error : function() {
			alert("ERROR");
		}
	
		});
}
function listAll(){
	//var id=2;
	var id = getUrlParameter('Id');
	//alert("id >>>>"+id);	
	$.ajax({
			url : "${pageContext.request.contextPath}/ability/listAll/"+id,
			type : "POST",
			success : function(data) {
				dt.fnClearTable();
			for (var i=0;i< data.length; i++) {
				dt.fnAddData([data[i].masspecialty,
				              data[i].rank,
					'<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
					'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
		
				}
			},
			error : function() {
				alert("ERROR");
			}
		}); 
	}
	
	
 function clearModal(){
		
		$("#masspecialty").val("-1"),
		$("#rank1").prop('checked','checked');
	} 
	
	
 function getUrlParameter(sParam)
{
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
	
	
});
</script>


</body>
</html>

