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

<h2>Ability</h2> 

 <br></br>
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

<form:form id ="addForm" method="post" commandName="ability" >

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
        <h4 class="modal-title" id="myModalLabel">Ability Add</h4>
      </div>
      
     <%--  
      <div class="row" style="text-align: center;">
		<div class="visible-xs col-xs-12">
			<c:choose>
	    			<c:when test="${ empty emp_ability.picture }">
	    				<div id="imagePreview" class="img-rounded img-responsive" style="background-image:url('<c:url value="/resources/images/no_image.gif" />');"></div>
	    			</c:when>
	    			<c:otherwise>
	    				<div id="imagePreview" class="img-rounded img-responsive" style="background-image:url('${pageContext.request.contextPath}/DisplayImageServlet?namespace=ability&fileName=${ability.picture}');"></div>
	    			</c:otherwise>
	    		</c:choose>
		</div>
		</div> --%> 
      
      <div class="modal-body">
        
	<%--   
	 <div class="form-group form-group-sm">
			<label class="col-lg-3 col-md-3 col-sm-3 control-label"><spring:message
					code="label.picture" var="var6" /> ${var6} </label>
			<div class="col col-lg-5 col-md-8 col-sm-8">
					<input name="image"  id="uploadFile" type="file" value="${emp_ability.picture }" accept="image/*" class="file" data-show-upload="false" data-show-preview="false" data-initial-caption="${var6}" data-overwrite-initial="false">
					<input type="hidden" name="picture" class="form-control element-to-paste-filename" value="${emp_ability.picture }"  readonly placeholder="${var6}">
			</div>
		</div> --%>
	  
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
	dt = $('#tbResult').dataTable();
	listAll();
	/* --- addProduct,updateProduct --- */
	
	
	
	$("#addModal").on("show.bs.modal",function(event) {
		
		clearModal();
		
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
		var id = getUrlParameter('Id');
		$.ajax({
			url : "${pageContext.request.contextPath}/ability/add",
			data : JSON.stringify({
				masspecialtyId : $("#masspecialty").val(), 
				masspecialty : $("#masspecialty option:selected").text(),
				rank : $("#rank").val(),
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
				alert("ERROR");
			}
		});
	}
	
function getId(abilityid){
		
		
		$.ajax({
			
			url : "${pageContext.request.contextPath}/ability/findById/"+ abilityid,
			//data : "id=" + abilityid,
			type : "POST",
			success : function(data) {
				//alert(JSON.stringify(data));
				
				$("#masspecialty").val(data.masspecialtyId);
				$("#rank").val(data.rank);
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
/* alert("fn up"); */
	var id = getUrlParameter('Id');
	$.ajax({
		url : "${pageContext.request.contextPath}/ability/update",
		data : JSON.stringify({
			id: abilityid,
			masspecialtyId : $("#masspecialty").val(),
			masspecialty : $("#masspecialty option:selected").text(),
			rank : $("#rank").val(),
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
		$("#rank").val("");
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