<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<div class="row">
	<div class="span12">
		<ul class="nav nav-tabs" id="myTabs">
			<li><a href="${pageContext.request.contextPath}/employee/${id}" >Employee</a></li>
			<li><a href="${pageContext.request.contextPath}/family/${id}" >Family</a></li>
			<li><a href="${pageContext.request.contextPath}/education/${id}" >Education</a></li>
			<li><a href="${pageContext.request.contextPath}/experience/${id}" >Experience</a></li>
			<li><a href="${pageContext.request.contextPath}/ability/${id}" >Ability</a></li>
			<li><a href="${pageContext.request.contextPath}/reference/${id}" >Reference</a></li>
			<li><a href="${pageContext.request.contextPath}/reward/${id}" >Reward</a></li>
			<li><a href="${pageContext.request.contextPath}/history/${id}" >History</a></li>
			<li><a href="${pageContext.request.contextPath}/probation/${id}" >Probation</a></li>
			<li><a href="${pageContext.request.contextPath}/punish/${id}" >Punish</a></li>
			<li><a href="${pageContext.request.contextPath}/leave/${id}" >Leave</a></li>
			<li><a href="${pageContext.request.contextPath}/skilllanguage/${id}" >SkillLanguage</a></li>
			<li><a href="${pageContext.request.contextPath}/site/${id}" >Site</a></li>
			<li><a href="${pageContext.request.contextPath}/certification/${id}" >Certification</a></li>
			<li><a href="${pageContext.request.contextPath}/card/${id}" >Card</a></li>
			<li><a href="${pageContext.request.contextPath}/allowances/${id}" >Allowances</a></li>
			<li><a href="${pageContext.request.contextPath}/health/${id}" >Health</a></li>

		</ul>
	</div>
</div>

