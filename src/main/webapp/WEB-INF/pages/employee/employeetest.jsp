<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="<c:url value="/css/header.css" />" rel="stylesheet" type="text/css">
<jsp:include page="../employeeMenu.jsp"></jsp:include>



<c:if test="${ not empty msgerror }">
	<div class="alert alert-danger" >
	<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>&nbsp;${msgerror }</div>
	<%-- <c:remove var="msgerror" scope="session"/>--%> 
</c:if>


<input type="hidden" id="emp">
<input type="hidden" id="empname">
<!-- <input type="hidden" id="id"> -->

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
<%-- <f:form method="post" id="addForm" commandName="allEmployeeDto" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/employee/submit" enctype="multipart/form-data"> --%>

<f:form method="post" id="addForm" commandName="allEmployeeDto" class="form-horizontal" role="form" name="employeeForm" enctype="multipart/form-data">

<!------------------------------------------------------ Start Information-------------------------------------------------------->
		
		 <input id="employeeCodeDto" name="employeeCodeDto.rungingNumber" type="hidden" class="form-control"  placeholder="Location ID" value="${ employeeCodeDto.rungingNumber}">
		
		
		<div id="message"></div>
		<div id = "div-information" class="col-md-12" style="padding: 15px 0px 15px 0px;">
				<h2><spring:message code="employee.information"></spring:message>
					<i style="position: absolute; right: 20px; cursor:pointer;" id = "icon1" class="fa fa-chevron-up"></i>
				</h2>
		 </div>
		 
		   <!--   Upload image -->
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">


																				
										<div class="col-md-9">
										<div class="row" align="center">
										   <c:if test="${empty allEmployeeDto.image}">
												<div  id="imagePreview" class="img-rounded img-responsive"
													style="background-image:url('<c:url value="/resource/images/photo_2.jpg" />');">
												</div>
											</c:if>
											
											<c:if test="${not empty allEmployeeDto.image}">
										   		 <div id="imagePreview" class="img-rounded img-responsive" style="background-image:url('${pageContext.request.contextPath}/DisplayImageServlet?namespace=EMPLOYEE&fileName=${allEmployeeDto.image}');"></div>
										    </c:if>
											</div>
											<br>
											<label> <spring:message code="employee.uploadFile"></spring:message> :</label> 
										
										
												
											<input type="file" id="uploadFile" name="fileupload" accept="image/*"
												class="file" data-show-upload="false"
												data-show-preview="false" data-initial-caption="${allEmployeeDto.image}"
												data-overwrite-initial="false">  
												
												<input type="hidden" name="image"
												class="form-control element-to-paste-filename"
												value="${allEmployeeDto.image}" />

											
										</div>
									 </div>


   								       

									</div>
								</div>
		 
		 
		 <div class="col-md-9">
		 
		 	<spring:message code="default.enter" var="enter"/>
		 	<spring:message code="default.please" var="please"/>
		 	<spring:message code="employee.pleasewrite" var="write"/>
		 	<spring:message code="employee.givethereason" var="reason"/>
		 	<spring:message code="employee.pleasestatethereasons" var="pleasereason"/>
		 	<spring:message code="employee.datedrafted" var="datedrafted"/>
		 	

							<div class="form-group">
									<!-- <label for="id"> ID :</label> -->
									 <input id="id" name="id" type="hidden" class="form-control" placeholder="Enter ID" value="${id}">
								
								<div class="col-md-6">
		    					<label><spring:message code="employee.location"></spring:message> :</label>
		    						<f:select id="masLocation" path="masLocation"  class="form-control" value="TH">
									 	 <option  value=""><spring:message code="employee.selectlocation"></spring:message></option>
		  								 <f:options items="${ locationList }"  itemValue="code" itemLabel="name" />
									</f:select>
								</div> 
							
								<div class="col-md-6">
									<label for="employeeCode"> <spring:message code="employee.code"></spring:message> :</label> 
									<input id="employeeCodeForShow" name="employeeCodeForShow" type="text" class="form-control" disabled  value="${allEmployeeDto.employeeCode}">
								</div>
								
									<input id="employeeCode" name="employeeCode" type="hidden" class="form-control"  value="${allEmployeeDto.employeeCode}"> 
								
								
							</div>
							
	        
	         		
							<div class="form-group">
								<div class="col-md-4">
									<label class="required"> <spring:message code="employee.nameThai" ></spring:message> :</label> 
									<input type="text" class="form-control" 
									id="nameThai"name="nameThai" placeholder="${please}${enter}<spring:message code="employee.nameThai"></spring:message>" value="${allEmployeeDto.nameThai}">
								</div>
								
								<div class="col-md-4">
									<label> <spring:message code="employee.surnameThai"></spring:message> :</label> 
									<input type="text" class="form-control" 
									id="surnameThai" name="surnameThai" placeholder="${please}${enter}<spring:message code="employee.surnameThai"></spring:message>" value="${allEmployeeDto.surnameThai}">
								</div>
								
								<div class="col-md-4">
									<label> <spring:message code="employee.nicknameThai"></spring:message> :</label> 
									<input type="text" class="form-control" 
									id="nicknameThai" name="nicknameThai" placeholder="${please}${enter}<spring:message code="employee.nicknameThai"></spring:message>" value="${allEmployeeDto.nicknameThai}">
								</div>
							</div>
					
	         
	         		
							<div class="form-group">
								<div class="col-md-4">
									<label> <spring:message code="employee.nameEng"></spring:message> :</label> 
									<input type="text" class="form-control" id="nameEng" name="nameEng" placeholder="${please}${enter}<spring:message code="employee.nameEng"></spring:message>" value="${allEmployeeDto.nameEng}">
								</div>
								<div class="col-md-4">
									<label> <spring:message code="employee.surnameEng"></spring:message> :</label> <input type="text" class="form-control"
									id="surnameEng" name="surnameEng" placeholder="${please}${enter}<spring:message code="employee.surnameEng"></spring:message>" value="${allEmployeeDto.surnameEng}">
								</div>
								<div class="col-md-4">
									<label> <spring:message code="employee.nicknameEng"></spring:message> :</label> <input type="text" class="form-control"
									id="nicknameEng" name="nicknameEng" placeholder="${please}${enter}<spring:message code="employee.nicknameEng"></spring:message>" value="${allEmployeeDto.nicknameEng}">
								</div>
							</div>
					
	         </div>
	         
	     
	         
	         
 <!-------------------------------------------------- Start Address-------------------------------------------------->
 
	      
	       
	   
        <div id="outputAddress">
	       <table id="tbResult" class ="dataTable stripe table-bordered">
	       <caption title=""><spring:message code="label.address"></spring:message></caption>
						<thead>
							<tr>
							    <th><spring:message code="label.id"></spring:message></th>
							    <th><spring:message code="address.idtype"></spring:message></th>
								<th><spring:message code="address.type"></spring:message></th> 
								<th><spring:message code="address.address1"></spring:message></th>
								<th><spring:message code="address.address2"></spring:message></th>
								<th><spring:message code="address.idprovince"></spring:message></th>
								<th><spring:message code="address.province"></spring:message></th> 
								<th><spring:message code="address.zipcode"></spring:message></th>
								<th><spring:message code="address.getindex"></spring:message></th>
								<th><spring:message code="label.action"></spring:message></th>
								<!-- <th>Delete</th> -->
								<th><spring:message code="address.status"></spring:message></th>
							    <!-- <th>HiddenIndex</th>  -->
							</tr>
						
						</thead>
						
						<tbody>
						
						</tbody>
					</table>
					
	     </div>
	     
	     <br>
	     <div class="col-md-12">
	    <div class="form-group" align="right">
	      <button id="addaddress" type="button"class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal">
          <spring:message code="label.newRecord"></spring:message></button>	
        </div>
        </div>
	     
 <!----------------------------------------- Start General------------------------------------------------------>
	     
	     <div id = "div-information" class="col-md-12" style="padding: 15px 0px 15px 0px;">
				<h2><spring:message code="employee.general"></spring:message>
					<i style="position: absolute; right: 20px; cursor:pointer;" id = "icon1" class="fa fa-chevron-up"></i>
				</h2>
	       </div>
	     
	     
	     <div class="row">
	      <div class="col-md-12">
	         		
							<div class="form-group">
								<div class="col-md-3">
									<label class="required" style="margin-right: 25px;"> <spring:message code="employee.email"></spring:message> :</label> <input type="email" class="form-control" 
									id="email" name="email" placeholder="${please} ${enter} <spring:message code="employee.email"></spring:message>" value="${allEmployeeDto.email}">
								</div>
								<div class="col-md-3">
									<label class="required" style="margin-right: 25px;"> <spring:message code="employee.telHome"></spring:message> :</label> <input type="text" class="form-control"
									id="telHome" name="telHome" placeholder="<spring:message code="employee.formatTel"></spring:message>" value="${allEmployeeDto.telHome}">
								</div>
								<div class="col-md-3">
									<label class="required" style="margin-right: 25px;"> <spring:message code="employee.telMobile"></spring:message> :</label> <input type="text" class="form-control"
									id="telMobile" name="telMobile" placeholder="<spring:message code="employee.formatTelMo"></spring:message>" value="${allEmployeeDto.telMobile}">
								</div>
								<div class="col-md-3">
									<label class="required" style="margin-right: 25px;"> <spring:message code="employee.telFax"></spring:message> :</label> <input type="text" class="form-control"
									id="telFax" name="telFax" placeholder="<spring:message code="employee.formatTel"></spring:message>" value="${allEmployeeDto.telFax}">
								</div>
							</div>
					
	        </div>
	        </div>
	        
	        <div class="row">
	        <div class="col-md-12">
	         		
							<div class="form-group">
								<div class="col-md-6">
									<label style="margin-right: 25px;"> <spring:message code="employee.congenitalDisease"></spring:message> :</label> <input type="text" class="form-control"
									id="congenitalDisease" name="congenitalDisease" placeholder="${please} ${enter} <spring:message code="employee.congen"></spring:message>" value="${allEmployeeDto.congenitalDisease}">
								</div>
								<div class="col-md-6">
									<label style="margin-right: 25px;"> <spring:message code="employee.hospital"></spring:message> :</label> <input type="text" class="form-control"
									id="hospital" name="hospital" placeholder="${please} ${enter} <spring:message code="employee.hospital"></spring:message>" value="${allEmployeeDto.hospital}">
								</div>
							</div>
					
	        </div>
	        </div>
	        
	        <div class="row">
	         <div class="col-md-12">
	         		
							<div class="form-group">
								<div class="col-md-6">
									<label class="required" style="margin-right: 25px;"> <spring:message code="employee.emergencyContact"></spring:message> :</label> <input type="text" class="form-control"
									id="emergencyContact" name="emergencyContact" placeholder="${please} ${enter} <spring:message code="employee.emergencyname"></spring:message>" value="${allEmployeeDto.emergencyContact}">
								</div>
								<div class="col-md-6">
									<label style="margin-right: 25px;"> <spring:message code="employee.relationshipWithEmergencyContact"></spring:message> :</label> <input type="text" class="form-control"
									id="relationshipWithEmergencyContact" name="relationshipWithEmergencyContact" placeholder="${please} ${enter} <spring:message code="employee.relationshipWithEmergencyContact"></spring:message>"
									value="${allEmployeeDto.relationshipWithEmergencyContact}">
								</div>
							</div>
					
	        </div>
	        </div>
	        
	        <div class="row">
	         <div class="col-md-12">
							<div class="form-group">
								<div class="col-md-6">
									<label style="margin-right: 25px;"> <spring:message code="employee.emergencyContactAddress"></spring:message> :</label> <input type="text" class="form-control"
									id="emergencyContactAddress" name="emergencyContactAddress" placeholder="${please} ${enter} <spring:message code="employee.emergencyAddress"></spring:message>" value="${allEmployeeDto.emergencyContactAddress}">
								</div>
								<div class="col-md-3">
									<label class="required" style="margin-right: 25px;"> <spring:message code="employee.emergencyContactPhoneNumber"></spring:message>  :</label> <input type="text" class="form-control"
									id="emergencyContactPhoneNumber" name="emergencyContactPhoneNumber" placeholder="<spring:message code="employee.formatTelMo"></spring:message>" value="${allEmployeeDto.emergencyContactPhoneNumber}">
								</div>
							</div>
					
	        </div>
	        </div>
	       
	       
	       <div class="row">
	       <div class="col-md-12">
	         		
							<div class="form-group">
								<div class="col-md-3">
									<label class="required" style="margin-right: 25px;"> <spring:message code="employee.dateOfBirth"></spring:message> :</label> 
									<div class='input-group date'  id='dateOfBirth'>
									
								
									
									<input type="text" class="form-control"
									id="dateOfBirth" name="dateOfBirth" placeholder="${please} ${enter} <spring:message code="employee.dob"></spring:message>"            							 
           							value='<fmt:formatDate pattern="dd-MM-yyyy" value="${allEmployeeDto.dateOfBirth}" />' /> 
           							           							
									
									<span class="input-group-addon">
							            <span class="glyphicon glyphicon-calendar"></span>
							        </span>
							        </div>
								</div>
																	
								
								
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.placeOfBirth"></spring:message> :</label> <input type="text" class="form-control"
									id="placeOfBirth" name="placeOfBirth" placeholder="${please} ${enter} <spring:message code="employee.pob"></spring:message>" value="${allEmployeeDto.placeOfBirth}">
								</div>
								
								
								<%-- <div class="col-md-3">
								
									<label> Place of Birth :</label>
									<div class='input-group date' id='placeOfBirth'> <input type="text" class="form-control"
									id="placeOfBirth" name="placeOfBirth" placeholder="Enter POB" value="${allEmployeeDto.placeOfBirth}">
									<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
									</span></div>
								</div> --%>
								
								
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.age"></spring:message> :</label> <input type="text" class="form-control"
									id="age" name="age" placeholder="${please} ${enter} <spring:message code="employee.age"></spring:message>" value="${allEmployeeDto.age}">
								</div>
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.religion"></spring:message> :</label> <input type="text" class="form-control"
									id="religion" name="religion" placeholder="${please} ${enter} <spring:message code="employee.religion"></spring:message>" value="${allEmployeeDto.religion}">
								</div>
								
							</div>
					
	        </div>
	        </div>
	        
	        <div class="row">
	         <div class="col-md-12">
	         		
							<div class="form-group">
								<div class="col-md-3">
									<label class="required" style="margin-right: 25px;"> <spring:message code="employee.idCard"></spring:message> :</label> <input type="text" class="form-control"
									id="idCard" name="idCard" placeholder="${please} ${enter} <spring:message code="employee.idCard"></spring:message>" value="${allEmployeeDto.idCard}">
								</div>
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.issuedOffice"></spring:message> :</label> <input type="text" class="form-control"
									id="issuedOffice" name="issuedOffice" placeholder="${please} ${enter} <spring:message code="employee.issuedOffice"></spring:message>" value="${allEmployeeDto.issuedOffice}">
								</div>
								
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.expiryDate"></spring:message> :</label>
									<div class='input-group date' id='expiryDate'> <input type="text" class="form-control"
									id="expiryDate" name="expiryDate" placeholder="${enter} <spring:message code="employee.expiryDate"></spring:message>" 
									value='<fmt:formatDate pattern="dd-MM-yyyy" value="${allEmployeeDto.expiryDate}" />' />
								
								<span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
								</span></div></div>
							</div>
					
	        </div>
	        </div>
	        
	        <div class="row">
	         <div class="col-md-12">
	 <!------------------------------------------------------------------ form ของ sex ------------------------------------------------------------->
							<div class="form-group">
						
						
							<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.sex"></spring:message> :</label>
									<div class="radio">
									 <c:if test="${empty allEmployeeDto.sex}">									
									  		 <label><input type="radio" name="sex" id="Male" value="Male"><spring:message code="employee.male"></spring:message></label>
									  		 <label><input type="radio" name="sex" id="Female" value="Female"><spring:message code="employee.female"></spring:message></label>
									 		<label for="sex" class="error">Please select your gender</label>
									  </c:if>
									  
									  
									  <c:if test="${not empty allEmployeeDto.sex}">

										 <c:if test="${allEmployeeDto.sex =='Male'}">
										        <label><input type="radio" name="sex" id="Male" value="Male" checked="checked"><spring:message code="employee.male"></spring:message></label>
										        <label><input type="radio" name="sex" id="Female" value="Female"><spring:message code="employee.female"></spring:message></label>
										  </c:if>
										    
										   <c:if test="${allEmployeeDto.sex =='Female'}">
										       <label><input type="radio" name="sex" id="Male" value="Male"><spring:message code="employee.male"></spring:message></label>
										       <label><input type="radio" name="sex" id="Female" value="Female" checked="checked"><spring:message code="employee.female"></spring:message></label>						  
										   </c:if>
									  </c:if>
									 
    								</div>
								</div>
								
	<!----------------------------------------------------------------------------------------- form ของ marital staus  ------------------------------------------------------------------->				
								
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.maritalStatus"></spring:message> :</label>
									<div class="radio">
									  <c:if test="${empty allEmployeeDto.maritalStatus}">	
     									 <label><input type="radio" name="maritalStatus" id="Single" value="Single"><spring:message code="employee.single"></spring:message></label> 
      									 <label><input type="radio" name="maritalStatus" id="Married" value="Married"><spring:message code="employee.married"></spring:message></label>
      									 <label><input type="radio" name="maritalStatus" id="Divorce" value="Divorce"><spring:message code="employee.divorce"></spring:message></label>
    								  		<label for="maritalStatus" class="error">Please select your maritalStatus</label>
    								  </c:if>
    								  <c:if test="${not empty allEmployeeDto.maritalStatus}">
    								        
    								        <c:choose>
										    <c:when test="${allEmployeeDto.maritalStatus =='Single'}">
										       <label><input type="radio" name="maritalStatus" id="Single" value="Single" checked="checked"><spring:message code="employee.single"></spring:message></label> 
      									 	   <label><input type="radio" name="maritalStatus" id="Married" value="Married"><spring:message code="employee.married"></spring:message></label>
      									       <label><input type="radio" name="maritalStatus" id="Divorce" value="Divorce"><spring:message code="employee.divorce"></spring:message></label>
										    </c:when>
										    
										     <c:when test="${allEmployeeDto.maritalStatus =='Married'}">
										       <label><input type="radio" name="maritalStatus" id="Single" value="Single"><spring:message code="employee.single"></spring:message></label> 
      									 	   <label><input type="radio" name="maritalStatus" id="Married" value="Married" checked="checked"><spring:message code="employee.married"></spring:message></label>
      									       <label><input type="radio" name="maritalStatus" id="Divorce" value="Divorce"><spring:message code="employee.divorce"></spring:message></label>
										    </c:when>
										    
										    <c:when test="${allEmployeeDto.maritalStatus =='Divorce'}">
										       <label><input type="radio" name="maritalStatus" id="Single" value="Single"><spring:message code="employee.single"></spring:message></label> 
      									 	   <label><input type="radio" name="maritalStatus" id="Married" value="Married" checked="checked"><spring:message code="employee.married"></spring:message></label>
      									       <label><input type="radio" name="maritalStatus" id="Divorce" value="Divorce"><spring:message code="employee.divorce"></spring:message></label>
										    </c:when>
										    
										    <c:otherwise>
										       <label><input type="radio" name="maritalStatus" id="Single" value="Single"><spring:message code="employee.single"></spring:message></label> 
      									 	   <label><input type="radio" name="maritalStatus" id="Married" value="Married"><spring:message code="employee.married"></spring:message></label>
      									       <label><input type="radio" name="maritalStatus" id="Divorce" value="Divorce"><spring:message code="employee.divorce"></spring:message></label>
										    </c:otherwise>
										   </c:choose>
    								  
    								  </c:if>
    								  
    								</div>
								</div>
    						
								
							
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.height"></spring:message> :</label> <input type="text" class="form-control"
									id="height" name="height" placeholder="${please} ${enter} <spring:message code="employee.height"></spring:message>" value="${allEmployeeDto.height}">
								</div>
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.weigth"></spring:message> :</label> <input type="text" class="form-control"
									id="weigth" name="weigth" placeholder="${please} ${enter} <spring:message code="employee.weigth"></spring:message>" value="${allEmployeeDto.weigth}">
								</div>
							</div>
					
	        </div>
	        </div>
	        
	        
	        <%--  <div class="col-md-12">
	         		
							<div class="form-group">
								<div class="col-md-3">
									<label> <spring:message code="employee.sex"></spring:message> :</label>
									<div class="radio">
									 <c:if test="${empty allEmployeeDto.sex}">									
									  		 <label><input type="radio" name="sex" id="Male" value="Male"><spring:message code="employee.male"></spring:message></label>
									  		 <label><input type="radio" name="sex" id="Female" value="Female"><spring:message code="employee.female"></spring:message></label>
									  </c:if>
									  
									  
									  <c:if test="${not empty allEmployeeDto.sex}">

										 <c:if test="${allEmployeeDto.sex =='Male'}">
										        <label><input type="radio" name="sex" id="Male" value="Male" checked="checked"><spring:message code="employee.male"></spring:message></label>
										        <label><input type="radio" name="sex" id="Female" value="Female"><spring:message code="employee.female"></spring:message></label>
										  </c:if>
										    
										   <c:if test="${allEmployeeDto.sex =='Female'}">
										       <label><input type="radio" name="sex" id="Male" value="Male"><spring:message code="employee.male"></spring:message></label>
										       <label><input type="radio" name="sex" id="Female" value="Female" checked="checked"><spring:message code="employee.female"></spring:message></label>						  
										   </c:if>
									  </c:if>
									 
    								</div>
								</div>
    						</div>	
					
	        </div> --%>
	        
	        
	        <%--  <div class="col-md-12">
	         		
							<div class="form-group">
								<div class="col-md-3">
									<label> <spring:message code="employee.maritalStatus"></spring:message> :</label>
									<div class="radio">
									  <c:if test="${empty allEmployeeDto.maritalStatus}">	
     									 <label><input type="radio" name="maritalStatus" id="Single" value="Single"><spring:message code="employee.single"></spring:message></label> 
      									 <label><input type="radio" name="maritalStatus" id="Married" value="Married"><spring:message code="employee.married"></spring:message></label>
      									 <label><input type="radio" name="maritalStatus" id="Divorce" value="Divorce"><spring:message code="employee.divorce"></spring:message></label>
    								  </c:if>
    								  <c:if test="${not empty allEmployeeDto.maritalStatus}">
    								        
    								        <c:choose>
										    <c:when test="${allEmployeeDto.maritalStatus =='Single'}">
										       <label><input type="radio" name="maritalStatus" id="Single" value="Single" checked="checked"><spring:message code="employee.single"></spring:message></label> 
      									 	   <label><input type="radio" name="maritalStatus" id="Married" value="Married"><spring:message code="employee.married"></spring:message></label>
      									       <label><input type="radio" name="maritalStatus" id="Divorce" value="Divorce"><spring:message code="employee.divorce"></spring:message></label>
										    </c:when>
										    
										     <c:when test="${allEmployeeDto.maritalStatus =='Married'}">
										       <label><input type="radio" name="maritalStatus" id="Single" value="Single"><spring:message code="employee.single"></spring:message></label> 
      									 	   <label><input type="radio" name="maritalStatus" id="Married" value="Married" checked="checked"><spring:message code="employee.married"></spring:message></label>
      									       <label><input type="radio" name="maritalStatus" id="Divorce" value="Divorce"><spring:message code="employee.divorce"></spring:message></label>
										    </c:when>
										    
										    <c:when test="${allEmployeeDto.maritalStatus =='Divorce'}">
										       <label><input type="radio" name="maritalStatus" id="Single" value="Single"><spring:message code="employee.single"></spring:message></label> 
      									 	   <label><input type="radio" name="maritalStatus" id="Married" value="Married" checked="checked"><spring:message code="employee.married"></spring:message></label>
      									       <label><input type="radio" name="maritalStatus" id="Divorce" value="Divorce"><spring:message code="employee.divorce"></spring:message></label>
										    </c:when>
										    
										    <c:otherwise>
										       <label><input type="radio" name="maritalStatus" id="Single" value="Single"><spring:message code="employee.single"></spring:message></label> 
      									 	   <label><input type="radio" name="maritalStatus" id="Married" value="Married"><spring:message code="employee.married"></spring:message></label>
      									       <label><input type="radio" name="maritalStatus" id="Divorce" value="Divorce"><spring:message code="employee.divorce"></spring:message></label>
										    </c:otherwise>
										   </c:choose>
    								  
    								  </c:if>
    								  
    								</div>
								</div>
    						</div>	
					
	        </div> --%>
	        
	        <div class="row">
	           <div class="col-md-12">
	         		
							<div class="form-group">
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.numberOfChildren"></spring:message> :</label> <input type="text" class="form-control"
									id="numberOfChildren" name="numberOfChildren" placeholder="${please} ${enter} <spring:message code="employee.numberOfChildren"></spring:message>" value="${allEmployeeDto.numberOfChildren}">
								</div>
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.spouseName"></spring:message> :</label> <input type="text" class="form-control"
									id="spouseName" name="spouseName" placeholder="${please} ${enter} <spring:message code="employee.spouseName"></spring:message>" value="${allEmployeeDto.spouseName}">
								</div>
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.marriageCertificateNo"></spring:message> :</label> <input type="text" class="form-control"
									id="marriageCertificateNo" name="marriageCertificateNo" placeholder="${please} ${enter} <spring:message code="employee.marcertno"></spring:message>" value="${allEmployeeDto.marriageCertificateNo}">
								</div>
								<div class="col-md-3">
									<label style="margin-right: 25px;"> <spring:message code="employee.issuedOffice"></spring:message> :</label> <input type="text" class="form-control"
									id="issuedOffice2" name="issuedOffice2" placeholder="${please} ${enter} <spring:message code="employee.issuedOffice"></spring:message>" value="${allEmployeeDto.issuedOffice2}">
								</div>
							</div>
					
	        </div>
	        </div>
	       
	       <div class="row">
	        <div class="col-md-12">
	         		
							<div class="form-group">
								<div class="col-md-6">
									<label style="margin-right: 25px;"> <spring:message code="employee.address"></spring:message> :</label> <input type="text" class="form-control"
									id="address" name="address" placeholder="${please} ${enter} <spring:message code="employee.address"></spring:message>" value="${allEmployeeDto.address}">
								</div>
								<div class="col-md-6">
									<label style="margin-right: 25px;"> <spring:message code="employee.occupation"></spring:message> :</label> <input type="text" class="form-control"
									id="occupation" name="occupation" placeholder="${please} ${enter} <spring:message code="employee.occupation"></spring:message>" value="${allEmployeeDto.occupation}">
								</div>
							</div>
					
	        </div>
	        </div>
	       
	       <div class="row">
	       <div class="col-md-12">
	       <label style="margin-right: 25px;"> <spring:message code="employee.howdoyouknowaugmentis"></spring:message> :</label>
	       </div>
	       </div>
	           <div class="row">
	           
	         				<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-3">
								
   								  <c:if test="${empty allEmployeeDto.knowAugNewspaper}">	
     									  <label style="margin-right: 25px;"><input type="checkbox" id="Newspaper" name="knowAugNewspaper" value="Newspaper"><spring:message code="employee.newspaper"></spring:message></label>   										 
     									  <input type="text" class="form-control" id="descriptionNewspaper" name="descriptionNewspaper" placeholder="${please} ${enter} <spring:message code="employee.newspaper"></spring:message>" value="${allEmployeeDto.descriptionNewspaper}">
     									
    								  </c:if>
    								 
									  <c:if test="${not empty allEmployeeDto.knowAugNewspaper}">	
     									   <label style="margin-right: 25px;"><input type="checkbox" id="Newspaper" name="knowAugNewspaper" value="Newspaper" checked="checked"><spring:message code="employee.newspaper"></spring:message></label>
    								  	   <input type="text" class="form-control" id="descriptionNewspaper" name="descriptionNewspaper" placeholder="${please} ${enter} <spring:message code="employee.newspaper"></spring:message>" value="${allEmployeeDto.descriptionNewspaper}">
    								  		
    								  </c:if>
								 </div>
									  
									 <div class="col-md-3">
									  
									  <c:if test="${empty allEmployeeDto.descriptionMagazine}">	
     									 <label style="margin-right: 25px;"><input type="checkbox" id="Magazine" name="knowAugMagazine" value="Magazine"><spring:message code="employee.magazine"></spring:message></label>
      									 <input type="text" class="form-control" id="descriptionMagazine" name="descriptionMagazine" placeholder="${please} ${enter} <spring:message code="employee.magazine"></spring:message>" value="${allEmployeeDto.descriptionMagazine}">
      									 
    								  </c:if>
    								 
									  <c:if test="${not empty allEmployeeDto.descriptionMagazine}">	
     									   <label style="margin-right: 25px;"><input type="checkbox" id="" name="knowAugMagazine" value="Magazine" checked="checked"><spring:message code="employee.magazine"></spring:message></label>
    								  	   <input type="text" class="form-control" id="descriptionMagazine" name="descriptionMagazine" placeholder="${please} ${enter} <spring:message code="employee.magazine"></spring:message>" value="${allEmployeeDto.descriptionMagazine}">
      									 
    								  </c:if>
									</div>
										
										<div class="col-md-3">
									 <c:if test="${empty allEmployeeDto.knowAugWebsite}">	
     									 <label style="margin-right: 25px;"><input type="checkbox" id="Website" name="knowAugWebsite" value="Website"><spring:message code="employee.website"></spring:message></label>
      									 <input type="text" class="form-control" id="descriptionWebsite" name="descriptionWebsite" placeholder="${please} ${enter} <spring:message code="employee.website"></spring:message>" value="${allEmployeeDto.descriptionWebsite}">
      									
    								  </c:if>
    								 
									  <c:if test="${not empty allEmployeeDto.knowAugWebsite}">	
     									 <label style="margin-right: 25px;"><input type="checkbox" id="Website" name="knowAugWebsite" value="Website" checked="checked"><spring:message code="employee.website"></spring:message></label>
      									 <input type="text" class="form-control" id="descriptionWebsite" name="descriptionWebsite" placeholder="${please} ${enter} <spring:message code="employee.website"></spring:message>" value="${allEmployeeDto.descriptionWebsite}">
      									
    								  </c:if>
									
									 	 </div>
									  
									  <div class="col-md-3">
									  <c:if test="${empty allEmployeeDto.knowAugFriend}">	
     									 <label style="margin-right: 25px;"><input type="checkbox" id="Friend" name="knowAugFriend" value="Friend"><spring:message code="employee.friend"></spring:message></label>
      									 <input type="text" class="form-control" id="descriptionFriend" name="descriptionFriend" placeholder="${please} ${enter} <spring:message code="employee.friend"></spring:message>" value="${allEmployeeDto.descriptionFriend}">
      									
    								  </c:if>
    								 
									  <c:if test="${not empty allEmployeeDto.knowAugFriend}">	
     									 <label style="margin-right: 25px; padding:10px;"><input type="checkbox" id="Friend" name="knowAugFriend" value="Friend" checked="checked"><spring:message code="employee.friend"></spring:message></label>
      									 <input type="text" class="form-control" id="descriptionFriend" name="descriptionFriend" placeholder="${please} ${enter} <spring:message code="employee.friend"></spring:message>" value="${allEmployeeDto.descriptionFriend}">
      									
    								  </c:if>
									    
									  </div>
									    
							 </div>
									
									    
									 <div class="col-md-12">
									     <div class="col-md-12">
									  <c:if test="${empty allEmployeeDto.knowAugOther}">	
									    <label style="padding:5px;"><input type="checkbox" id="Other" name="knowAugOther" value="Other"><spring:message code="employee.other"></spring:message></label>
      									<input type="text" class="form-control" id="descriptionOther" name="descriptionOther" placeholder="${please} ${enter} <spring:message code="employee.other"></spring:message>" value="${allEmployeeDto.descriptionOther}">
    								  </c:if>
									    
									  <c:if test="${not empty allEmployeeDto.knowAugOther}">	
									    <label><input type="checkbox" id="Other" name="knowAugOther" value="Other" checked="checked"><spring:message code="employee.other"></spring:message></label>
      									<input type="text" class="form-control" id="descriptionOther" name="descriptionOther" placeholder="${please} ${enter} <spring:message code="employee.other"></spring:message>" value="${allEmployeeDto.descriptionOther}">
    								  </c:if>
									    </div>		 
      								</div>
      								
      								
						</div>
    									
			
	        </div>
	        
	        <div class="row">
	       <div class="col-md-12">
	        <label> <spring:message code="employee.doyouknow"></spring:message> :</label>
	       </div>
	       </div>
	        
	        
	        <div class="row">
	    
						<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-1">
    									
	     									  <label style="margin-right: 25px;">
	     									  <f:radiobutton id="Yes" path="knowEmployed"  value="Yes"/><spring:message code="employee.yes"></spring:message>
	     									  </label>
	     									  </div>
	     									  
	     									  <div class="col-md-11">
	     									  <f:input  class="form-control" id="descriptionYes" path="descriptionYes" value="${allEmployeeDto.descriptionYes}" placeholder="${please} ${enter} ${write}" />
	     									  
	     									  </div>
	     									  </div>
	     									  
	     					<div class="col-md-12">
								<div class="col-md-12">
	     									  <label style="margin-right: 25px;">
	     									  <f:radiobutton id="No" path="knowEmployed"  value="No" /><spring:message code="employee.no"></spring:message>
	     									  </label>
    										  
											  <input id="knowEmployed" type="hidden" value="${allEmployeeDto.knowEmployed}"/>
    								</div>
    								</div>
    				
				
			</div>
	      </div>  
	        
	        
	        <div class="row">
	        	<div class="col-md-12">
						<label><spring:message code="employee.haveyoueverserved"></spring:message> :</label>
    				</div>
	      		 </div>				

			<div class="row">
			<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-12">
										<label style="margin-right: 25px;">
     									  <f:radiobutton  id="militaryServiceYes" path="militaryService" value="Yes" /><spring:message code="employee.yes"></spring:message>
     									 </label>
     									 
     									</div>
    								</div>
    								
    							<div class="col-md-12">
     								<div class="col-md-3">
    									 <label style="margin-right: 25px;"> <spring:message code="employee.fromYear"></spring:message> :</label>

    									 <div class='input-group date' id='fromYear'>
    									 <input type="text" class="form-control" id="fromYear" name="fromYear" placeholder="${please} ${enter} <spring:message code="employee.fromYear"></spring:message>"
    									  value='<fmt:formatDate pattern="dd-MM-yyyy" value="${allEmployeeDto.fromYear}" />' />
    								     <span class="input-group-addon">
										 <span class="glyphicon glyphicon-calendar"></span>
										 </span></div>
									</div>
									
    								<div class="col-md-3">
    									 <label style="margin-right: 25px;"> <spring:message code="employee.toYear"></spring:message> :</label>
    									 <div class='input-group date' id='toYear'>
    									 <input type="text" class="form-control" id="toYear" name="toYear" placeholder="${please} ${enter} <spring:message code="employee.toYear"></spring:message>"
    									  value='<fmt:formatDate pattern="dd-MM-yyyy" value="${allEmployeeDto.toYear}" />'  />
    									 <span class="input-group-addon">    									 
    									 <span class="glyphicon glyphicon-calendar"></span>
    									 </span>
										</div>
									</div>



    								<div class="col-md-3">
    									 <label style="margin-right: 25px;"> <spring:message code="employee.branchOfService"></spring:message> :</label>
    									 <input type="text" class="form-control" id="branchOfService" name="branchOfService" placeholder="${please} ${enter} <spring:message code="employee.branchOfService"></spring:message>" value="${allEmployeeDto.branchOfService}">
    								</div>
    								
    								<div class="col-md-3">
     									 <label style="margin-right: 25px;"> <spring:message code="employee.serviceNo"></spring:message> :</label>
    									 <input type="text" class="form-control" id="serviceNo" name="serviceNo" placeholder="${please} ${enter} <spring:message code="employee.serviceNo"></spring:message>" value="${allEmployeeDto.serviceNo}">
    							    </div>
    						</div>	
					
	        	</div>
	        </div>
	        
	        
	        	<div class="row">
					<div class="form-group">
						<div class="col-md-12">
							<div class="col-md-12">
     							<label style="margin-right: 25px;">
     							<f:radiobutton id="militaryServiceNo" path="militaryService" value="No" /><spring:message code="employee.no" ></spring:message>
     							</label>
     						
     						</div>	
     						</div>
     				
     				<div class="col-md-12">
     								<div class="col-md-6">
    									 <label> Please state the reasons :</label>
    									 <f:input  class="form-control" id="reasonsNo" path="reasonsNo" value="${allEmployeeDto.reasonsNo}" placeholder="${please} ${enter} ${pleasereason}" /> 
    								</div>
    								<div class="col-md-3">
    									 <label style="margin-right: 25px;"> <spring:message code="employee.dateToBeDrafted"></spring:message> :</label>

    									 <div class='input-group date' id='dateToBeDrafted'>
    									 <f:input  class="form-control" id="dateToBeDrafted" path="dateToBeDrafted"  placeholder="${please} ${enter} ${datedrafted}" 
    									 value='<fmt:formatDate pattern="dd-MM-yyyy" value="${allEmployeeDto.dateToBeDrafted}" />'  />
    							      	 <span class="input-group-addon">
										 <span class="glyphicon glyphicon-calendar"></span>
										 </span></div></div>

										<input id="militaryService" type="hidden" value="${allEmployeeDto.militaryService}"/>
    									<%--  <input type="text" class="form-control" id="dateToBeDrafted" name="dateToBeDrafted" placeholder="Enter Date Drafted" value="${allEmployeeDto.dateToBeDrafted}">
    									</div> --%>

    						</div>	
					
	        </div>
	        </div>


	 <div class="row">
			<div class="col-md-12">
				<label> <spring:message code="employee.mayinquiry"></spring:message> :</label>
				</div>	
			</div>
			
	<div class="row">
		
		<div class="form-group">
				<div class="col-md-12">
					<div class="col-md-12">
							<label style="margin-right: 25px;">
							<f:radiobutton  id="previousEmployerYes" path="previousEmployer" value="Yes" /><spring:message code="employee.yes"></spring:message>
							</label>
					</div>
				</div>


			<div class="col-md-12">
				<div class="col-md-1">
							<label style="margin-right: 25px;">
							<f:radiobutton id="previousEmployerNo" path="previousEmployer" value="No" /> <spring:message code="employee.no"></spring:message>
							</label>
					</div>
				
				<div class="col-md-11">
					<f:input  class="form-control" id="previousEmpreasonsNo" path="previousEmpreasonsNo" value="${allEmployeeDto.previousEmpreasonsNo}" placeholder="${please} ${enter} ${reason}" />
				</div>
				
				<input id="previousEmployer" type="hidden" value="${allEmployeeDto.previousEmployer}"/>
			</div>
			
		</div>
	   </div>
		
	


	<!---------------------------------------------------------- Start Official--------------------------------------------->   
	      
	    <div id = "div-information" class="col-md-12" style="padding: 15px 0px 15px 0px;">
			<h2><spring:message code="official.name"></spring:message>
					<i style="position: absolute; right: 20px; cursor:pointer;" id = "icon1" class="fa fa-chevron-up"></i>
			</h2>
	   </div>
	    
			<div class="row">
			<div class="col-md-12">	
			<div class="form-group">
				<div class="col-md-6">
									<label style="margin-right: 25px;"> <spring:message code="official.positionAppliedFor"></spring:message> :</label> 
									<input type="text" class="form-control" id="positionAppliedFor" name="positionAppliedFor" placeholder="${please} ${enter} <spring:message code="official.position"></spring:message>" value="${allEmployeeDto.positionAppliedFor}">
				</div>
								

				<div class="col-md-6">
				<label style="margin-right: 25px;"> <spring:message code="official.salaryExpected"></spring:message> :</label> <input type="text" class="form-control" id="salaryExpected" name="salaryExpected" placeholder="${please} ${enter} <spring:message code="official.salary"></spring:message>" value="${allEmployeeDto.salaryExpected}">
			

				<%-- <div class="col-md-6">
									<label> Salary Expected :</label> <input type="text" class="form-control" id="salaryExpected" name="salaryExpected" placeholder="Enter Salary" value="${allEmployeeDto.salaryExpected}">
 				--%>
				</div>				
							
			</div>
	   
	    	</div>
	    	</div>
	   

	     
	     
