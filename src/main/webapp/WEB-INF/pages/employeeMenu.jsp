<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- jQuery -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>

<!-- Bootstrap -->
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>

<!-- Validator -->
<link href="<c:url value="/resource/bootstrapvalidator/dist/css/bootstrapValidator.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrapvalidator/dist/js/bootstrapValidator.js" />"></script>

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

<div class="row">
	<div class="span12">
		<ul class="nav nav-tabs" id="myTabs">
			<li><a href="${pageContext.request.contextPath}/employee" >Employee</a></li>
			<li><a href="${pageContext.request.contextPath}/family" >Family</a></li>
			<li><a href="${pageContext.request.contextPath}/education" >Education</a></li>
			<li><a href="${pageContext.request.contextPath}/experience" >Experience</a></li>
			<li><a href="${pageContext.request.contextPath}/ability" >Ability</a></li>
			<li><a href="${pageContext.request.contextPath}/reference" >Reference</a></li>
			<li><a href="${pageContext.request.contextPath}/reward" >Reward</a></li>
			<li><a href="${pageContext.request.contextPath}/history" >History</a></li>
			<li><a href="${pageContext.request.contextPath}/probation" >Probation</a></li>
			<li><a href="${pageContext.request.contextPath}/punish" >Punish</a></li>
			<li><a href="${pageContext.request.contextPath}/leave" >Leave</a></li>
			<li><a href="${pageContext.request.contextPath}/skilllanguage" >SkillLanguage</a></li>
			<li><a href="${pageContext.request.contextPath}/site" >Site</a></li>
			<li><a href="${pageContext.request.contextPath}/certification" >Certification</a></li>
			<li><a href="${pageContext.request.contextPath}/card" >Card</a></li>
			<li><a href="${pageContext.request.contextPath}/allowances" >Allowances</a></li>
			<li><a href="${pageContext.request.contextPath}/health" >Health</a></li>

		</ul>
	</div>
</div>

