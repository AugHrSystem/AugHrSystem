<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jsp:include page="../employeeMenu.jsp"></jsp:include>

<style>
.required:after {
  margin-bottom: 0px;
  content:"*";
  color:red;
}
</style>

<input id="empId" type="hidden" value="${id}">

<form:form id ="listForm" method="post" commandName="education" action="education">

<div class="row">
<div class="col-md-6">
<h2><spring:message code="education.name" /></h2>
</div>
<!-- Button trigger modal -->
<br>
<div class="form-group" align="right">
<div class="col-md-6">
<button type="button" id="addBtnEdu" class="btn btn-info btnAdds" data-toggle="modal" data-target="#addModal"><spring:message code="label.newRecord" /></button> 
</div>
</div>
</div>

<!-- Table -->
<div class="form-group">
<table id="tbResult" class="table">
	<thead>
		<tr>
			<th><spring:message code="education.start.date" /></th>
			<th><spring:message code="education.finish.date" /></th>
			<th><spring:message code="education.deegreetype" /></th>
			<th><spring:message code="education.university" /></th>
			<th><spring:message code="education.major" /></th>
			<th><spring:message code="label.action" /></th>
			<!-- <th></th> -->
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="education">

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="education.name" /> </h4>
      </div>
      
      <div class="modal-body row">
   		
   		<spring:message code="default.date" var="date"/>
   		<spring:message code="default.enter" var="enter"/>
   		
   	  <div class="form-group col-md-6">
	    <label class="required"><spring:message code="education.start.date" /> :</label>
	    <div class='input-group date' id='datetimepickerStart'>
	    <form:input path="startDate" type="text" class="form-control" id="startDate" placeholder="${date}"/>
	    <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
	    </div>
	   </div> 
	   
	   <div class="form-group col-md-6">
	    <label class="required"><spring:message code="education.finish.date" /> :</label>
	    <div class='input-group date' id='datetimepickerGrad'>
	    <form:input path="graduatedDate" type="text" class="form-control" id="graduatedDate" placeholder="${date}"/>
	    <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
        </div>
	  </div>
	  
	  <div class="form-group col-md-6">
	    <label class="required"><spring:message code="education.university" var="university"/>${university} :</label>
	    <form:input path="university" type="text" class="form-control" id="university" placeholder="${enter}${university}"/>
	  </div>
	  
	  
	  
	  <div class="form-group col-md-6">
	    <label class="required"><spring:message code="education.major" var="major"/>${major} :</label>
	    <form:input path="major" type="text" class="form-control" id="major" placeholder="${enter}${major}"/>
	  </div>
	  
	  <div class="form-group col-md-12">
	    <label class="required"><spring:message code="education.faculty" var="faculty"/>${faculty} :</label>
	    <form:input path="faculty" type="text" class="form-control" id="faculty" placeholder="${enter}${faculty}"/>
	  </div>
	  
	  <div class="form-group col-md-12">
	    <label class="required"><spring:message code="education.deegreetype" /> :</label>
	    
		  <%-- <form:select path="masdegreetype" class="form-control"
			id="masdegreetype">
			<form:option value="-1" label="---Select Degree---" />
			<c:forEach var="obj" items="${ masdegreetypeList }">
				<option value="${obj.id }">${ obj.name}</option>
			</c:forEach>
		</form:select> --%>
		<form:select  id="masdegreetype" path="masdegreetype" cssClass="form-control">
<%-- 		<form:option value="-1" label="--- Select  Degreetype ---"/> --%>
		<option value=""><spring:message code="education.enter.deegreetype" /></option>
	    <form:options items="${masdegreetypeList}" itemValue="id" itemLabel="name"/>
	    </form:select>
	    
	  </div>
	  
	   <div class="form-group col-md-6">
	    <label><spring:message code="education.gpa" var="gpa"/>${gpa} :</label>
	    <form:input path="gpa" type="text" class="form-control" id="gpa" placeholder="${enter}${gpa}"/>
	  </div>
	  
	  <div class="form-group col-md-6">
	    <label><spring:message code="education.certification" var="certification"/>${certification} :</label>
	    <form:input path="certificate" type="text" class="form-control" id="certificate" placeholder="${enter}${certification}"/>
	  </div>
	  
	  <div class="form-group col-md-12">
	    <label><spring:message code="education.description" var="description"/>${description} :</label>
	    <form:input path="description" type="text" class="form-control" id="description" placeholder="${enter}${description}"/>
	  </div>
	  
      </div>
      
      <div class="form-group" align="center">
        <button type="button" class="btn btn-default btnClose" data-dismiss="modal"><spring:message code="label.close" /></button>
      	<button type="button" class="btn btn-info btnSave"><spring:message code="label.save" /></button>
      </div>
      
    </div>
  </div>