<!--------------------------------------------------  Official link to table--------------------------------- --> 	    
	    
	    <%-- <div class="col-md-12">
	       
				<div class="form-group">
					 <div class="col-md-3">
    					<label>Location :</label>
    						<f:select id="masLocation" path="masLocation"  class="form-control" value="TH">
							 	 <f:option  value="-1" label="--Select Location--" />
  								 <f:options items="${ locationList }"  itemValue="code" itemLabel="name" />
							</f:select>
						</div> 
						
  				</div>
			
	    </div> --%>
	    
	    <div class="row">
	      <div class="col-md-12">
	         
				<div class="form-group">
						<div class="col-md-6">
    						<label style="margin-right: 25px;"> <spring:message code="official.startWorkDate"></spring:message> :</label> 
    						<div class='input-group date' id='startWorkDate'><input type="text" class="form-control"
							id="startWorkDate" name="startWorkDate" placeholder="${enter} <spring:message code="official.startWorkDate"></spring:message>" 
							value='<fmt:formatDate pattern="dd-MM-yyyy" value="${allEmployeeDto.startWorkDate}"/>'  />
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span>
							</span></div></div>
						
						
						<div class="col-md-6">
    						<label style="margin-right: 25px;"> <spring:message code="official.endWorkDate"></spring:message> :</label>
    						<div class='input-group date' id='endWorkDate'>
    						<input type="text" class="form-control"
							id="endWorkDate" name="endWorkDate" placeholder="${please} ${enter} <spring:message code="official.endWorkDate"></spring:message>" 
							value='<fmt:formatDate pattern="dd-MM-yyyy" value="${allEmployeeDto.endWorkDate}"/>' />
						    <span class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
						
						
						<%-- ${allEmployeeDto.endWorkDate} --%> 


					  <%-- 	<div class="col-md-3">
    						<label> Start Work Date :</label> <input type="text" class="form-control"
									id="startWorkDate" name="startWorkDate" placeholder="Enter Start Work Date" value="${allEmployeeDto.startWorkDate}">
						</div>
						
						<div class="col-md-3">
    						<label> End Work Date :</label> <input type="text" class="form-control"
									id="endWorkDate" name="endWorkDate" placeholder="Enter End Work Date" value="${allEmployeeDto.endWorkDate}">
						</div> --%>


  				</div>
			</div>
	    </div>
	    </div>
	    
	    <div class="row">
	     <div class="col-md-12">
	       
				<div class="form-group">
					 <div class="col-md-6">
    					<label style="margin-right: 25px;"><spring:message code="employee.masEmployment"></spring:message> :</label>
    					
    						<f:select  id="masEmployment" path="masEmployment"  class="form-control">
    						
    						<option  value=""><spring:message code="employee.enter.employment"></spring:message></option>
  							<f:options items="${ employmentList }"  itemValue="id" itemLabel="name" />
    						
								
							</f:select>
						</div> 
						
						<div class="col-md-6">
    						<label style="margin-right: 25px;"><spring:message code="employee.masDivision"></spring:message> :</label>
    						
    						<f:select  id="masDivision" path="masDivision"  class="form-control">
    						
	    						<option  value=""><spring:message code="employee.enter.division"></spring:message></option>
	  							<f:options items="${ divisionList }"  itemValue="id" itemLabel="name" />
	    						
								
							</f:select>
    						
    						
						</div>
						
  				</div>
			
	    </div>
	    </div>
	    
	    <div class="row">
	     <div class="col-md-12">
	         
				<div class="form-group">
						
						
						
						<div class="col-md-6">
    						<label style="margin-right: 25px;"><spring:message code="employee.masStaffType"></spring:message> :</label>
    						
    						<f:select  id="masStaffType" path="masStaffType"  class="form-control">
    						
	    						<option  value=""><spring:message code="employee.enter.staffType"></spring:message></option>
	  							<f:options items="${ staffTypeList }"  itemValue="id" itemLabel="name" />
	    						
								
							</f:select>
    						
  				</div>
  				
  				<div class="col-md-6">
    						<label style="margin-right: 25px;"><spring:message code="employee.masJoblevel"></spring:message> :</label>
    						
    						<f:select  id="masJoblevel" path="masJoblevel"  class="form-control" >
    						
	    						<option  value=""><spring:message code="employee.enter.joblevel"></spring:message></option>
	  							<f:options items="${ joblevelList }"  itemValue="id" itemLabel="name" />
	    						
								
							</f:select>
    						
						</div>
			
	    </div>
	    </div>
	    </div>
	    
	    <div class="row">
	    <div class="col-md-12">
	         
				<div class="form-group">
						
						
						<div class="col-md-6">
    						<label style="margin-right: 25px;"><spring:message code="employee.masCoreSkill"></spring:message> :</label>
    						
    						 <f:select  id="masCoreSkill" path="masCoreSkill"  class="form-control">
    						 
    						 	<option  value=""><spring:message code="employee.enter.coreSkill"></spring:message></option>
	  							 <f:options items="${ coreskillList }"  itemValue="id" itemLabel="name" /> 
	    						 
								
							</f:select> 
    						
    						
						</div>
						
						<div class="col-md-6">
    						<label style="margin-right: 25px;"><spring:message code="employee.technology"></spring:message> :</label>
    						
    						<f:select  id="technology" path="technology"  class="form-control">
    						 
	    						 <option  value=""><spring:message code="employee.enter.technology"></spring:message></option>
	  							 <f:options items="${ technologyList }"  itemValue="id" itemLabel="name" />
	    						  
								
							</f:select>  
    						
    						
						</div>
  				</div>
			
	    </div>
	    </div>
	    
	    <div class="row">
	      <div class="col-md-12">
	         
				<div class="form-group">
				
				<div class="col-md-6">
				<label> <spring:message code="label.aim"></spring:message> :</label>
								<div class="checkbox">
     								
     							<c:if test="${empty allEmployeeDto.isManager}">
     								<label style="margin-right: 25px;"><input type="checkbox" value = "1" name="isManager"><spring:message code="label.ismanager"></spring:message></label>
								</c:if>
								<c:if test="${not empty allEmployeeDto.isManager}">
     								<label style="margin-right: 25px;"><input type="checkbox" value = "1" name="isManager" checked="checked"><spring:message code="label.ismanager"></spring:message></label>
								</c:if>
								
								</div>
			</div>
			
			
			<div class="col-md-6">
						

						<label style="margin-right: 25px;"> <spring:message code="employee.probationdate"></spring:message> :</label> 
						<div class='input-group date' id='probationDate'>
						<input type="text" class="form-control"
									id="probationDate" name="probationDate" placeholder="${please} ${enter} <spring:message code="employee.probationdate"></spring:message>" 
									value='<fmt:formatDate pattern="dd-MM-yyyy" value="${allEmployeeDto.probationDate}"/>' />


						<%-- <label> Probation Date :</label> <input type="text" class="form-control"
							 id="probationDate" name="probationDate" placeholder="Enter Probation Date" value="${allEmployeeDto.probationDate}">
						 --%>


					<span class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
				</div>

  				</div>
			
	    </div>
	    </div>
	    
	    <div class="row">
	    <div class="col-md-12">
	    <div class="form-group">
	    <div class="col-md-6">
    				
    			<%-- <label>AIM : ${aimList.size()}</label> --%>


				<%-- <div class="form-group">					
    			<label>AIM :${aimList.size()}</label> --%>
						<label style="margin-right: 25px;"><spring:message code="label.aim"></spring:message> : </label>
    				  <f:select  path="aimempid"  class="form-control">
    						 
    						 <f:option  value=""><spring:message code="employee.enter.aim"></spring:message></f:option>
  							 <f:options items="${ aimList }"  itemValue="id" itemLabel="name_eng" />
    						  
								
							</f:select>  
    				</div>
    				
    				
    			<div class="col-md-6">
									<label style="margin-right: 25px;"> <spring:message code="official.registerDate"></spring:message> :</label> 

									<div class='input-group date' id='officialDate'>
									<input type="text" class="form-control" id="officialDate" name="officialDate" placeholder="${enter} <spring:message code="official.registerDate"></spring:message>" 
									value='<fmt:formatDate pattern="dd-MM-yyyy" value="${allEmployeeDto.officialDate}"/>' />
								    <span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
									</span></div></div>	
    				
    				
    				
	    </div>
	    </div>
	    </div>
	    

	<div class="form-group row">
			<div class="col-md-12" align="right">
				<button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 15px;"><spring:message code="label.cancel" /></button>
    			<!-- <button type="button" class="btn btn-primary saveButton">Save</button> -->
    			<button type="button" id="saveButton" class="btn btn-warning" name="saveButton" ><spring:message code="label.saveAndCon" /></button>
    			
	    	</div>
	</div>

