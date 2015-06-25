<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h4 class="modal-title">Employee Code Report</h4>

<f:form method="post" name="reportForm" target="_blank" commandName="employee"  cssClass="form-horizontal">

	 <div class="modal-body">
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Search
        	</div>
        	<div class="col-sm-6">
        		<f:input id="name" path="name" cssClass="form-control" placeholder="Search"/>
        	</div>
        </div>
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Order By
        	</div>
        	<div class="col-sm-6">
        		<f:select id="sortingBy" path="sortingBy" cssClass="form-control">
        			<f:option value="nameEng">Employee Code</f:option>
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
        
        
       <!-- Table -->
		<div class="form-group">
		<table id="tbResult" class="table">
			<thead>
				<tr>
					<th>Resource ID.</th>
<!-- 					<th>Date Start Work</th> -->
<!-- 					<th>Duration (work)</th> -->
					<th>Birth Date</th>
<!-- 					<th>AGE</th> -->
					<th>Resource Name(TH)</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		</div>	
		

      	
      </div>

	<div  align="right">
		<button type="button" class="btn btn-default search" value="search">Print</button>
		<button type="button" class="btn btn-default print" value="print">Search</button>
	</div>
	
</f:form>


<script type="text/javascript">
	var dt;
	
	$(document).ready(function(){
		
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
			url : "${pageContext.request.contextPath}/employee/searchEmpCode",
			type : "POST",
			success : function(data) {
				dt.fnClearTable();
			for (var i=0;i< data.length; i++) {
				dt.fnAddData([
							  data[i].id,
				              data[i].dateOfBirth,
				              data[i].nameThai
		 			]);
				}
			},
			error : function() {
				alert("ERROR");
			}
		}); 
	}
	
	});	
	
</script>

	 
	 
	 
