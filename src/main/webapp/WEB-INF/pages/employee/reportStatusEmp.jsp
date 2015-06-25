<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 class="modal-title">Employee Status Report</h4>
</div>
<f:form method="post" name="reportForm" target="_blank" commandName="employee"  cssClass="form-horizontal">

	 <div class="modal-body">
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Search
        		${ searchfor }${ entity }
        	</div>
        	<div class="col-sm-6">
        		<f:input id="name" path="name" cssClass="form-control" placeholder="${ searchfor }${ entity }"/>
        	</div>
        </div>
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Order By
        	</div>
        	<div class="col-sm-6">
        		<f:select id="sortingBy" path="sortingBy" cssClass="form-control">
        			<f:option value="nameEng">Employee Name</f:option>
        		</f:select>
        	</div>
        </div>
        
         <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Document Type
        	</div>
        	<div class="col-sm-6">
        		<label class="radio-inline"><f:radiobutton  path="reportType" value="pdf"/>Pdf</label>
				<label class="radio-inline"><f:radiobutton path="reportType" value="xls"/>Xls</label>
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
							<th>Resource ID.</th>
							<th>Date Start Work</th>
							<th>Duration (work)</th>
							<th>Birth Date</th>
							<th>AGE</th>
							<th>Resource Name(TH)</th>
							<th>Resource Name(EN)</th>
							<th>Status</th>
							<th>StartDate</th>
							<th>EndDate</th>
						</tr>
					</thead>		
				</table>
			</div>
		</f:form>
	</div>	
		

      	
      </div>

	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="button" class="btn btn-default" value="search" id="btn_search">Search</button>
		<button type="button" class="btn btn-default" value="print" id="printreport">Print</button>
		
	</div>
</f:form>

<%-- <c:if test="${!empty employeeList }">
<c:forEach items="${ employeeList}" varStatus="i" var="reportStatusEmployeeDto">
${reportStatusEmployeeDto.employeeCode}

</c:forEach>
</c:if> --%>







<!--  ก๊อปมาวางใหม่ ยังไม่ได้แก้อะไรเลยนะอันเก่าลบไปแล้ว -->


<script type="text/javascript">
$(document).ready(function () {
	
	
	
	$('#tbResult').dataTable({ 
		"bLengthChange": false,
		"iDisplayLength": 10,
		"pagingType": "simple_numbers",
		"ordering": false,
		"info": false
	});
	

	dt = $('#tbResult').dataTable();	
	 listAll();
		 
	
	
	function listAll(){

		$.ajax({
			url : "${pageContext.request.contextPath}/employee/searchEmpStatus",
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
				              data[i].statusemp, 
				              data[i].startDate, 
				              data[i].endDate, 
				   			]);
		
				}
			},
			error : function(jqXHR,	textStatus,	error) {	
						alert("error");
				}
			}); 
		}
	
	
	
	});
	
</script>

	 
	 
	 
</script>