</f:form>   

<!----------------------------------------------------------- Modal Address --------------------------------------------------->
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel"><spring:message code="address.name"></spring:message></h4>
					</div>
					<div class="modal-body">
						
					 <form id="validateAddress" name="validateAddress"> 
						<div class="form-group">
	    					<label><spring:message code="address.type"></spring:message> :</label>
	    
							<div class="form-group">
		 					 <select class="form-control" id="addressType" name="addressType">
								<option value="" label="<spring:message code="address.enter.selectaddresstype"></spring:message>" />
								<c:forEach var="obj" items="${ masAddressTypeList }">
									<option value="${obj.id }">${ obj.name}</option>
								</c:forEach>
							</select>
							</div>
	  				
							

							<div class="form-group">
								<label><spring:message code="address.address1"></spring:message>:</label>
								<textarea class="form-control" rows="1" id="address1" name="address1" placeholder="${please} ${enter} <spring:message code="address.address1"></spring:message>"></textarea>
							</div>


							<div class="form-group">
								<label><spring:message code="address.address2"></spring:message>:</label>
								<textarea class="form-control" rows="1" id="address2" name="address2" placeholder="${please} ${enter} <spring:message code="address.address2"></spring:message>"></textarea>
							</div>


						
 					 <div class="form-group">
	    				<label><spring:message code="address.province"></spring:message> :</label>
	    
	    
						
		 					 <select  class="form-control" id="province" name="province">
								<option value="" label="<spring:message code="address.enter.province"></spring:message>" />
								<c:forEach var="obj" items="${ provinceList }">
									<option value="${obj.id }">${ obj.name}</option>
								</c:forEach>
							</select>
						
	  				</div> 

							<div class="form-group">
								<label><spring:message code="address.zipcode"></spring:message>:</label>
								<textarea class="form-control" rows="1" id="zipcode" name="zipcode" placeholder="${please} ${enter} <spring:message code="address.zipcode"></spring:message>"></textarea>
							</div>

						
						</div>
						
						
						
					 </form> 
					</div>
					<div class="modal-footer">
							<button type="button" class="btn btn-default closeAddressButton" 
								data-dismiss="modal"><spring:message code="label.close"></spring:message></button>
							<button type="button" id= "saveAddressButton" name="saveAddressButton" class="btn btn-primary saveAddressButton"><spring:message code="label.saveAndCon"></spring:message></button>
						</div>
				</div>
	    	</div>
	</div>    
	 
	    
