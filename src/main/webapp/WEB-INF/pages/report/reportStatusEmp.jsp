<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 class="modal-title"><spring:message code="reportstatus.empName" /></h4>
</div>
<f:form method="post" name="reportForm" target="_blank" commandName="employee" action="${pageContext.request.contextPath}/employee/searchEmpStatusReport" cssClass="form-horizontal">

	 <div class="modal-body">
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	<spring:message code="reportstatus.searchEmpName" />
        		${ searchfor }${ entity }
        	</div>
        	<div class="col-sm-6">
        		<f:input id="searchText" path="masStaffType.name" cssClass="form-control" placeholder="${ searchfor }${ entity }"/>
        	</div>
        </div>
        
         <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	<spring:message code="label.doctype" />
        	</div>
        	<div class="col-sm-6">
        		<label class="radio-inline"><f:radiobutton  path="reportType" value="pdf"/>Pdf</label>
				<label class="radio-inline"><f:radiobutton path="reportType" value="xls"/>Xls</label>
        	</div>
        </div>
        
        
       <div>  
        <f:form id ="tbResult" method="post" commandName="employee" class="form-horizontal" action="employee">		
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
							<th><spring:message code="reportstatus.resource" /></th>
							<th><spring:message code="reportstatus.datestartwork" /></th>
							<th><spring:message code="reportstatus.durationy" /></th>
							<th><spring:message code="reportstatus.durationm" /></th>
							<th><spring:message code="reportstatus.durationd" /></th>
							<th><spring:message code="reportstatus.birthdate" /></th>
							<th><spring:message code="reportstatus.agey" /></th>
							<th><spring:message code="reportstatus.agem" /></th>
							<th><spring:message code="reportstatus.aged" /></th>
							<th><spring:message code="reportstatus.resourcenameth" /></th>
							<th><spring:message code="reportstatus.resourcenameen" /></th>
							<th><spring:message code="reportstatus.statusstaff" /></th>
							<th><spring:message code="reportstatus.startdate" /></th>
							<th><spring:message code="reportstatus.enddate" /></th>
						</tr>
					</thead>		
				</table>
			</div>
		</f:form>
	</div>	
		

      	
      </div>

	<div class="modal-footer">
		<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
		<button type="button" class="btn btn-default search" value="search" id="btn_search"><spring:message code="label.search" /></button>
		<button type="button" class="btn btn-default submit" value="print" id="btn_print"><spring:message code="label.print" /></button>
			
		<%-- href="<%=request.getContextPath()%>/employee/searchReportEmpStatus" --%>
	</div>
</f:form>

<%-- <c:if test="${!empty employeeList }">
<c:forEach items="${ employeeList}" varStatus="i" var="reportStatusEmployeeDto">
${reportStatusEmployeeDto.employeeCode}

</c:forEach>
</c:if> --%>









<script type="text/javascript">
	$(document).ready(function() {
	  
		  
		$('#btn_search').on('click', function(){
			var searchText = $("#searchText").val();
			if(searchText == ""){
				searchText = "forEmptySearch";
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/employee/searchEmpStatusByStatus/"+searchText,
				type : "POST",
				success : function(data) {
				dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([data[i].employeeCode,
					              data[i].startWorkDate,		
					              data[i].yearwork, 
					              data[i].monthwork, 
					              data[i].daywork, 
					              data[i].dateOfBirth, 
					              data[i].year, 
					              data[i].month, 
					              data[i].day, 
					              data[i].nameThai, 
					              data[i].nameEng, 
					              data[i].statusStaff, 
					              data[i].startDate, 
					              data[i].endDate, 
						]);
			 
					}
				},
				error : function(data,testStatus,jqXHR) {
					$("#outputajax").text(testStatus);
					}
				});
		});
		
		
	 
		 $('#btn_print').on('click', function(){
		 		$("form[name='reportForm']").submit();
		  		$.ajax({
		 		url : "${pageContext.request.contextPath}/employee/searchEmpStatusReport",
		 		type : "POST"
		 		});
		 	});
		 	
	

	 

	$('#tbResult').dataTable({ 
		"bLengthChange": false,
		"iDisplayLength": 10,
		"pagingType": "simple_numbers",
		"ordering": false,
		"info": false
	});
	

	dt = $('#tbResult').dataTable();	
	// listAll();
	 
	 


	/* function listAll(){

		$.ajax({
			url : "${pageContext.request.contextPath}/employee/searchEmpStatusReport",
			type : "POST",
			success : function(data) {
			dt.fnClearTable();
			for (var i=0;i< data.length; i++) {
				dt.fnAddData([data[i].employeeCode, 
				              data[i].startWorkDate,		
				              data[i].daywork, 
				              data[i].dateOfBirth, 
				              data[i].age, 
				              data[i].nameThai, 
				              data[i].nameEng, 
				              data[i].statusStaff, 
				              data[i].startDate, 
				              data[i].endDate, 
				   			]);
		
				}
			},
			error : function(jqXHR,	textStatus,	error) {	
						alert("error");
				}
			}); 
		} */
	
	
	
	});
	
	
</script>

	 
	 
	 
</script>