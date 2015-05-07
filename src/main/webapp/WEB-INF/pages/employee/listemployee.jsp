<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>

<!-- Date Picker -->
<script src="<c:url value="/resource/datepicker/js/bootstrap-datepicker.js" />"></script>
<link href="<c:url value="/resource/datepicker/css/datepicker.css" />" rel="stylesheet" media="all">

<!-- Data Table -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet">

<title>Experience</title>
</head>
<body>
<f:form method="post" commandName="experience" class="form-horizontal" role="form">
	<div class="container">
		<ol class="breadcrumb">
			<li role="presentation" class="active"><a href="#">Home</a></li>
 			<li role="presentation"><a href="#addModal" data-toggle="modal">Add Experience</a></li>
		</ol>
		<h2>Experience</h2>
		<div id="message"></div>
		<div id="outputajax" class="form-group">		
		<table id="tdResult">
			<thead>
				<tr>
					<th>Id</th>
					<th>Code</th>
					<th>Firstname</th>
					<th>Surname</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		</div>
</f:form>			
	<!-- Button trigger modal -->
	<div align="right">
		<button type="button" class="btn btn-primary btn-md addEmployee">
 	 	Add
		</button>
	</div>
</div>			
		

<!-- Modal Delete -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title" id="deleteModalLabel">Delete Employee</h4>
      </div>
      <div class="modal-body">
      	Do you want to delete employee ?
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
      <button type="button" class="btn btn-primary yesButton">Yes</button>
      </div>
    </div>
  </div>
</div>

