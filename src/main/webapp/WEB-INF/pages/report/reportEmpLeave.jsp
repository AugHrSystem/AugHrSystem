<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- jQuery -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>

<!-- Bootstrap -->
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>

<!-- Validator -->
<link href="<c:url value="/resource/bootstrapvalidator/dist/css/bootstrapValidator.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrapvalidator/dist/js/bootstrapValidator.js" />"></script>


<!-- jQuery dataTable -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet" media="all">

<!-- dataTable Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>




<style >


body {
background-image: url(${pageContext.request.contextPath}/resource/images/BG_W.jpg);
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: top center !important;
background-repeat: no-repeat !important;
background-attachment: fixed;
} 
</style>
<jsp:include page="../../../decorators/header.jsp"></jsp:include>
<div class="modal-header">
	<h4 class="modal-title"><spring:message code="reportleave.empName" /></h4>
</div>

<%-- <f:form method="post" name="reportForm" target="_blank" commandName="employee" action="${pageContext.request.contextPath}/employee/searchReportEmpLeave" cssClass="form-horizontal"> --%>
<f:form method="post" id="reportForm" name="reportForm" target="_blank" commandName="employee" action="${pageContext.request.contextPath}/employee/searchReportEmpLeave" cssClass="form-horizontal">

	 <div class="modal-body">
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	<spring:message code="reportleave.searchEmpName" />
        		${ searchfor }${ entity }
        	</div>
        	<div class="col-sm-6">
        		<f:input id="searchText" path="nameEng" cssClass="form-control" placeholder="${ searchfor }${ entity }"/>
        	</div>
        </div>
        
         <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	<spring:message code="label.doctype" />
        	</div>
        	<%-- <div class="col-sm-6" >
        		<label class="radio-inline"><f:radiobutton  path="reportType" value="pdf"/>Pdf</label>
				<label class="radio-inline"><f:radiobutton path="reportType" value="xls"/>Xls</label>
        	</div> --%>
        	<div class="col-sm-6" id="reportType">
        		<label class="radio-inline"><f:radiobutton path="reportType" value="pdf" name="reportType"/>Pdf</label>
				<label class="radio-inline"><f:radiobutton path="reportType" value="xls" name="reportType"/>Xls</label>
        	</div>
        </div>
        
        
       <div>  
        <f:form id ="listTable" method="post" commandName="employee" class="form-horizontal" action="employee">		
			<div class="row">
				<!-- <h2 class="col-md-6">Report</h2>	 -->			
				<br>
				<div class="col-md-6" align="right">		
	
				<br>
				<br>
			</div>
			</div>	
		<div>
				<table id="tbResult" class="table" class="form-group">
					<thead>	
						<tr>								
											
							<th><spring:message code="reportleave.resource" /></th>
							<!-- <th>Date Start Work</th> -->
							<th><spring:message code="reportleave.resourcenameth" /></th>
							<th><spring:message code="reportleave.resourcenameen" /></th>
							<th><spring:message code="reportleave.annuallaeve" /></th>
							<th><spring:message code="reportleave.sickleave" /></th>
							<th><spring:message code="reportleave.personalleave" /></th>
							<th><spring:message code="reportleave.totalleave" /></th>
						</tr>
					</thead>		
				</table>
			</div>
		</f:form>
	</div>	
		

      	
      </div>

	<div class="modal-footer">	
		<button type="button" id ="btn_search" class="btn btn-default search" value="search"><spring:message code="label.search" /></button>
		<button type="button" id="btn_print" class="btn btn-default submit" value="print"><spring:message code="label.print" /></button>
		
	</div>
</f:form>
<jsp:include page="../../../decorators/footer.jsp"></jsp:include>

<script type="text/javascript">

$(document).ready(function () {
	var dt=$("#tbResult").dataTable({
		"bLengthChange": false,
		"iDisplayLength": 10,
		"pagingType": "simple_numbers",
		"ordering": false,
		"info": false
});

	  $('#reportForm').bootstrapValidator({
		message: 'This value is not valid',
		 feedbackIcons: {
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	reportType: {
	                validators: {
	                    notEmpty: {
	                        message: '<spring:message code="report.validate.reportType" />'
	                    }
	        
	                }
	            }
	        }
		
	}); 
	
	//Search By Position and Show function 
	$('#btn_search').on('click', function(){
		var searchText = $("#searchText").val();
		if(searchText == ""){
			searchText = "forEmptySearch";
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/employee/searchNameLeave/"+searchText,
			type : "POST",
			success : function(data) {
			dt.fnClearTable();
			for (var i=0;i< data.length; i++) {
				dt.fnAddData([data[i].employeeCode,
				             // data[i].startWorkDate,
				              data[i].nameThai, 
				              data[i].nameEng, 
			                  data[i].dayAnnual,  
				              data[i].daySick,
				              data[i].dayPersonal,
				              data[i].totalDayLeave
				              
					]);
		 
				}
		
			},
			error : function(data,testStatus,jqXHR) {
				$("#outputajax").text(testStatus);
				}
			});
	});
	$('#btn_print').on('click', function(){
		$('#reportForm').bootstrapValidator();
		$('#reportForm').data('bootstrapValidator').validate();
		if($('#reportForm').data('bootstrapValidator').isValid()){
			$("#reportForm").get(0).submit();
		}
/* 		var searchText = $("#searchText").val();
		if(searchText == ""){
			searchText = "forEmptySearch";
		}
  		$.ajax({
		url : "${pageContext.request.contextPath}/employee/searchReportEmpName/"+searchText,
		type : "POST",
		success : function(data) {
			
		},
		error : function(data,testStatus,jqXHR) {
			$("#outputajax").text(testStatus);
			}
		}); */
	}); 
	
});
	
</script>