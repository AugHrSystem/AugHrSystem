<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<div class="row">
	<div class="span12">
		<ul class="nav nav-tabs" id="myTabs">


			<c:if test="${ id == 0 || id == null}">
			<li><a href="${pageContext.request.contextPath}/employee" >Employee</a></li>
			<li class="disabled disabledTab"><a>Family</a></li>
			<li class="disabled disabledTab"><a><spring:message code="education.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="experience.name" /></a></li>
			<li class="disabled disabledTab"><a>Ability</a></li>
			<li class="disabled disabledTab"><a>Reference</a></li>
			<li class="disabled disabledTab"><a>Reward</a></li>
			<li class="disabled disabledTab"><a><spring:message code="history.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="probation.name" /></a></li>
			<li class="disabled disabledTab"><a>Punish</a></li>
			<li class="disabled disabledTab"><a>Leave</a></li>
			<li class="disabled disabledTab"><a>SkillLanguage</a></li>
			<li class="disabled disabledTab"><a>Site</a></li>
			<li class="disabled disabledTab"><a>Certification</a></li>
			<li class="disabled disabledTab"><a>Card</a></li>
			<li class="disabled disabledTab"><a><spring:message code="allowances.name" /></a></li>
			<li class="disabled disabledTab"><a>Health</a></li>
			</c:if>
			
			<c:if test="${id > 0}">
			<li><a href="${pageContext.request.contextPath}/employee/init/${id}" >Employee</a></li>
			<li><a href="${pageContext.request.contextPath}/family/${id}" >Family</a></li>
			<li><a href="${pageContext.request.contextPath}/education/${id}" ><spring:message code="education.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/experience/${id}" ><spring:message code="experience.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/ability/${id}" >Ability</a></li>
			<li><a href="${pageContext.request.contextPath}/reference/${id}" >Reference</a></li>
			<li><a href="${pageContext.request.contextPath}/reward/${id}" >Reward</a></li>
			<li><a href="${pageContext.request.contextPath}/history/${id}" ><spring:message code="history.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/probation/${id}" ><spring:message code="probation.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/punish/${id}" >Punish</a></li>
			<li><a href="${pageContext.request.contextPath}/leave/${id}" >Leave</a></li>
			<li><a href="${pageContext.request.contextPath}/skilllanguage/${id}" >SkillLanguage</a></li>
			<li><a href="${pageContext.request.contextPath}/site/${id}" >Site</a></li>
			<li><a href="${pageContext.request.contextPath}/certification/${id}" >Certification</a></li>
			<li><a href="${pageContext.request.contextPath}/card/${id}" >Card</a></li>
			<li><a href="${pageContext.request.contextPath}/allowances/${id}" ><spring:message code="allowances.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/health/${id}" >Health</a></li>
</c:if>
		</ul>
		
		
	</div>
</div>