<script>
var dt;
	$(document).ready(function() {
    	dt=$("#tdResult").dataTable();
 		listAll();
		
     	$("#addModal").on("show.bs.modal", function(event){
    		var button = $(event.relatedTarget);
    		var empId = button.data("empid"); 
    		if(expId != null){
				initEditEmployee(empId);
			}
     	
    		
    		
    		function editEmployee() {
    			alert(empId+" edit");
				$.ajax({
					url : "employee.jsp",
					type : "POST",
					datatype: "json",
					contentType: "application/json",
					success : function(data) {
						$("#message").html('<div class="alert alert-success" role="alert">Success</div>');
						/* dt.fnClearTable();
    					dt.fnAddData([
    					       data.id,
    					       data.employeeCode,
    					       data.nameThai,
    					       data.surnameThai,
    					       data.nicknameThai,
    					       data.nameEng,
    					       data.surnameEng,
    					       data.nicknameEng,
    					       data.telHome,
    					       data.telMobile,
    					       data.telFax,
    					       data.emergencyContact,
    					       data.relationshipWithEmergencyContact,
    					       data.emergencyContactAddress,
    					       data.emergencyContactPhoneNumber,
    					       data.dateOfBirth,
    					       data.placeOfBirth,
    					       data.age,
    					       data.religion,
    					       data.idCard,
    					       data.issuedOffice,
    					       data.expiryDate,
    					       data.height,
    					       data.weigth,
    					       data.sex,
    					       data.maritalStatus,
    					       data.numberOfChildren,
    					       data.spouseName,
    					       data.marriageCertificateNo,
    					       data.issuedOffice2,
    					       data.address,
    					       data.occupation,
    					       data.knowAugNewspaper,
    					       data.descriptionNewspaper,
    					       data.knowAugMagazine,
    					       data.descriptionMagazine,
    					       data.knowAugWebsite,
    					       data.descriptionWebsite,
    					       data.knowAugFriend,
    					       data.descriptionFriend,
    					       data.knowAugOther,
    					       data.descriptionOther,
    					       data.knowEmployedYes,
    					       data.descriptionYes,
    					       data.knowEmployerNo,
    					       data.militaryServiceYes,
    					       data.fromYear,
    					       data.toYear,
    					       data.branchOfService,
    					       data.serviceNo,
    					       data.militaryServiceNo,
    					       data.reasonsNo,
    					       data.dateToBeDrafted,
    					       data.previousEmployerYes,
    					       data.previousEmployerNo,
    					       data.previousEmpreasonsNo,
    					       
    					    '<button type="button" class="btn btn-info btn-sm active" data-empId="' + data.id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
   	    					'<button type="button" class="btn btn-danger btn-sm active" data-empId="' + data.id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>'
    					              
						]);               */
						listAll();
					},
					error : function(data,testStatus,jqXHR) {
						
						$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
						}
					});
			}
    		function initEditEmployee(empId) {
				alert(empId+" Init edit");
				$.ajax({
					url : "${pageContext.request.contextPath}/employee/initEdit/"+empId,
					type : "POST",
					success : function() {
						/* $("#nameThai").val(data.nameThai);
						$("#surnameThai").val(data.surnameThai);
						$("#nicknameThai").val(data.nicknameThai);
						$("#nameEng").val(data.nameEng);
						$("#surnameEng").val(data.surnameEng);
						$("#nicknameEng").val(data.nicknameEng);
						$("#telHome").val(data.telHome);
						$("#telMobile").val(data.telMobile);
						$("#telFax").val(data.telFax);
						$("#emergencyContact").val(data.emergencyContact);
						$("#relationshipWithEmergencyContact").val(data.relationshipWithEmergencyContact);
						$("#emergencyContactAddress").val(data.emergencyContactAddress);
						$("#emergencyContactPhoneNumber").val(data.emergencyContactPhoneNumber);
						$("#dateOfBirth").val(data.dateOfBirth);
						$("#placeOfBirth").val(data.placeOfBirth);
						$("#age").val(data.age);
						$("#religion").val(data.religion);
						$("#idCard").val(data.idCard);
						$("#issuedOffice").val(data.issuedOffice);
						$("#expiryDate").val(data.expiryDate);
						$("#height").val(data.height);
						$("#weigth").val(data.weigth);
						$("#sex").val(data.sex);
						$("#maritalStatus").val(data.maritalStatus);
						$("#numberOfChildren").val(data.numberOfChildren);
						$("#spouseName").val(data.spouseName);
						$("#marriageCertificateNo").val(data.marriageCertificateNo);
						$("#issuedOffice2").val(data.issuedOffice2);
						$("#address").val(data.address);
						$("#occupation").val(data.occupation);
						$("#knowAugNewspaper").val(data.knowAugNewspaper);
						$("#descriptionNewspaper").val(data.descriptionNewspaper);
						$("#knowAugMagazine").val(data.knowAugMagazine);
						$("#descriptionMagazine").val(data.descriptionMagazine);
						$("#knowAugWebsite").val(data.knowAugWebsite);
						$("#descriptionWebsite").val(data.descriptionWebsite);
						$("#knowAugFriend").val(data.knowAugFriend);
						$("#descriptionFriend").val(data.descriptionFriend);
						$("#knowAugOther").val(data.knowAugOther);
						$("#descriptionOther").val(data.descriptionOther);
						$("#knowEmployedYes").val(data.knowEmployedYes);
						$("#descriptionYes").val(data.descriptionYes);
						$("#knowEmployerNo").val(data.knowEmployerNo);
						$("#militaryServiceYes").val(data.militaryServiceYes);
						$("#fromYear").val(data.fromYear);
						$("#toYear").val(data.toYear);
						$("#branchOfService").val(data.branchOfService);
						$("#serviceNo").val(data.serviceNo);
						$("#militaryServiceNo").val(data.militaryServiceNo);
						$("#reasonsNo").val(data.reasonsNo);
						$("#dateToBeDrafted").val(data.dateToBeDrafted);
						$("#previousEmployerYes").val(data.previousEmployerYes);
						$("#previousEmployerNo").val(data.previousEmployerNo);
						$("#previousEmpreasonsNo").val(data.previousEmpreasonsNo);
						 */
						editEmployee(); 
		
					},
					error : function(data,testStatus,jqXHR) {
						$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
						}
					});
			}
			
			
	
/* --------------------------------------------------- Delete Function --------------------------------------------------- */		
			
			$("#deleteModal").on("show.bs.modal", function(event){
				var button = $(event.relatedTarget);
				var empId = button.data("empid");
				alert("delete "+empId);
				$(this).find(".yesButton").off("click").on("click", function()
						{
							deleteEmployee(button,empId);
							alert("go fn");
						});
				
				function deleteEmployee(button,empId){
					alert("in fn");
					$.ajax({
						url : "${pageContext.request.contextPath}/employee/delete/"+empId,
						type : "POST",
						success : function(data) {
							$('#deleteModal').modal('toggle');
							$("#message").html('<div class="alert alert-success" role="alert">Success</div>');		
						},
						error : function(data,testStatus,jqXHR) {
							$('#deleteModal').modal('toggle');
							$("#message").html('<div class="alert alert-danger" role="alert">Error</div>');
							}
						});
				}
    		   	
			
  	});
  	
			
			function listAll(){
				$.ajax({
					url : "${pageContext.request.contextPath}/employee/listAll",
					type : "POST",
					success : function(data) {
						dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([data[i].id,data[i].employeeCode,data[i].nameEng, 
						              data[i].surnameEng,
							'<button type="button" class="btn btn-info btn-sm active" data-empId="' + data[i].id + '" data-target="editEmployee()" data-toggle="modal">Edit</button>',
							'<button type="button" class="btn btn-danger btn-sm active" data-empId="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
				
						}
					},
					error : function(data,testStatus,jqXHR) {
						$("#outputajax").text(testStatus);
						}
					}); 
			}
    	
  	});
     	
	});
  
  </script>
</body>
</html>