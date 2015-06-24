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
		<button type="button" class="btn btn-default submit" value="search">Print</button>
		<button type="button" class="btn btn-default print" value="print">Search</button>
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
	var dtReport;

	
	//Search By Position and Show function 
	$('#btn_search').on('click', function(){
		if(dtReport){
			dtReport.ajax.reload();
		}else{
			dtReport = $('#reportTable').DataTable({
				searching : false,
				paging: false,
				ajax : {
					type:'POST',
					url: '${pageContext.request.contextPath}/report/search',
					data: function (d) {/* 
						d.position = $('#inputPosition').val();
						d.degree = $('#inputDegree').val();
						d.major = $('#inputMajor').val();
						d.schoolName = $('#inputSchoolName').val();
						d.gpa = $('#inputGpa').val(); */
					},
				},
			columns : [
			           {"data": "code"},
				       {"data": "applyDate"},
				       {"data": "firstNameEN"},
				       {"data": "positionName1"},
				       {"data": "positionName2"},
				       {"data": "positionName3"},
				       {"data": "schoolName"},
				       {"data": "degree"},
				       {"data": "gpa"},
				       ]
			});
		}
		});
	$('#btn_search').trigger("click");
	
	});
	
</script>

	 
	 
	 
</script>