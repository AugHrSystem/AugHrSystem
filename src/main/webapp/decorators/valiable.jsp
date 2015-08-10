<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<script>
	var $getContextPath = "${pageContext.request.contextPath}";
	var $msgNewRecord = '<spring:message code="label.newRecord" />';
	var $msgEdit = '<spring:message code="label.edit" />';
	var $msgDelete = '<spring:message code="label.delete" />';
	
	
	/* family-massage validate*/
	var $requiredFamilyName = '<spring:message code="family.required.firstName"/>';
	var $requiredLastName   = '<spring:message code="family.required.lastName" />';
	var $requiredAge 		= '<spring:message code="family.required.age" />';
	var $ageIsDigit  		= '<spring:message code="family.required.age.num" />';
	var $ageIsZero			= '<spring:message code="family.required.age.notzero" />';
	var $requiredMobile		= '<spring:message code="family.required.mobile" />'
	var $formatMobile		= '<spring:message code="family.required.mobile.format" />';
	var $requiredAddress    = '<spring:message code="family.required.address" />';
	var $requiredMasRelation 	= '<spring:message code="family.required.masRelation" />';
	
	/* language-massage validate */
	var $requiredMasSkillLanguage = '<spring:message code="skilllanguage.required.masSkillLanguage" />';
	var $requiredLanguage = '<spring:message code="skilllanguage.required.Language" />';
	
</script>