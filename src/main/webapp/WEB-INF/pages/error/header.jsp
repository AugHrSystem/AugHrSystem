<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>


<!-- jQuery -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>

<!-- Bootstrap -->
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>

<!-- Validator -->
<link href="<c:url value="/resource/bootstrapvalidator/dist/css/bootstrapValidator.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrapvalidator/dist/js/bootstrapValidator.js" />"></script>

<!-- JQuery Validator -->
<script src="<c:url value="/resource/jqueryvalidate/jquery.js" />"></script>
<script src="<c:url value="/resource/jqueryvalidate/jquery.validate.min.js" />"></script>

<!-- Date Time Picker -->
<script src="<c:url value="/resource/moment/js/moment.js" />"></script>
<script src="<c:url value="/resource/datetimepicker/js/bootstrap-datetimepicker.js" />"></script>
<link href="<c:url value="/resource/datetimepicker/css/bootstrap-datetimepicker.min.css" />" rel="stylesheet" media="all">

<!-- jQuery dataTable -->
<script src="<c:url value="/resource/datatable/js/jquery.dataTables.js" />"></script>
<link href="<c:url value="/resource/datatable/css/jquery.dataTables.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet" media="all">

<!-- dataTable Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>

<!-- Date Picker -->
<script src="<c:url value="/resource/datepicker/js/bootstrap-datepicker.js" />"></script>
<link href="<c:url value="/resource/datepicker/css/datepicker.css" />" rel="stylesheet" media="all">

<!-- clock Picker -->
<script src="<c:url value="/resource/clockpicker/js/bootstrap-clockpicker.js" />"></script>
<link href="<c:url value="/resource/clockpicker/css/bootstrap-clockpicker.css" />" rel="stylesheet" media="all">

<!-- Browse-remove picture -->
<script src="<c:url value="/resource/bootstrap/js/fileinput.min.js" />"></script>
<link href="<c:url value="/resource/bootstrap/css/fileinput.min.css" />" rel="stylesheet"	media="all">

<!-- Mask Plugin -->
<script src="<c:url value="/resource/mask/js/jquery.maskedinput.js" />"></script>
<script src="<c:url value="/resource/mask/js/jquery.mask.js" />"></script>

<!-- PNotify -->
<script src="<c:url value="/resource/pnotify/js/pnotify.custom.min.js" />"></script>
<link href="<c:url value="/resource/pnotify/css/pnotify.custom.min.css" />" rel="stylesheet"	media="all">

<link href="<c:url value="/resource/bootstrap/css/main.css" />" rel="stylesheet" media="all">

<script src="<c:url value="/resources/resource/sweetalert/js/sweet-alert.js" />"></script>
<link href="<c:url value="/resources/resource/sweetalert/css/sweet-alert.css" />" rel="stylesheet" media="all">

 
 <%-- 


	<div class="headLogo" >
		<span><img style="width: 200px; text-align: left;" src="<c:url value="/resource/images/augmentis-logo.png" />" /></span>
	</div>	
	<nav class="navbar navbar-default" role="navigation">
	<div class="collapse navbar-collapse" id="navbar-collapse-01">


		<ul class="nav navbar-nav navbar-left" >
		<li>
			     	<a class="navbar-link" href="<%=request.getContextPath()%>/listemployee"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
			    </li>
		</ul>
		    <ul class="nav navbar-nav navbar-right">
		    <li>
			     	<a class="navbar-link img-flag" href="<%=request.getRequestURL()%>?locale=th"><img class="img-flag" style="width: 25px; height: 25px;" src="<c:url value="/resource/images/flag_thailand.png" />"> </a>
			    </li>
			    <li>
			     	<a class="navbar-link" href="<%=request.getRequestURL()%>?locale=en"><img class="img-flag" style="width: 25px; height: 25px;" src="<c:url value="/resource/images/flag_usa.png" />"> </a>
			    </li>
		    	<li class="dropdown">
		    	 	<a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="label.report" var="report" />${report}<b class="caret"></b></a>
	                <span class="dropdown-arrow"></span>
		    		<ul class="dropdown-menu">
		    			<li>
		    				<a href="<%=request.getContextPath()%>/employee/reportEmpName"><spring:message code="report.empName" /></a>
		    			</li>
		    			<li>
		    				<a href="<%=request.getContextPath()%>/employee/reportEmpCode"><spring:message code="report.empCode" /></a>
		    			</li>
		    			
		    			<li>
		    				<a data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#reportModal" href="<%=request.getContextPath()%>/employee/modalReportStatusEmp"><spring:message code="report.empStatus" /></a>
		    			</li>
		    			
		    			<li>
		    				<a  href="<%=request.getContextPath()%>/employee/ReportStatusEmp"><spring:message code="report.empStatus" /></a>
		    			</li>
		    			
		    			<li>
		    				<a href="<%=request.getContextPath()%>/employee/ReportLeave"><spring:message code="report.empLeave" /></a>
		    			</li>
		    			
		    		</ul>
		    	</li>
		    	
			    <li>
			     	<a class="navbar-link" href="<%=request.getContextPath()%>/logout"><spring:message code="label.logout" /></a>
			    </li>
		    </ul>   
	</div>
	</nav>  --%>
	
	
	<nav class="navbar navbar-inverse" role="navigation">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="http://118.67.249.84/webian/TMCDemo/images/tmc_logo.png" style="width:40px;height:45px;"></a>
    </div>
	