<!------------------------------------------------- Modal Delete --------------------------------------------->

<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title" id="deleteModalLabel"><spring:message code="label.delete" /><spring:message code="address.name" /></h4>
      </div>
      <div class="modal-body">
      	<spring:message code="default.delete.confirm"></spring:message>
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="default.no" /></button>
      <button type="button"id="yesButton" class="btn btn-primary yesButton"><spring:message code="default.yes" /></button>
      </div>
    </div>
  </div>
</div>    


	

<!---------------------------------------------------------- Start JQuery ----------------------------------------------------->	  
	    
<script type="text/javascript">
var dt;
var rowUpdate;
var dataUpdate;
var getIndex = 0;

	$(document).ready(function() {

		
		$("#telHome").mask("99-999-9999");
		$("#telMobile").mask("999-999-9999");
		$("#telFax").mask("99-999-9999");
		$("#idCard").mask("9-9999-99999-99-9");
		$("#emergencyContactPhoneNumber").mask("999-999-9999"); 
		
		$('#salaryExpected').mask('0,000,000.00', {reverse: true});
		
//------------------------------------------------------ Validate --------------------------------------------------------------------------------------------

$(".closeAddressButton").off("click").on("click",function() {
	//$('#validateAddress').bootstrapValidator('resetForm', true);
});
		
		
$("#validateAddress").validate({
	rules: {
		addressType: "required",
		address1: "required",
		address2: "required",
		province: "required",
		zipcode: {
			required: true,
			 digits: true,
			 rangelength : [5, 5]
		}
		
	},
	messages: {
		addressType: "<spring:message code="address.required.addressType" />",
		address1: "<spring:message code="address.required.address" />",
		address2: "<spring:message code="address.required.address" />",
		province: "<spring:message code="address.required.province" />",
		zipcode: "<spring:message code="address.required.zipcode" />"
		
	}
});		
		
		
$("#addForm").validate({
	rules: {
		nameThai: "required",
		surnameThai: "required",
		nicknameThai: "required",
		nameEng: "required",
		surnameEng: "required",
		nicknameEng: "required",
		congenitalDisease: "required",
		hospital: "required",
		
		emergencyContact: "required",
		relationshipWithEmergencyContact: "required",
		emergencyContactAddress: "required",
		dateOfBirth: "required",
		placeOfBirth: "required",
		fromYear: "required",
		toYear: "required",
		
		religion: "required",
		issuedOffice: "required",
		expiryDate: "required",
		
		sex:{ required:true},
		maritalStatus:{ required:true},
		spouseName: "required",
		marriageCertificateNo: "required",
		
		issuedOffice2: "required",
		address: "required",
		occupation: "required",
		militaryServiceYes: "required",
		descriptionYes: "required",
		
		branchOfService: "required",
		serviceNo: "required",
		reasonsNo: "required",
		dateToBeDrafted: "required",
		previousEmpreasonsNo: "required",
		
		officialDate: "required",
		startWorkDate: "required",
		endWorkDate: "required",
		positionAppliedFor: "required",
		
		probationDate: "required",
		masEmployment: "required",
		masCoreSkill: "required",
		masLocation: "required",
		masDivision: "required",
		
		masJoblevel: "required",
		technology: "required",
		masStaffType: "required",
		
		email: {
			required: true,
			email: true
		}, 
		
	 	telHome: {
			required: true,
			rangelength : [11, 11]
			/*  digits: true, 
			 minlength: 9,
			 maxlength: 9  */ 
			 
		}, 
		
		telMobile: {
			required: true,
			rangelength : [12, 12]
			 /* digits: true,
			 minlength: 10,
			 maxlength: 10 */
		},
		
		telFax: {
			required: true,
			rangelength : [11, 11]
			 /* digits: true,
			 minlength: 10,
			 maxlength: 10 */
		},
		
		idCard: {
			required: true,
			rangelength : [17, 17]
			 /* digits: true,
			 minlength: 13,
			 maxlength: 13 */
		},
		
		age: {
			required: true,
			 digits: true,
			 minlength: 2
		},
		
		height: {
			required: true,
			 digits: true
		},
		
		weigth: {
			required: true,
			 digits: true
		},
		
		emergencyContactPhoneNumber: {
			required: true,
			rangelength : [12, 12]
			 /* digits: true,
			 minlength: 10,
			 maxlength: 10 */
		},
		
		numberOfChildren: {
			required: true,
			 digits: true
		},
		
		salaryExpected: {
			required: true
			 /* digits: true */
		}
	
	},
	
	messages: {
		nameThai: "<spring:message code="employee.required.nameThai" />",
		surnameThai: "<spring:message code="employee.required.surnameThai" />",
		nicknameThai: "<spring:message code="employee.required.nicknameThai" />",
		nameEng: "<spring:message code="employee.required.nameEng" />",
		surnameEng: "<spring:message code="employee.required.surnameEng" />",
		nicknameEng: "<spring:message code="employee.required.nicknameEng" />",
		
		email: "<spring:message code="employee.required.email" />",
		telHome: "<spring:message code="employee.required.telHome" />",
		telMobile: "<spring:message code="employee.required.telMobile" />",
		telFax: "<spring:message code="employee.required.telFax" />",
		congenitalDisease: "<spring:message code="employee.required.congen" />",
		hospital: "<spring:message code="employee.required.hospital" />",
		
		emergencyContact: "<spring:message code="employee.required.emergencyContact" />",
		relationshipWithEmergencyContact: "<spring:message code="employee.required.relation" />",
		emergencyContactAddress: "<spring:message code="employee.required.emergencyAddress" />",
		emergencyContactPhoneNumber: "<spring:message code="employee.required.emergencyConPhoneNum" />",
		dateOfBirth: "<spring:message code="employee.required.dob" />",
		fromYear: "<spring:message code="employee.required.fromYear" />",
		
		toYear: "<spring:message code="employee.required.toYear" />",
		placeOfBirth: "<spring:message code="employee.required.pob" />",
		age: "<spring:message code="employee.required.age" />",
		religion: "<spring:message code="employee.required.religion" />",
		idCard: "<spring:message code="employee.required.idCard" />",
		issuedOffice: "<spring:message code="employee.required.issuedOffice" />",
		
		expiryDate: "<spring:message code="employee.required.expiryDate" />",
		height: "<spring:message code="employee.required.height" />",
		weigth: "<spring:message code="employee.required.weigth" />",
		sex: "<spring:message code="employee.required.sex" />",
		maritalStatus: "<spring:message code="employee.required.maritalStatus" />",
		numberOfChildren: "<spring:message code="employee.required.Children" />",
		
		spouseName: "<spring:message code="employee.required.spouseName" />",
		marriageCertificateNo: "<spring:message code="employee.required.marcert" />",
		issuedOffice2: "<spring:message code="employee.required.issuedOffice" />",
		address: "<spring:message code="employee.required.address" />",
		occupation: "<spring:message code="employee.required.occupation" />",
		militaryServiceYes: "<spring:message code="employee.required.militaryServiceYes" />",
		
		descriptionYes: "<spring:message code="employee.required.pleasewrite" />",
		branchOfService: "<spring:message code="employee.required.branchOfService" />",
		serviceNo: "<spring:message code="employee.required.serviceNo" />",
		reasonsNo: "<spring:message code="employee.required.reasons" />",
		dateToBeDrafted: "<spring:message code="employee.required.datedrafted" />",
		previousEmpreasonsNo: "<spring:message code="employee.required.givethereason" />",
		
		officialDate: "<spring:message code="official.required.officialDate" />",
		startWorkDate: "<spring:message code="official.required.startWorkDate" />",
		endWorkDate: "<spring:message code="official.required.endWorkDate" />",
		positionAppliedFor: "<spring:message code="official.required.position" />",
		salaryExpected: "<spring:message code="official.required.salary" />",
		probationDate: "<spring:message code="employee.required.probationdate" />",
		
		masEmployment: "<spring:message code="employee.required.employment" />",
		masCoreSkill: "<spring:message code="employee.required.coreSkill" />",
		masLocation: "<spring:message code="employee.required.location" />",
		masDivision: "<spring:message code="employee.required.division" />",
		masJoblevel: "<spring:message code="employee.required.joblevel" />",
		technology: "<spring:message code="employee.required.technology" />",
		masStaffType: "<spring:message code="employee.required.staffType" />"
		
		
		
	}
});		
	

/* -------------------------------------------- Validate CheckBox ----------------------------------------------------------- */	
$("#descriptionNewspaper").hide();//descriptionYes ชื่อกล่อง
$("input:checkbox[name=knowAugNewspaper]").change(function(){//name= ชื่อ group checkbox

	if(this.value == 'Newspaper' && this.checked){
	 $("#descriptionNewspaper").show();
	}else{
	$("#descriptionNewspaper").hide();
}
});

$("#descriptionMagazine").hide();//descriptionYes ชื่อกล่อง
$("input:checkbox[name=knowAugMagazine]").change(function(){//name= ชื่อ group checkbox

	if(this.value == 'Magazine' && this.checked){
	 $("#descriptionMagazine").show();
	}else{
	$("#descriptionMagazine").hide();
}
});

$("#descriptionWebsite").hide();//descriptionYes ชื่อกล่อง
$("input:checkbox[name=knowAugWebsite]").change(function(){//name= ชื่อ group checkbox

	if(this.value == 'Website' && this.checked){
	 $("#descriptionWebsite").show();
	}else{
	$("#descriptionWebsite").hide();
}
});

$("#descriptionFriend").hide();//descriptionYes ชื่อกล่อง
$("input:checkbox[name=knowAugFriend]").change(function(){//name= ชื่อ group checkbox

	if(this.value == 'Friend' && this.checked){
	 $("#descriptionFriend").show();
	}else{
	$("#descriptionFriend").hide();
}
});


$("#descriptionOther").hide();//descriptionYes ชื่อกล่อง
$("input:checkbox[name=knowAugOther]").change(function(){//name= ชื่อ group checkbox

	if(this.value == 'Other' && this.checked){
	 $("#descriptionOther").show();
	}else{
	$("#descriptionOther").hide();
}
});


		

/* -------------------------------------------- Validate radio Yes/No ----------------------------------------------------------- */		

$("#descriptionYes").hide();//descriptionYes ชื่อกล่อง
$("input:radio[name=knowEmployed]").change(function(){//name= ชื่อ group radio

	if(this.value == 'Yes' && this.checked){
	 $("#descriptionYes").show();
	}else{
	$("#descriptionYes").hide();
}
});


if($('#knowEmployed').val()=="Yes"){
	$("#descriptionYes").show();
	
}else if($('#knowEmployed').val()=="No"){
	$("#descriptionYes").hide();
	
}



$("#fromYear").hide();//descriptionYes ชื่อกล่อง
$("#toYear").hide();
$("#branchOfService").hide();
$("#serviceNo").hide();
$("input:radio[name=militaryService]").change(function(){//name= ชื่อ group radio

	if(this.value == 'Yes' && this.checked){
	 $("#fromYear").show();
	 $("#toYear").show();
	 $("#branchOfService").show();
	 $("#serviceNo").show();
	 
	}else{
		 $("#fromYear").hide();
		 $("#toYear").hide();
		 $("#branchOfService").hide();
		 $("#serviceNo").hide();
  }
});


if($('#militaryService').val()=="Yes"){
	 $("#fromYear").show();
	 $("#toYear").show();
	 $("#branchOfService").show();
	 $("#serviceNo").show();
	
	
}else if($('#knowEmployed').val()=="No"){
	 $("#fromYear").hide();
	 $("#toYear").hide();
	 $("#branchOfService").hide();
	 $("#serviceNo").hide();
	
}



$("#reasonsNo").hide();//descriptionYes ชื่อกล่อง
$("#dateToBeDrafted").hide();
$("input:radio[name=militaryService]").change(function(){//name= ชื่อ group radio

if(this.value == 'No' && this.checked){
	 $("#reasonsNo").show();
	 $("#dateToBeDrafted").show();
	 
	}else{
		$("#reasonsNo").hide();
		$("#dateToBeDrafted").hide();
}
});

if($('#militaryService').val()=="No"){
	 $("#reasonsNo").show();
	 $("#dateToBeDrafted").show();
	
	
}else if($('#knowEmployed').val()=="Yes"){
	 $("#reasonsNo").hide();
	 $("#dateToBeDrafted").hide();
	
}




$("#previousEmpreasonsNo").hide();//descriptionYes ชื่อกล่อง
$("input:radio[name=previousEmployer]").change(function(){//name= ชื่อ group radio

	if(this.value == 'No' && this.checked){
	 $("#previousEmpreasonsNo").show();
	}else{
	$("#previousEmpreasonsNo").hide();
}
});
		
if($('#previousEmployer').val()=="No"){
	$("#previousEmpreasonsNo").show();
	
}else if($('#previousEmployer').val()=="Yes"){
	$("#previousEmpreasonsNo").hide();
	
}
		
		
		var date1 = $( "#dateOfBirth" ).datetimepicker({
			format : "DD-MM-YYYY",
			viewMode : 'years'
		});
		
    	var date2 = $( "#expiryDate" ).datetimepicker({
    		format : "DD-MM-YYYY",
//     		viewMode : 'years'
		});
    	
    	var date3 = $( "#fromYear" ).datetimepicker({
    		format : "DD-MM-YYYY",
    		//viewMode : 'years'
		});
    	
    	var date4 = $( "#toYear" ).datetimepicker({
    		format : "DD-MM-YYYY",
//     		viewMode : 'years'
		});
    	
    	var date5 = $( "#dateToBeDrafted" ).datetimepicker({
    		format : "DD-MM-YYYY",
//     		viewMode : 'years'
		});
    	
    	var date6 = $( "#officialDate" ).datetimepicker({
    		format : "DD-MM-YYYY",
//     		viewMode : 'years'
		});
    	
    	var date6 = $( "#startWorkDate" ).datetimepicker({
    		format : "DD-MM-YYYY",
//     		viewMode : 'years'
		});
    	
    	var date6 = $( "#endWorkDate" ).datetimepicker({
    		format : "DD-MM-YYYY",
//     		viewMode : 'years'
		});
    	
    	var date6 = $( "#probationDate" ).datetimepicker({
    		format : "DD-MM-YYYY",
//     		viewMode : 'years'
		});
    	
	
		
    	$('[name="saveButton"]').click(function() {
    				
    		
    		
			/* if($('.dataTables_empty').length >0){//ถ้าตารางว่าง check ค่าในตาราง address
				
					alert("dataTables  empty");//alertในกรณีที่ค่าในตารางว่าง
				
			if($('#addForm').valid()){//validate form ใหญ่ว่าถ้าตารางว่างให้ดัก ข้อมูลทั้งหมดว่ามีค่าหรือไม่ ถ้ามีค่า ให้ alert เเจ้งเตือนขึ้นเเล้วไปดูค่าในตาราง
    				
					//document.getElementById("addForm").submit(); //java script
				}
		
			else {alert("Data Empty");}//ถ้าไม่มีข้อมูลจะเข้า else alert เเจ้งเตือน
			}
			
		else{//ในกรณีที่ ค่าในตารางไม่ว่าง ก้ให้ไปเช็คค่าข้อมูล
			
			if($('#addForm').valid()){//validate form ใหญ่ว่าถ้าตารางว่างให้ดัก ข้อมูลทั้งหมดว่ามีค่าหรือไม่ ถ้ามีค่า ให้ alert เเจ้งเตือนขึ้นเเล้วไปดูค่าในตาราง
		
		//document.getElementById("addForm").submit(); //java script
				
			$('#addForm').prop('action', "${pageContext.request.contextPath}/employee/submit");
			$('#addForm').get(0).submit(); //jquery
			
			}
		} */
    		
    		
    		
    		 alert("aaaa");
			
			$('[name="employeeForm"]').attr('action',
					"${pageContext.request.contextPath}/employee/submit");
			$('[name="employeeForm"]').submit(); 
		});
    	
    	 dt=$("#tbResult").dataTable( 
    		 	 { 
    		 		"searching": false,
    				"bLengthChange": false,
    				"iDisplayLength": 10,
    				"pagingType": "simple_numbers",
    				"ordering": false,
    				"info": false,
    				"paging": false,
    		 		 
    		 	 
    		 		 "columnDefs": [
    	    	                  {
    	    	                     "targets": [ 0 ],
    	    	                     "visible": false
    	    	                 },
    	    	                 {
    	    	                     "targets": [ 1 ],
    	    	                     "visible": false
    	    	                 },
    	    	                 
    	    	                  {
    	    	                     "targets": [ 5 ],
    	    	                     "visible": false
    	    	                 }, 
    	    	                 
    	    	                 {
    	    	                     "targets": [ 7 ],
    	    	                     "visible": false
    	    	                 },
    	    	                 
    	    	                 {
    	    	                     "targets": [ 8 ],
    	    	                     "visible": false
    	    	                 },
    	    	                 
    	    	                 {
    	    	                     "targets": [ 10 ],
    	    	                     "visible": false
    	    	                 }     	    	                 
    	    	           ]  
    			
    			} ); 
    	 
          	 
    	
 		//listAll();
		//$('input[type=file]').change(function(e){
		//$('.element-to-paste-filename').attr('value',e.target.files[0].name);
		//});

			    	
		
/* 	 	$("#nameThai").val('bbb');
		$("#surnameThai").val('aaa');
		$("#nicknameThai").val('nnn');
		$("#nameEng").val('mmm');
		$("#surnameEng").val('ppp');
		$("#nicknameEng").val('aaa');
		$("#email").val('bb@hotmail.com');
		$("#telHome").val('02356995');
		$("#telMobile").val('02445533');
		$("#telFax").val('0235996');
		$("#congenitalDisease").val('help');
		$("#hospital").val('rama');
		$("#emergencyContact").val('bbaa');
		$("#relationshipWithEmergencyContact").val('mom');
		$("#emergencyContactAddress").val('adcd');
		$("#emergencyContactPhoneNumber").val('0235660');
		//$("#dateOfBirth").val(),
		$("#placeOfBirth").val('home');
		$("#age").val(25);
		$("#religion").val('christ');
		$("#idCard").val(122233333333);
		$("#issuedOffice").val('bnn');
		//$("#expiryDate").val(),
		$("#height").val(160);
		$("#weigth").val(45);
		$("#Female").prop('checked','checked');
		$("#Married").prop('checked','checked');
		$("#numberOfChildren").val('5');
		$("#spouseName").val('num');
		$("#marriageCertificateNo").val('2');
		$("#issuedOffice2").val('aa');
		$("#address").val('aaa/bb');
		$("#occupation").val('vvvv');
		$("#Newspaper").prop('checked','checked');
		$("#descriptionNewspaper").val('nn');
		$("#Magazine").prop('checked','checked');
		$("#descriptionMagazine").val('doo');
		$("#Website").prop('checked','checked');
		$("#descriptionWebsite").val('vv');
		$("#Friend").prop('checked','checked');
		$("#descriptionFriend").val('aa');
		$("#Other").prop('checked','checked');
		$("#descriptionOther").val('ll');
		$("#Yes").prop('checked','checked');
		$("#descriptionYes").val('yes');
		$("#No").prop('checked','checked');
		//$("#militaryServiceYes").prop('checked','checked');
		//$("#fromYear").val(),
		//$("#toYear").val(),
		$("#branchOfService").val('gg');
		$("#serviceNo").val('aa');
		//$("#militaryServiceNo").prop('checked','checked');
		$("#reasonsNo").val('bbb');
		//$("#dateToBeDrafted").val();
		$("#previousEmployerYes").prop('checked','checked');
		$("#previousEmployerNo").prop('checked','checked');
		$("#previousEmpreasonsNo").val('n');
		$("#statusemp").val('office');  */

		
		
			    	  
			    
			           $("#masLocation").change(function() {
			    	   alert('bb');
			    	   var code = $("#masLocation").val();
			    	   alert(code);
			    	   $('#employeeCodeForShow').val(''); 
			  	       $('#employeeCode').val(''); 

			    	   
			    	   
			    	
			    	 <%--  $.ajax({  
				  	      type : "POST",   
				  	      url : "<%=request.getContextPath()%>/employee/findRunningNo/"+code,   
				  	      //data:  JSON.stringify(id),
				  	      dataType : 'json', 
				  	      contentType :"application/json; charset=utf-8",
				  	     
				  	      success : function(data) {  
				    		
				  	        $('#employeeCodeDto').val(data.rungingNumber);
				  	    	
					    	  
					    	  var empCode = parseInt($('#employeeCodeDto').val())+1;
					    	
					    		  
					    		  if($('#employeeCodeDto').val()==null&&$('#employeeCodeDto').val()===" "){
					    		  
					    		  	$('#employeeCode').val(code+'10'+'001');
					    		  	$('#employeeCodefalse').val(code+'10'+'001');
					    		  
					    		  }else if(empCode.toString().length==1){
					    			  $('#employeeCode').val(code+'10'+'00' +empCode.toString());
					    			  $('#employeeCodefalse').val(code+'10'+'00' +empCode.toString());
					    			  
					    		  }else if(empCode.toString().length==2){
					    			 
					    			  $('#employeeCode').val(code+'10'+'0'+empCode.toString());
					    			  $('#employeeCodefalse').val(code+'10'+'0'+empCode.toString());
					    			  
					    		  }else if(empCode.toString().length==3){
					    			  $('#employeeCode').val(code+'10'+empCode.toString());
					    			  $('#employeeCodefalse').val(code+'10'+empCode.toString());
					    			  
					    		  }
					    		  
					  	    	 
				  	     },  
				  	      error : function(e) {  	
				  	    	  
				  	    	  alert(e);
				  	    	
				  	     }  
				  	    }); --%>
			    	  

			    }); 
			       
			});
		

	
	

 		
 			$("#uploadFile").on("change", function()
		    {
		        var files = !!this.files ? this.files : [];
		        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

		        if (/^image/.test( files[0].type)){ // only image file
		            var reader = new FileReader(); // instance of the FileReader
		            reader.readAsDataURL(files[0]); // read the local file

		            reader.onloadend = function(){ // set image data as background of div
		            	
		                $("#imagePreview").css("background-image", "url("+this.result+")");
   	              }
		        }
		        
		    });
 		
 		
 		
    		
    		
    $('body').on('click','#addaddress', function() {
    	
    		
  		$("#saveAddressButton").off("click").on("click", function()
  				
  		{
  			if($("#validateAddress").valid()
  		){
   				
  			addAddress();
  			}
			
		});
    		
    });		
    		
    	

        $("#myModal").on("hide.bs.modal", function(event){
        	
        	clearDataModal();
       
        });
    		
    		
    
    	$("#deleteModal").on("show.bs.modal", function(event){
   	    	  
 	    	    var button = $(event.relatedTarget);
 	    		var idDelete = button.data("iddelete"); 
 	    		
 	     		
 	    		$(this).find("#delete").off("click").on("click", function()
 	    		{
 	    			doDeleteDataPost(idDelete);
 	    		});
 	    	  
 	      });
  		
  		
 /* --------------------------------------------------- Clear Address Function --------------------------------------------------- */	  		
  		function clearDataModal(){
  			
  			$('#addressType').val('');
  			$('#address1').val('');
  			$('#address2').val('');
  			$("#province").val('');
  			$('#zipcode').val('');
  			
  		}

   
   	/* ----------------------------------------------------- Add Address Function --------------------------------------------------- */		
			
			function addAddress() {
				alert("Do you want to Add Address ?"); 
				
 				 var addressId = $("#addressType").val();
				 var addressType = $("#addressType option:selected").text();
				 
				 var address1 = $("#address1").val();
				 var address2 = $("#address2").val();
				 
				 var provinceId = $("#province").val();
				 var province = $("#province option:selected").text();
				 
				 var zipcode= $("#zipcode").val();
				 
				 var id=0;
				 var status="add";
				 
				  dt.fnAddData([  id, 
				                  addressId,
				                  addressType,
					              address1,
					              address2,
					              provinceId,
					              province,
					              zipcode,
					              getIndex,
					              
					              '<button id="edit" type="button" class="btn btn-warning btn-sm active"  data-target="#addModal" style="margin-right :15px;" data-toggle="modal"><spring:message code="label.edit" /></button>'+
				    			  '<button id="delete" type="button" class="btn btn-danger btn-sm active" data-target="#deleteModal" data-toggle="modal"><spring:message code="label.delete" /></button>',
				    			 
				    			  status
				    				
			   	 ]); 
				  
				  
				  $('<input>').attr({
					    type: 'hidden',
					    id: 'dataaddressid'+getIndex,
					    name: 'addressList['+getIndex+'].id',
					    value: id
					}).appendTo('form');
				  
				  
				  $('<input>').attr({
					    type: 'hidden',
					    id: 'dataaddresstype'+getIndex,
					    name: 'addressList['+getIndex+'].addressTypeId',
					    value: addressId
					}).appendTo('form');
				  
				  $('<input>').attr({
					    type: 'hidden',
					    id: 'dataaddress1'+getIndex,
					    name: 'addressList['+getIndex+'].address1',
					    value: address1
					}).appendTo('form');
				  
				  $('<input>').attr({
					    type: 'hidden',
					    id: 'dataaddress2'+getIndex,
					    name: 'addressList['+getIndex+'].address2',
					    value: address2
					}).appendTo('form');
				  
				  $('<input>').attr({
					    type: 'hidden',
					    id: 'dataprovinceid'+getIndex,
					    name: 'addressList['+getIndex+'].masprovinceId',
					    value: provinceId
					}).appendTo('form');
				  
				  $('<input>').attr({
					    type: 'hidden',
					    id: 'datazipcode'+getIndex,
					    name: 'addressList['+getIndex+'].zipcode',
					    value: zipcode
					}).appendTo('form');
				  
				  $('<input>').attr({
					    type: 'hidden',
					    id: 'datastatus'+getIndex,
					    name: 'addressList['+getIndex+'].status',
					    value: status
					}).appendTo('form');
				  
				 
				 
				  
				  getIndex = getIndex+1; 
				
				 
				  $('#myModal').modal('toggle');
				  clearDataModal();
				  //$('#validateAddress').bootstrapValidator('resetForm', true);
   	
   	    }
   	
   	
