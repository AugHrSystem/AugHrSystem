<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jsp:include page="../employeeMenu.jsp"></jsp:include>

<input id="empId" type="hidden" value="${id}">

<form:form id ="listForm" method="post" commandName="certification">

<div class="row">
<div class="col-md-6">
<h2>Certification</h2> 
</div>
<br>

<!-- Button trigger modal -->
<div class="form-group" align="right">
<div class="col-md-6">
<button type="button" id="addBtnCer" class="btn btn-info" data-toggle="modal" data-target="#addModal">New record</button> 
</div>
</div>
</div>

<!-- Table -->
<div class="form-group">
<table id="tbResult" class="table">
	<thead>
		<tr>
			<th>Year</th>
			<th>Certification Name</th>
			<th>Certification From</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="certification">

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Certification</h4>
      </div>
      
      <div class="modal-body">
        
	  <div class="form-group">
	    <label>Year :</label>
	    <form:select path="year" class="form-control" id="year">
<%-- 										<form:option value="-1" label="---Select year---" /> --%>
										<%-- <c:forEach var="obj" items="${ masdegreetypeList }"> --%>
										<option value="">---Select year---</option>						
										<option value="2020">2020</option>
										<option value="2019">2019</option>
										<option value="2018">2018</option>
										<option value="2017">2017</option>
										<option value="2016">2016</option>
										<option value="2015">2015</option>
										<option value="2014">2014</option>
										<option value="2013">2013</option>
										<option value="2012">2012</option>
										<option value="2011">2011</option>
										<option value="2010">2010</option>
										<option value="2009">2009</option>
										<option value="2008">2008</option>
										<option value="2007">2007</option>
										<option value="2006">2006</option>
										<option value="2005">2005</option>
										<option value="2004">2004</option>
										<option value="2003">2003</option>
										<option value="2002">2002</option>
										<option value="2001">2001</option>
										<option value="2000">2000</option>
										<option value="1999">1999</option>
										<option value="1998">1998</option>
										<option value="1997">1997</option>
										<option value="1996">1996</option>
										<option value="1995">1995</option>
										<option value="1994">1994</option>
										<option value="1993">1993</option>
										<option value="1992">1992</option>
										<option value="1991">1991</option>
										<option value="1990">1990</option>
										<option value="1989">1989</option>
										<option value="1988">1988</option>
										<option value="1987">1987</option>
										<option value="1986">1986</option>
										<option value="1985">1985</option>
										<option value="1984">1984</option>
										<option value="1983">1983</option>
										<option value="1982">1982</option>
										<option value="1981">1981</option>
										<option value="1980">1980</option>
										<option value="1979">1979</option>
										<option value="1978">1978</option>
										<option value="1977">1977</option>
										<option value="1976">1976</option>
										<option value="1975">1975</option>
										<option value="1974">1974</option>
										<option value="1973">1973</option>
										<option value="1972">1972</option>
										<option value="1971">1971</option>
										<option value="1970">1970</option>
										<option value="1969">1969</option>
										<option value="1968">1968</option>
										<option value="1967">1967</option>
										<option value="1966">1966</option>
										<option value="1965">1965</option>
										<option value="1964">1964</option>
										<option value="1963">1963</option>
										<option value="1962">1962</option>
										<option value="1961">1961</option>
										<option value="1960">1960</option>
										<option value="1959">1959</option>
										<option value="1958">1958</option>
										<option value="1957">1957</option>
										<option value="1956">1956</option>
										<option value="1955">1955</option>
										<option value="1954">1954</option>
										<option value="1953">1953</option>
										<option value="1952">1952</option>
										<option value="1951">1951</option>
										<option value="1950">1950</option>
										<option value="1949">1949</option>
										<option value="1948">1948</option>
										<option value="1947">1947</option>
										<option value="1946">1946</option>
										<option value="1945">1945</option>
										<option value="1944">1944</option>
										<option value="1943">1943</option>
										<option value="1942">1942</option>
										<option value="1941">1941</option>
										<option value="1940">1940</option>
										<option value="1939">1939</option>
										<option value="1938">1938</option>
										<option value="1937">1937</option>
										<option value="1936">1936</option>
										<option value="1935">1935</option>
										<option value="1934">1934</option>
										<option value="1933">1933</option>
										<option value="1932">1932</option>
										<option value="1931">1931</option>
										<option value="1930">1930</option>
										<option value="1929">1929</option>
										<option value="1928">1928</option>
										<option value="1927">1927</option>
										<option value="1926">1926</option>
										<option value="1925">1925</option>
										<option value="1924">1924</option>
										<option value="1923">1923</option>
										<option value="1922">1922</option>
										<option value="1921">1921</option>
										<option value="1920">1920</option>
										<option value="1919">1919</option>
										<option value="1918">1918</option>
										<option value="1917">1917</option>
										<option value="1916">1916</option>
										<option value="1915">1915</option>
										<option value="1914">1914</option>
										<option value="1913">1913</option>
										<option value="1912">1912</option>
										<option value="1911">1911</option>
										<option value="1910">1910</option>
										<option value="1909">1909</option>
										<option value="1908">1908</option>
										<option value="1907">1907</option>
										<option value="1906">1906</option>
										<option value="1905">1905</option>
										<option value="1904">1904</option>
										<option value="1903">1903</option>
										<option value="1902">1902</option>
										<option value="1901">1901</option>
										<option value="1900">1900</option>
										<%-- </c:forEach> --%>
									</form:select>
	  </div>
	  
	  <div class="form-group">
	    <label>Certification Name :</label>
	    <form:input path="name" type="text" class="form-control" id="name" placeholder="Enter Certification Name"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Certification From :</label>
	    <form:input path="certificationFrom" type="text" class="form-control" id="certificationFrom" placeholder="Enter Certification From"/>
	  </div>
	  
	  <div class="form-group">
	    <label>Description :</label>
	    <form:textarea path="description" type="text" class="form-control" id="description" placeholder="Enter Description"/>
	  </div>
	  
      </div>
      
      <div class="form-group" align="center">
        <button type="button" class="btn btn-default btnClose" data-dismiss="modal">Close</button>
      	<button type="button" class="btn btn-info btnSave">Save</button>
      </div>
      
    </div>
  </div>