</div>

</form:form>

<form:form id="deleteForm" commandName="education" method="post">

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
						<h4 class="modal-title" id="myModalLabel"><spring:message code="education.name" /></h4>
					</div>
					<div class="modal-body">
						<h4><spring:message code="default.delete.confirm" /></h4>
						<form:hidden path="id"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger btnYes"><spring:message code="default.yes" /></button>
						<button type="button" class="btn btn-info" data-dismiss="modal"><spring:message code="default.no" /></button>
					</div>
				</div>
			</div>
		</div>

</form:form>


<script type="text/javascript">

	var dt;
	
	$(document).ready(function(){

		$("#addBtnEdu").on("click",function(){clearModal();});
		
		$('#addForm').bootstrapValidator({
//	        live: 'disabled',
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	startDate: {
	                validators: {
	                    notEmpty: {
	                        message: '<spring:message code="education.required.start.date" />'
	                    },
	                    date: {
	                        format: 'DD-MM-YYYY'
	                    }
	                }
	            },
	            graduatedDate: {
	                validators: {
	                    notEmpty: {
	                        message: '<spring:message code="education.required.finish.date" />'
	                    },
	                    date: {
	                        format: 'DD-MM-YYYY'
	                    }
	                }
	            },
	            university: {
	                validators: {
	                    notEmpty: {
	                        message: '<spring:message code="education.required.university" />'
	                    }
	                }
	            },
	            faculty: {
	                validators: {
	                    notEmpty: {
	                        message: '<spring:message code="education.required.faculty" />'
	                    }
	                }
	            },
	            major: {
	                validators: {
	                    notEmpty: {
	                        message: '<spring:message code="education.required.major" />'
	                    }
	                }
	            },
	            masdegreetype: {
	                validators: {
	                    notEmpty: {
	                        message: '<spring:message code="education.required.deegreetype" />'
	                    }
	                }
	            },
	            /* adjustmentTime: {
	                validators: {
	                    notEmpty: {
	                        message: 'The adjustment time is required and cannot be empty'
	                    },
	                    digits: {
	                    	message: 'The adjustment time is number'
	                    },
	                }
	            } */
	        }
	    });
		
		$('#datetimepickerStart')
        .on('dp.change dp.show', function(e) {
            // Validate the date when user change it
            $('#addForm')
                // Get the bootstrapValidator instance
                .data('bootstrapValidator')
                // Mark the field as not validated, so it'll be re-validated when the user change date
                .updateStatus('startDate', 'NOT_VALIDATED', null)
                // Validate the field
                .validateField('startDate');
        });
		
		$('#datetimepickerGrad')
        .on('dp.change dp.show', function(e) {
            // Validate the date when user change it
            $('#addForm')
                // Get the bootstrapValidator instance
                .data('bootstrapValidator')
                // Mark the field as not validated, so it'll be re-validated when the user change date
                .updateStatus('graduatedDate', 'NOT_VALIDATED', null)
                // Validate the field
                .validateField('graduatedDate');
        });
// 		$('#startDate')
//         .on('dp.change dp.show', function(e) {
//             // Validate the date when user change it
//             $('#addForm')
//                 // Get the bootstrapValidator instance
//                 .data('bootstrapValidator')
//                 // Mark the field as not validated, so it'll be re-validated when the user change date
//                 .updateStatus('datetimepickerStart', 'NOT_VALIDATED', null)
//                 // Validate the field
//                 .validateField('startDate');
//         });
		$('#datetimepickerStart').datetimepicker({
			 
			 format : 'DD-MM-YYYY',
// 			 minDate: 'moment'
			 
		 });
		
		$('#datetimepickerGrad').datetimepicker({
			 
			 format : 'DD-MM-YYYY',
// 			 minDate: 'moment'
			 
		 });
		
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
			var educationid = button.data("id") //Extract info from data-* attribute
			
			if(educationid != null){
				getId(educationid);
			} 
			
			$(this).find(".btnSave").off("click").on("click",function() {
				if(educationid != null){
					$('#addForm').bootstrapValidator();
    				$('#addForm').data('bootstrapValidator').validate();
    				if($('#addForm').data('bootstrapValidator').isValid()){
						updateEducation(button, educationid);
    				}
				}else{
					$('#addForm').bootstrapValidator();
    				$('#addForm').data('bootstrapValidator').validate();
    				if($('#addForm').data('bootstrapValidator').isValid()){
						addEducation();
    				}
				 }
				
			});
			
			$(this).find(".btnClose").off("click").on("click",function() {
				$('#addForm').bootstrapValidator('resetForm', true);
			});
			
		});
		
		/* --- DeleteName --- */
		$("#deleteModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var educationid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".btnYes").off("click").on("click",function() {
				deleteEducation(button, educationid);
			});
			
		});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */

		function clearModal(){
			$("#university").val(""),
			$("#gpa").val(""),
			$("#faculty").val(""),
			$("#major").val(""),
			$("#masdegreetype").val("");
			$("#certificate").val("");
			$("#description").val("");
			$("#startDate").val("");
			$("#graduatedDate").val("");
		}
		
		function addEducation(){
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/education/add",
				data : JSON.stringify({
					university :$("#university").val(),
					gpa :$("#gpa").val(),
					faculty :$("#faculty").val(),
					major :$("#major").val(),
					masDegreeTypeId :$("#masdegreetype").val(),
					masdegreetype :$("#masdegreetype option:selected").text(),
					certificate :$("#certificate").val(),
					description :$("#description").val(),
					startDate :$("#startDate").val(),
					graduatedDate :$("#graduatedDate").val(),
					employeeId : id
					
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
					
					$('#addForm').bootstrapValidator('resetForm', true);

//	 				alert(JSON.stringify(data));
						
// 					dt.fnClearTable();
					
// 					dt.fnAddData([
// 						/* $("#Name").val(),
// 						$("#ProductCategory").val(),
// 						$("#Unit").val(),
// 						$("#Price").val(),
// 						$("#Description").val(), */
// 						data.university,
// 						data.gpa,
// 						data.faculty,
// 						data.major,
// 						data.masdegreetype,
// 						data.certificate,
// 						data.description,
// 						data.startDate,
// 						data.graduatedDate,
						
// 						'<button type="button" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > Edit</button>',
// 						'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> Delete</button>'
// 					]);
					
					$('#addModal').modal('toggle');
					listAll();
					
				},
				error : function() {
					alert("ERROR");
// 					$('#addForm').bootstrapValidator('validate');

				}
			});
		}
		
		function updateEducation(button, educationid){
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/education/update",
				data : JSON.stringify({
					id : educationid,
					university : $("#university").val(),
					gpa :$("#gpa").val(),
					faculty :$("#faculty").val(),
					major :$("#major").val(),
					masDegreeTypeId :$("#masdegreetype").val(),
					masdegreetype :$("#masdegreetype option:selected").text(),
					certificate :$("#certificate").val(),
					description :$("#description").val(),
					startDate :$("#startDate").val(),
					graduatedDate :$("#graduatedDate").val(),
					employeeId : id
					
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
//	 					alert(JSON.stringify(data));
					$('#addForm').bootstrapValidator('resetForm', true);

					/* var tr = button.closest("tr")
					
					dt.fnUpdate(data.university, tr ,0);
					dt.fnUpdate(data.gpa, tr ,1);
					dt.fnUpdate(data.faculty, tr ,2);
					dt.fnUpdate(data.major, tr ,3);
					dt.fnUpdate(data.masdegreetype, tr ,4);
					dt.fnUpdate(data.certificate, tr ,5);
					dt.fnUpdate(data.description, tr ,6);
					dt.fnUpdate(data.startDate, tr ,7);
					dt.fnUpdate(data.graduatedDate, tr ,8); */
					
					$('#addModal').modal('toggle');
					listAll();
				},
				error : function() {
					alert("ERROR");
// 					$('#addForm').bootstrapValidator('validate');

				}
			});
		}
		
		function getId(educationid){
			$.ajax({
				url : "${pageContext.request.contextPath}/education/findById",
				data : "educationid=" + educationid,
				type : "POST",
				success : function(data) {
	 				//alert(JSON.stringify(data));
					//alert("ok");
					$("#university").val(data.university),
					$("#gpa").val(data.gpa),
					$("#faculty").val(data.faculty),
					$("#major").val(data.major);
					$("#masdegreetype").val(data.masDegreeTypeId);
					$("#certificate").val(data.certificate);
					$("#description").val(data.description);
					$("#startDate").val(data.startDate);
					$("#graduatedDate").val(data.graduatedDate);
					
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function deleteEducation(button, educationid){
			$.ajax({
				url : "${pageContext.request.contextPath}/education/delete",
				data : "educationid=" + educationid,
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
		
		function listAll(){
// 			var id=1;
// 			var id = getUrlParameter('Id');
			//alert("id"+id);
			var id = $("#empId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/education/listAll/"+id,
				type : "POST",
				success : function(data) {
					dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([
								  data[i].startDate,
								  data[i].graduatedDate,
								  data[i].masdegreetype,
					              data[i].university,
					              data[i].major,
						 '<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal"><spring:message code="label.edit" /></button>'+
						'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal"><spring:message code="label.delete" /></button>']);
			 
			 
			 
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