/* ----------------------------------------------------- Edit Address Function --------------------------------------------------- */		
		 	
			$('#tbResult tbody').on( 'click', '#edit', function (){		   
		    	
				
		    	  rowUpdate = $(this).parents('tr');
		    	  dataUpdate = dt.fnGetData($(this).parents('tr'));
		    	  //alert("data[1]: "+dataUpdate[1]); 
		    	
		    	  editAddress(rowUpdate,dataUpdate);
		    	    	  
		  }); 
   	
   	

   	
   	function editAddress(rowUpdate,dataUpdate){
   		
   		$('#myModal').modal('show');
   		
   		$("#addressType").val(dataUpdate[1]);
   		$("#address1").val(dataUpdate[3]);
   		$("#address2").val(dataUpdate[4]);
   		$("#province").val(dataUpdate[5]);
   		$("#zipcode").val(dataUpdate[7]);
   		
   		
   		$('#saveAddressButton').off("click").on("click",function(){
   			
   			/* $('[name="validateAddress"]').submit();
   			if($('#validateAddress').data('bootstrapValidator').isValid()){ */
	   			
	   			
   			
   		var id = dataUpdate[0];	
   		var addressId = $("#addressType").val();
		var addressType = $("#addressType option:selected").text();
		
   		var address1 = $("#address1").val();
   		var address2 = $("#address2").val();
   		
   	    var provinceId = $("#province").val();
	    var province = $("#province option:selected").text();
	    var zipcode= $("#zipcode").val();
	   
   		
	    
   		
   		if(dataUpdate[0]!=0){
   			
   			dt.fnUpdate(addressId, rowUpdate, 1);
   			dt.fnUpdate(addressType, rowUpdate, 2);
		    dt.fnUpdate(address1, rowUpdate, 3);
		    dt.fnUpdate(address2, rowUpdate, 4);
		    dt.fnUpdate(provinceId, rowUpdate, 5);
		    dt.fnUpdate(province, rowUpdate, 6);
		    dt.fnUpdate(zipcode, rowUpdate, 7);
		    dt.fnUpdate('edit', rowUpdate, 10);
		    
		    $("#dataaddressid"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].id");
		    $("#dataaddressid"+dataUpdate[8]).val(id);
		    
		    $("#dataaddresstype"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].addressTypeId");
		    $("#dataaddresstype"+dataUpdate[8]).val(addressId);
		    
		    $("#dataaddress1"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].address1");
		    $("#dataaddress1"+dataUpdate[8]).val(address1);
		    
		    $("#dataaddress2"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].address2");
		    $("#dataaddress2"+dataUpdate[8]).val(address2);
		    
		    $("#dataprovinceid"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].masprovinceId");
		    $("#dataprovinceid"+dataUpdate[8]).val(provinceId);
		    
		
		    $("#datazipcode"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].zipcode");
		    $("#datazipcode"+dataUpdate[8]).val(zipcode);
		    
		    $("#datastatus"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].status");
		    $("#datastatus"+dataUpdate[8]).val('edit');
		    
		    
		    
   	 }else{
   		 
   		dt.fnUpdate(addressId, rowUpdate, 1);
	    dt.fnUpdate(addressType, rowUpdate, 2);
	    dt.fnUpdate(address1, rowUpdate, 3);
	    dt.fnUpdate(address2, rowUpdate, 4);
	    dt.fnUpdate(provinceId, rowUpdate, 5);
	    dt.fnUpdate(province, rowUpdate, 6);
	    dt.fnUpdate(zipcode, rowUpdate, 7);
	    
	    $("#dataaddressid"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].id");
	    $("#dataaddressid"+dataUpdate[8]).val(id);
	    
	    $("#dataaddresstype"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].addressTypeId");
	    $("#dataaddresstype"+dataUpdate[8]).val(addressId);
	    
	    $("#dataaddress1"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].address1");
	    $("#dataaddress1"+dataUpdate[8]).val(address1);
	    
	    $("#dataaddress2"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].address2");
	    $("#dataaddress2"+dataUpdate[8]).val(address2);
	    
	    $("#dataprovinceid"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].masprovinceId");
	    $("#dataprovinceid"+dataUpdate[8]).val(provinceId);
	    
	
	    $("#datazipcode"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].zipcode");
	    $("#datazipcode"+dataUpdate[8]).val(zipcode);

   		
   	 }
   		
   		$('#myModal').modal('toggle');
   			
   		});
   	
   	
   	} 
   	
   	
   	
   	$('#tbResult tbody').on( 'click', '#delete', function (){	
   		
   	  var row = $(this).parents('tr');
      var dataDelete = dt.fnGetData($(this).parents('tr'));
      if(dataDelete[0]==0){
   	  
	   	 $('#yesButton').off("click").on("click",function(){ 
	   	  
		  dt.fnDeleteRow(row);
		
		  $( '#dataaddressid'+dataDelete[0] ).remove();
		  $( '#dataaddresstype'+dataDelete[0] ).remove();
		  $( '#dataaddress1'+dataDelete[0] ).remove();
		  $( '#dataaddress2'+dataDelete[0] ).remove();
		  $( '#dataprovinceid'+dataDelete[0] ).remove();
		  $( '#datazipcode'+dataDelete[0] ).remove();
		  $( '#datastatus'+dataDelete[0] ).remove();
		 
		 
		  $('#deleteModal').modal('toggle');
		  
	   	});
	 		
      }else{
    	  
    	  $('#yesButton').off("click").on("click",function(){ 
    		  
    		  alert(dataDelete[8]);
	    	  dt.fnUpdate('delete', row, 10);
	    	  $("#datastatus"+dataDelete[8]).attr('name', "addressList["+dataDelete[8]+"].status");
			  $("#datastatus"+dataDelete [8]).val('delete');
			  dt.fnDeleteRow(row);
			  $('#deleteModal').modal('toggle');

    	 	});
      }
   	 
   	 
   	clearDataModal();
 });
   	
   	
   	
   	
   	
   	
   	if($('#id').val()!=null||$('#id').val()!==""){
   		
   		
   	    listAddress($('#id').val());
   		
   	}		
   		
   		
   /* 	function ValidatePhone() {// validate เบอร์โทรศัพท์ 10 หลัก
	        var phoneRegExp = /^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/;
	        var phoneVal = $("#telHome").val();
	        var numbers = phoneVal.split("").length;
	        if (10 <= numbers && numbers <= 20 && phoneRegExp.test(phoneVal)) {
	            alert("success");
	         alert(phoneVal);
	      alert(numbers);
	  
	        }
	        } */
   		
   	
   	
   		function listAddress(id){
   			
//    			alert('list address: '+id);
				var status = 'unmodified';
   			
   			$.ajax({
				url : "${pageContext.request.contextPath}/employee/address/",
				data: JSON.stringify({"employeeId":id}),
				type : "POST",
				dataType : 'json', 
			  	//data : JSON.stringify({"id":id}),  
			  	contentType :"application/json; charset=utf-8",
				success : function(data) {
			    dt.fnClearTable();
				for (var i=0;i< data.length; i++) {
				
						dt.fnAddData([
						          data[i].id,
					              data[i].addressTypeId,
					              data[i].masaddresstypeName,
					              data[i].address1,
					              data[i].address2, 
					              data[i].masprovinceId, 
					              data[i].masprovinceName, 					              
					              data[i].zipcode,
					              getIndex,
						'<button id="edit" type="button" class="btn btn-warning btn-sm active" data-addId="' + data[i].id + '" data-target="#addModal" style="margin-right :15px; data-toggle="modal">Edit</button>'+
						'<button id="delete" type="button" class="btn btn-danger btn-sm active" data-addId="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>',
						 "unmodified",
						]);
					 
						
						  $('<input>').attr({
							    type: 'hidden',
							    id: 'dataaddressid'+getIndex,
							    name: 'addressList['+getIndex+'].id',
							    value: data[i].id
							}).appendTo('form');
						  
						  
						  $('<input>').attr({
							    type: 'hidden',
							    id: 'dataaddresstype'+getIndex,
							    name: 'addressList['+getIndex+'].addressTypeId',
							    value: data[i].addressTypeId
							}).appendTo('form');
						  
						  $('<input>').attr({
							    type: 'hidden',
							    id: 'dataaddress1'+getIndex,
							    name: 'addressList['+getIndex+'].address1',
							    value: data[i].address1
							}).appendTo('form');
						  
						  $('<input>').attr({
							    type: 'hidden',
							    id: 'dataaddress2'+getIndex,
							    name: 'addressList['+getIndex+'].address2',
							    value: data[i].address2
							}).appendTo('form');
						  
						  $('<input>').attr({
							    type: 'hidden',
							    id: 'dataprovinceid'+getIndex,
							    name: 'addressList['+getIndex+'].masprovinceId',
							    value: data[i].masprovinceId
							}).appendTo('form');
						  
						  $('<input>').attr({
							    type: 'hidden',
							    id: 'datazipcode'+getIndex,
							    name: 'addressList['+getIndex+'].zipcode',
							    value: data[i].zipcode
							}).appendTo('form');
						  
						  $('<input>').attr({
							    type: 'hidden',
							    id: 'datastatus'+getIndex,
							    name: 'addressList['+getIndex+'].status',
							    value: status
							}).appendTo('form');
						
						
						getIndex = getIndex+1; 
// 						alert(getIndex);
			
				  }
				},
				
				
				error : function(data,testStatus,jqXHR) {
					alert('err');
					$("#outputajax").text(testStatus);
					}
				}); 
		}
	
   	
	
  
  </script>