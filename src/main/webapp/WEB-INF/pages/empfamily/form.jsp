<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="<c:url value="/resources/bootstrap/js/jquery-1.11.2.min.js" />"></script>
<link href="<c:url value="/resources/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resources/bootstrap/js/bootstrap.js" />"></script>

 <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">ข้อมูลครอบครัว</h4>
      </div>
      <div class="modal-body">

      <f:form name="empFamilyForm" method="post" commandName="empFamily" class="form-horizontal" role="form">
      
      		
      		<c:choose>
			<c:when test="${ benefitClaim.cmd == 'update' }">
				<spring:message code="label.update" />
				<f:hidden path="empFamilyId"/>
			</c:when>
			<c:otherwise><spring:message code="label.add"/></c:otherwise>
		</c:choose>
      
	
		    <div class="form-group">
		      <label for="firstname" class="col-sm-2 control-label">First Name</label>
		      <div class="col-sm-4">
		        <f:input path="empFamilyFirstName" cssClass="form-control" />
		       <!--  <input type="text" class="form-control" id="firstname" placeholder="First Name"> -->
		      </div>
		    </div>
		
		    <div class="form-group">
		      <label for="lastname" class="col-sm-2 control-label">Last Name</label>
		      <div class="col-sm-4">
		        <input type="text" class="form-control" id="lastname" placeholder="Last Name">
		      </div>
		    </div>
		
		    <div class="form-group">
		
		    <label class="col-sm-2 control-label">Gender</label>
		
		    <div class="col-sm-4">
		      <div class="radio-inline">
		        <label>
		          <input type="radio" name="gender" id="male" value="male" checked> Male
		        </label>
		      </div>
		      <div class="radio-inline">
		        <label>
		          <input type="radio" name="gender" id="female" value="female"> FeMale
		        </label>
		      </div>
		    </div>
		  </div>
		
		
		  <div class="form-group">
		      <label for="age" class="col-sm-2 control-label">age</label>
		      <div class="col-sm-4">
		        <input type="number" class="form-control" id="age" placeholder="Age">
		      </div>
		  </div>
		
		
		  <div class="form-group">
		      <label for="mobile" class="col-sm-2 control-label">Mobile</label>
		      <div class="col-sm-4">
		        <input type="tel" class="form-control" id="mobile" placeholder="Mobile">
		      </div>
		  </div>
		
		
		  <div class="form-group">
		      <label for="address" class="col-sm-2 control-label">Address</label>
		      <div class="col-sm-4">
		        <textarea rows="3" id="address" class="form-control" placeholder="Address"></textarea>
		      </div>
		    </div>
		
		
		
		  <div class="form-group">
		      <label for="occupation" class="col-sm-2 control-label">Occupation</label>
		      <div class="col-sm-4">
		        <input type="text" class="form-control" id="occupation" placeholder="Occupation">
		      </div>
		  </div>
		
		
		  <div class="form-group">
		      <label for="position" class="col-sm-2 control-label">Position</label>
		      <div class="col-sm-4">
		        <input type="text" class="form-control" id="position" placeholder="Position">
		      </div>
		  </div>
		
		
		    <div class="form-group">
		        <label for="relation" class="col-sm-2 control-label">Relation</label>
		        <div class="col-sm-4">
		          <input type="text" class="form-control" id="relation" placeholder="Relation">
		        </div>
		    </div>
		
		    
		   <br/>
		
		    
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>


  </f:form>

