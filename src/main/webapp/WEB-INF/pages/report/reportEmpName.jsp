<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-header">
	<h4 class="modal-title">Employee Name Report</h4>
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
				<table id="tdResult" class="table" class="form-group">
					<thead>	
						<tr>								
							<th>Resource ID.</th>
							<th>Date Start Work</th>
							<th>Resource Name(TH)</th>
							<th>Resource Name(EN)</th>
							<th>Type</th>
							<th>Position</th>
							<th>Skill</th>
						</tr>
					</thead>		
				</table>
			</div>
		</f:form>
	</div>	
		

      	
      </div>

	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="button" id="btn_print" class="btn btn-default submit" value="print">Print</button>
		<button type="button" id ="btn_search" class="btn btn-default search" value="search">Search</button>
	</div>
</f:form>


<script type="text/javascript">
$(document).ready(function () {
	var dt=$("#tdResult").dataTable();

	
	//Search By Position and Show function 
	$('#btn_search').on('click', function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/report/searchName",
			/* data: "id="+getUrlParameter('Id'), */
			type : "POST",
			success : function(data) {
			dt.fnClearTable();
			for (var i=0;i< data.length; i++) {
				dt.fnAddData([data[i].employeeCode,data[i].dateOfBirth,
				              data[i].nameThai,data[i].nameEng,
				              data[i].employmentName,data[i].divisionName,
				              data[i].technologyName
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
		url : "${pageContext.request.contextPath}/employee/searchReportEmpName",
		type : "POST"
		});
	});
	
});
	
</script>