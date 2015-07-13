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

		<form:form id="listForm" method="post" commandName="reward" class="form-horizontal" role="form">
<!-- 			<div class="row"> -->
			<%-- <h2 class="col-md-6"><spring:message code="reward.name" /></h2> --%>
			<br>
<!-- 					<div class="col-md-12" align="right"> -->
					<!-- Button trigger modal -->
<!-- 					<button type="button" class="btn btn-warning active" data-toggle="modal" data-target="#addModal"> -->
<%-- 					<spring:message code="label.newRecord" /> --%>
<!-- 					</button>  -->
<!-- 					<br> -->
<!-- 					<br> -->
<!-- 					</div> -->
<!-- 			</div>	 -->
				<div>
					<table id="tbResult"  class="dataTable stripe table-bordered">
					<caption title=""><spring:message code="reward.name" /></caption>
							<thead>
								<tr>
									<th><spring:message code="reward.reward.name" /></th>
									<th><spring:message code="reward.year" /></th>
									<th><spring:message code="reward.description" /></th>
									<th><spring:message code="label.action" /></th>
<!-- 									<th></th> -->
								</tr>
							</thead>
							<tbody></tbody>
					</table>
				</div>
			</form:form>
	<form:form id="addForm" method="post" commandName="reward">
				
				<!-- ---------------------------------------Modal------------------------------------------------------------------ -->

				<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-md">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="addModalLabel"><spring:message code="reward.name" /></h4>
							</div>
						<div class="col col-lg-12 " style="padding-top: 10px">
							<div class="form-group " align="left">
							
									  <spring:message code="default.enter" var="enter"/>
									  
									  <label class="required" ><spring:message code="reward.reward.name" var="rewardname"/>${rewardname} :</label>
										<form:input path="typereward" type="text" class="form-control" id="typereward" placeholder="${enter}${rewardname}" />
							</div>
								<div class="form-group " align="left">
									 <label class="required"><spring:message code="reward.year" var="year"/>${year} :</label>
									<form:select path="year" id="year" class="form-control required" >
										<option value=""><spring:message code="reward.selectyear" var="year"/>${year}</option>						
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

								<div class="form-group " align="left">
									 <label><spring:message code="reward.description" var="description"/>${description} :</label>
									<form:textarea path="reason" type="text" class="form-control" id="reason" placeholder="${enter}${description}" />
								</div>
							</div>

								 <div class="form-group" align="center" >
      				 				 <button type="button" class="btn btn-default btnClose" data-dismiss="modal"><spring:message code="label.close" /></button>
      								<button type="button" class="btn btn-info btnSave"><spring:message code="label.save" /></button>
     				 			</div>
		
						</div>
					</div>
				</div>
	</form:form> 

		<!------------------------------------------Button  modal 2-------------------------------------------------------->
	<form:form id="deleteForm" commandName="reward" method="post">	
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-body">
						<label><spring:message code="default.delete.confirm" /></label>
					</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-danger DeleteButton"><spring:message code="default.yes" /></button>
						<button type="button" class="btn btn-info" data-dismiss="modal"><spring:message code="default.no" /></button>
					</div>
				</div>
			</div>
		</div>
	</form:form>

	<script type="text/javascript">
			var dt;			
			$(document).ready(function(){
				
				
				$('#tbResult').dataTable({ 
					"bLengthChange": false,
					"iDisplayLength": 10,
					"pagingType": "simple_numbers",
					"ordering": false,
					"info": false,
					"dom": '<"toolbar">frtip'
				});
				
				$("div.toolbar").html('<b><button type="button" class="btn btn-warning active" data-toggle="modal" data-target="#addModal"><spring:message code="label.newRecord" /></button>  </b>');
				
			$("#addBtn").on("click",function(){clearModal();});
				
			
			$('#addForm').bootstrapValidator({
//		        live: 'disabled',
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	typereward: {
		                validators: {
		                    notEmpty: {
		                    	message: '<spring:message code="reward.required.name" />'
		                    }
		                }
		            },
		            year: {
		                validators: {
		                    notEmpty: {
		                    	message: '<spring:message code="reward.required.year" />'
		                    },
		                }
		            },
		           
		           
		        }
		    });
				
			dt = $('#tbResult').dataTable();
			listAll();
			$("#addModal").on("show.bs.modal", function(event) {
				
				var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
				var rewardid = button.data("id") //Extract info from data-* attribute

				clearModal();

				if (rewardid != null) {
					getRewardById(rewardid);
				}

				$(this).find(".btnSave").off("click").on("click", function() {
					if(rewardid != null){
						$('#addForm').bootstrapValidator();
	    				$('#addForm').data('bootstrapValidator').validate();
	    				if($('#addForm').data('bootstrapValidator').isValid()){
							updateReward(button, rewardid);
	    				}
					}else{
						$('#addForm').bootstrapValidator();
	    				$('#addForm').data('bootstrapValidator').validate();
	    				if($('#addForm').data('bootstrapValidator').isValid()){
							addReward();
	    				}
					 }
				});
				$(this).find(".btnClose").off("click").on("click",function() {
					$('#addForm').bootstrapValidator('resetForm', true);
				});
			});
			//		------------------------------------------------------------------------------------------------------------

			$("#deleteModal").on("show.bs.modal",function(event) {

						var button = $(event.relatedTarget); // select การกระทำของปุ่ม
						var rewardid = button.data("id"); //กดไอดีฝังในปุ่ม 

						$(this).find('.DeleteButton').off('click').on("click",
								function() {

									deleteById(button, rewardid);
								})
					});

			/* ---------------------------------------------------------------------------------------------------------------------------------------------- */

			function clearModal() {
				$("#typereward").val(""), 
				$("#year").val(""), 
				$("#reason").val("");

			}

					
			function addReward() {
// 				var id = getUrlParameter('Id');
				var id = $("#empId").val();
				$.ajax({
							url : "${pageContext.request.contextPath}/reward/add",
							data : JSON.stringify({
								typereward : $("#typereward").val(),
								year : $("#year").val(),
								reason : $("#reason").val(),
								employeeId: id
							
							}),
							type : "POST",
							contentType : "application/json",
							dataType : "json",
							success : function(data) {
								
								$('#addForm').bootstrapValidator('resetForm', true);
								dt.fnClearTable();
								dt.fnAddData([
												data.typereward,
												data.year,
												data.reason,
												'<button type="button" style="margin-right :15px;" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > <spring:message code="label.edit" /></button>',
												'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> <spring:message code="label.delete" /></button>' ]);

								$('#addModal').modal('toggle');
								$(function(){ new PNotify({
									title: 'Success',
									type: 'success',
									animation: {
										effect_in: 'show',
										effect_out: 'slide'
									}
									});
								});
								listAll();
							},
							error : function() {	
								$(function(){ new PNotify({
								    title: 'Error!',
								    type: 'error',
									animation: {
										effect_in: 'show',
										effect_out: 'slide'
									}
									});
								});
								//	alert("error");
							$('#addForm').bootstrapValidator('validate');
							}
						});
			}

			
			
			function updateReward(button,rewardid) {
// 						var id = getUrlParameter('Id');
						var id = $("#empId").val();
						$.ajax({
							url : "${pageContext.request.contextPath}/reward/update",
							data : JSON.stringify({ //แปลงจาก obj ของจาวาสคริปให้ไปเป็น string  ของเจสัน
								id : rewardid,
								typereward : $("#typereward").val(),
								year : $("#year").val(),
								reason : $("#reason").val(),

							}),
							type : "POST",
							contentType : "application/json",
							datatype : "json",
							success : function(data) {

								var tr = button.closest("tr"); // หาเเถวจากปุ่ม

										dt.fnUpdate(data.name, tr, 0),
										dt.fnUpdate(data.year, tr, 1),
										dt.fnUpdate(data.reason, tr, 2),
										'<button type="button"  style="margin-right :15px;" style="margin-right :15px;" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > <spring:message code="label.edit" /></button>',
										'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> <spring:message code="label.delete" /></button>'

								$('#addModal').modal('toggle');
										$(function(){ new PNotify({
											title: 'Success',
											type: 'success',
											animation: {
												effect_in: 'show',
												effect_out: 'slide'
											}
											});
										});
								listAll();
							},
							error : function(jqXHR,	textStatus,	error) {	
								$(function(){ new PNotify({
								    title: 'Error!',
								    type: 'error',
									animation: {
										effect_in: 'show',
										effect_out: 'slide'
									}
									});
								});
// 									alert("error");
							}
						});

			}

			
			
			function getRewardById(rewardid) {
				$.ajax({
					url : "${pageContext.request.contextPath}/reward/findById/"+rewardid,
					//data : "id=" + rewardid,
					type : "POST",
					success : function(data) {
						$("#typereward").val(data.typereward);
						$("#year").val(data.year);
						$("#reason").val(data.reason);
					},
					error : function(jqXHR,	textStatus,	error) {
						$(function(){ new PNotify({
						    title: 'Error!',
						    type: 'error',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							}
							});
						});
// 							alert("error");
					}
				});
			}

			
			
			function deleteById(button,rewardid) {
				$.ajax({
					url : "${pageContext.request.contextPath}/reward/delete/"+rewardid,
					//data : "id=" + rewardid,
					type : "POST",
					success : function(data) {
						var tr = button.closest("tr"); // หาเเถวจากปุ่ม
						dt.fnDeleteRow(tr);

						$('#deleteModal').modal('toggle');
						$(function(){ new PNotify({
							title: 'Success',
							type: 'success',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							}
							});
						});
					},
					error : function(jqXHR,	textStatus,	error) {	
						$(function(){ new PNotify({
						    title: 'Error!',
						    type: 'error',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							}
							});
						});
// 							alert("error");
					}
				});
			}
			
			
			
			function listAll() {
// 						var id = getUrlParameter('Id');
						var id = $("#empId").val();
						$.ajax({
							url : "${pageContext.request.contextPath}/reward/listAll"+id,
							type : "POST",
							success : function(data) {
								dt.fnClearTable();
								for (var i = 0; i < data.length; i++) {
									dt.fnAddData([data[i].typereward,
												  data[i].year,
												  data[i].reason,
													'<button type="button" style="margin-right :15px;" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal"><spring:message code="label.edit" /></button>'+
													'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal"><spring:message code="label.delete" /></button>' ]);
								}
							},
							error : function(jqXHR,	textStatus,	error) {	
								$(function(){ new PNotify({
								    title: 'Error!',
								    type: 'error',
									animation: {
										effect_in: 'show',
										effect_out: 'slide'
									}
									});
								});
// 									alert("error");
							}
						});
			}
			
			
			
			function getUrlParameter(sParam){	
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
			        ///alert("Param2 "+parseInt(sParameterName[1]));		    
			}     
		});			
			
	</script>
