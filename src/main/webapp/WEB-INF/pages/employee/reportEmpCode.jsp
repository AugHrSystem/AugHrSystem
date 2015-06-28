<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-header">
	<h4 class="modal-title">Employee Code Report</h4>
</div>
<f:form method="post" name="reportForm" target="_blank" commandName="employee" action="${pageContext.request.contextPath}/employee/searchReportEmpCode" cssClass="form-horizontal">

	 <div class="modal-body">
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Search by Employee Code
        	</div>
        	<div class="col-sm-6">
        		<f:input id="searchText" path="nameEng" cssClass="form-control" placeholder="Search Employee Code"/>
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
				<table id="tdResult" class="table" class="form-group">
					<thead>	
						<tr>								
							<th>Resource ID.</th>
							<th>Date Start Work</th>
							<th>Duration (Y)</th>
							<th>Duration (M)</th>
							<th>Duration (D)</th>
							<th>Birth Date</th>
							<th>Age (Y)</th>
							<th>Age (M)</th>
							<th>Age (D)</th>
							<th>Resource Name(TH)</th>
						</tr>
					</thead>		
				</table>
			</div>
		</f:form>
	</div>	
		

      	
      </div>

	<div class="modal-footer">
		<button type="button" id="btn_print" class="btn btn-default submit" value="print">Print</button>
		<button type="button" id ="btn_search" class="btn btn-default search" value="search">Search</button>
	</div>
</f:form>


<script type="text/javascript">
$(document).ready(function () {
	var dt=$("#tdResult").dataTable();

	
	//Search By Position and Show function 
	$('#btn_search').on('click', function(){
		var searchText = $("#searchText").val();
		if(searchText == ""){
			searchText = "forEmptySearch";
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/employee/searchNameCode/"+searchText,
			type : "POST",
			success : function(data) {
			dt.fnClearTable();
			for (var i=0;i< data.length; i++) {
				dt.fnAddData([data[i].employeeCode,
				              data[i].dateOfBirth,
				              data[i].year,
				              data[i].month,
				              data[i].day,
				              data[i].dateOfBirth,
				              data[i].year,
				              data[i].month,
				              data[i].day,
				              data[i].nameThai
					]);
		 
				}
			},
			error : function() {
				alert("Error");
				}
			});
	});
	$('#btn_print').on('click', function(){
		$("form[name='reportForm']").submit();
	}); 
	
});
	
</script>