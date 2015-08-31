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
	var $msgUpdate = '<spring:message code="label.update" />';
	var $msgSave = '<spring:message code="label.save" />';
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
	
	/* site-message validate */
	var $requiredProjectname = '<spring:message code="site.required.projectname" />';
	var $requiredProjectOwner = '<spring:message code="site.required.projectOwner" />';
	var $requiredProjectOwnerContact = '<spring:message code="site.required.projectOwnerContact" />';
	var $requiredStartDate = '<spring:message code="site.required.startDate" />';
	var $requiredEndDate = '<spring:message code="site.required.endDate" />';

	/* reference-message validate*/
	var $validatenamereference = '<spring:message code="reference.required.fullname" />';
	var $validatetelreference = '<spring:message code="reference.required.telephone" />'
	
		
	/* reward-message validate*/
	var $validatenamereward = '<spring:message code="reward.required.name" />';
	var $validateyearreward =  '<spring:message code="reward.required.year" />';
	
	
	/* punish-message validate*/
	var $validatepunish = '<spring:message code="punish.required.date" />';
	var $validatedescriptionpunish =  '<spring:message code="punish.required.description" />';
	var $validatepenaltypunish =  '<spring:message code="punish.required.penalty" />';
	
	
	/* card-message validate*/
	var $validatecardno = '<spring:message code="card.required.cardno" />';
	var $validatedestartdatecard =  '<spring:message code="card.required.startdate" />';
	var $validatestatuscard =  '<spring:message code="card.required.status" />';

	
	/* education-message validate */
	var $requiredstartdate = '<spring:message code="education.required.start.date" />';
	var $requiredfinishdate = '<spring:message code="education.required.finish.date" />';
	var $requireduniversity = '<spring:message code="education.required.university" />';
	var $requiredfaculty = '<spring:message code="education.required.faculty" />';
	var $requiredmajor = '<spring:message code="education.required.major" />';
	var $requireddeegreetype = '<spring:message code="education.required.deegreetype" />';
	var $requiredgpa = '<spring:message code="education.required.gpa" />';
	var $requiredgpadigit = '<spring:message code="education.required.gpa.digit" />';
	
	/* allowances-message validate */
	var $requiredmasallowances = '<spring:message code="allowances.required.masallowances" />';
	
	/* certification-message validate */
	var $requiredyear = '<spring:message code="certification.required.year" />';
	var $requiredcertificationname = '<spring:message code="certification.required.certification.name" />';
	var $requiredcertificationfrom = '<spring:message code="certification.required.certification.from" />';
	var $requireddescription = '<spring:message code="certification.required.description" />';
	
	/* history-message validate */
	var $requiredposition = '<spring:message code="history.required.position" />';
	var $requiredsalary = '<spring:message code="history.required.salary" />';
	var $requireddateOfAdjustment = '<spring:message code="history.required.dateOfAdjustment" />';
	
	/* reportEmpCode-message validate */
	var $requiredreportType = '<spring:message code="report.validate.reportType" />';

	
</script>