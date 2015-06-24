<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>

<div class="container" align="left">
	<div class="headLogo" >
		<span><img style="width: 200px; text-align: left;" src="<c:url value="/resource/images/augmentis-logo.png" />" /></span>
	</div>	
	<nav class="navbar navbar-default" role="navigation">
	<div class="collapse navbar-collapse" id="navbar-collapse-01">
<%-- 		<ul class="nav navbar-nav navbar-left">
			<li class="active"><a href="#employee" data-toggle="tab">Employee</a></li>
            <li><a href="$#education" data-toggle="tab">Family</a></li>
			<li><a href="#education" data-toggle="tab">Education</a></li>
            <li><a href="#experience" data-toggle="tab">Experience</a></li>
            <li><a href="#ability" data-toggle="tab">Ability</a></li>
            <li><a href="#reference" data-toggle="tab">Reference</a></li>
            <li><a href="#reward" data-toggle="tab">Reward</a></li>
            <li><a href="#history" data-toggle="tab">History</a></li>
            <li><a href="#probation" data-toggle="tab">Probation</a></li>
            <li><a href="#punish" data-toggle="tab">Punish</a></li>
            <li><a href="#leave" data-toggle="tab">Leave</a></li>  
            <li><a href="#skilllanguage" data-toggle="tab">SkillLanguage</a></li>
            <li><a href="#site" data-toggle="tab">Site</a></li>  
            <li><a href="#certification1" data-toggle="tab">Certification</a></li>
            
		</ul> --%> 
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
		    				<a data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#reportModal" href="<%=request.getContextPath()%>/employee/modalReportEmpName"><spring:message code="report.empName" /></a>
		    			</li>
		    			<li>
		    				<a data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#reportModal" href="<%=request.getContextPath()%>/employee/modalReportEmpCode"><spring:message code="report.empCode" /></a>
		    			</li>
		    			
		    			<%-- <li>
		    				<a data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#reportModal" href="<%=request.getContextPath()%>/employee/modalReportStatusEmp"><spring:message code="report.empStatus" /></a>
		    			</li> --%>
		    			
		    			<li>
		    				<a  href="<%=request.getContextPath()%>/employee/ReportStatusEmp"><spring:message code="report.empStatus" /></a>
		    			</li>
		    			
		    			<li>
		    				<a data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#reportModal" href="<%=request.getContextPath()%>/employee/modalReportLeave"><spring:message code="report.empLeave" /></a>
		    			</li>
		    			
		    		</ul>
		    	</li>
		    	
			    <li>
			     	<a class="navbar-link" href="<%=request.getContextPath()%>/logout"><spring:message code="label.logout" /></a>
			    </li>
		    </ul>   
	</div>
	</nav> 
	
	<!-- Modal -->
	<div class="modal fade" id="reportModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('body').on('hidden.bs.modal', '.modal', function () {
			  $(this).removeData('bs.modal');
		});
	});
</script>