</div>

</form:form>

<form:form id="deleteForm" commandName="certification" method="post">

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
						<h4 class="modal-title" id="myModalLabel">Delete</h4>
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


<script type="text/javascript">

	var dt;
	
	$(document).ready(function(){
		
		$("#addBtnCer").on("click",function(){clearModal();});
		
		$('#addForm').bootstrapValidator({
//	        live: 'disabled',
	        message: 'This value is not valid',
	        container: 'tooltip',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	year: {
	                validators: {
	                    notEmpty: {
	                        message: 'The year is required and cannot be empty'
	                    }
	                }
	            },
	            name: {
	                validators: {
	                    notEmpty: {
	                        message: 'The certification name is required and cannot be empty'
	                    }
	                }
	            },
// 	            oldSalary: {
// 	                validators: {
// 	                    notEmpty: {
// 	                        message: 'The old salary is required and cannot be empty'
// 	                    },
// 	                    digits: {
// 	                    	message: 'The old salary is number'
// 	                    },
// 	                }
// 	            },
	            certificationFrom: {
	                validators: {
	                    notEmpty: {
	                        message: 'The certification from is required and cannot be empty'
	                    }
	                }
	            },
	            description: {
	                validators: {
	                    notEmpty: {
	                        message: 'The description is required and cannot be empty'
	                    }
	                }
	            },
// 	            reasonOfAdjustment: {
// 	                validators: {
// 	                    notEmpty: {
// 	                        message: 'The reason of adjustment is required and cannot be empty'
// 	                    }
// 	                }
// 	            },
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
			var certificationid = button.data("id") //Extract info from data-* attribute
			
			if(certificationid != null){
				getId(certificationid);
			} 
			
			$(this).find(".btnSave").off("click").on("click",function() {
				if(certificationid != null){
					$('#addForm').bootstrapValidator();
    				$('#addForm').data('bootstrapValidator').validate();
    				if($('#addForm').data('bootstrapValidator').isValid()){
						updateCertification(button, certificationid);
    				}
				}else{
					$('#addForm').bootstrapValidator();
    				$('#addForm').data('bootstrapValidator').validate();
    				if($('#addForm').data('bootstrapValidator').isValid()){
						addCertification();
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
			var certificationid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".btnYes").off("click").on("click",function() {
				deleteCertification(button, certificationid);
			});
			
		});
		
/* ---------------------------------------------------------------------------------------------------------------------------------------------- */
		
		function clearModal(){
			$("#year").val("");
			$("#name").val("");
			$("#certificationFrom").val("");
			$("#description").val("");
		}
		
		function addCertification(){
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/certification/add",
				data : JSON.stringify({
					year : $("#year").val(),
					name :$("#name").val(),
					certificationFrom :$("#certificationFrom").val(),
					description :$("#description").val(),
					employeeId: id
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
// 						data.year,
// 						data.name,
// 						data.certificationFrom,
// 						/* data.company,
// 						data.salary,
// 						data.time, */
						
// 						'<button type="button" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > Edit</button>',
// 						'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> Delete</button>'
// 					]);
					
					$('#addModal').modal('toggle');
					listAll();
					
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function updateCertification(button, certificationid){
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/certification/update",
				data : JSON.stringify({
					id : certificationid,
					year : $("#year").val(),
					name :$("#name").val(),
					certificationFrom :$("#certificationFrom").val(),
					description :$("#description").val(),
					employeeId : id
					/* company :$("#company").val(),
					salary :$("#salary").val(),
					time :$("#time").val(), */
					
				}),
				type : "POST",
				contentType : "application/json",
				dataType: "json",
				success : function(data) {
//	 					alert(JSON.stringify(data));
					$('#addForm').bootstrapValidator('resetForm', true);

// 					var tr = button.closest("tr")
					
// 					dt.fnUpdate(data.year,tr,0);
// 					dt.fnUpdate(data.name,tr,1);
// 					dt.fnUpdate(data.certificationFrom,tr,2);
					/* dt.fnUpdate(data.company, tr ,1);
					dt.fnUpdate(data.salary, tr ,2);
					dt.fnUpdate(data.time, tr ,3); */
					
					$('#addModal').modal('toggle');
					listAll();
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function getId(certificationid){
			$.ajax({
				url : "${pageContext.request.contextPath}/certification/findById",
				data : "certificationid=" + certificationid,
				type : "POST",
				success : function(data) {
	 				//alert(JSON.stringify(data));
					//alert("ok");
					$("#year").val(data.year);
					$("#name").val(data.name);
					$("#certificationFrom").val(data.certificationFrom);
					$("#description").val(data.description);
					/* employee: {id: data.position } */
					/* $("#company").val(data.company),
					$("#salary").val(data.salary),
					$("#time").val(data.time); */
			
				},
				error : function() {
					alert("ERROR");
				}
			});
		}
		
		function deleteCertification(button, certificationid){
			$.ajax({
				url : "${pageContext.request.contextPath}/certification/delete",
				data : "certificationid=" + certificationid,
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
		
		/* function listAll(){
			$.ajax({
				url : "${pageContext.request.contextPath}/history/listAll",
				type : "POST",
				success : function(data) {
					dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([data[i].position,
					              data[i].salary,data[i].oldSalary, 
					              data[i].dateOfAdjustment,data[i].reasonOfAdjustment,data[i].adjustmentTime,
						'<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
						'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
			
					}
				},
				error : function() {
					alert("ERROR");
				}
			}); 
		} */
		
		function listAll(){
			
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/certification/listAll/"+id,
				type : "POST",
				success : function(data) {
					dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
					dt.fnAddData([data[i].year,
					              data[i].name,
					              data[i].certificationFrom, 
						'<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>',
						'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
			
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
		    //alert("spilt "+sURLVariables);

		   	
		    
		    var sParameterName = sURLVariables[1].split('=');
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
