<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>

/* #myTabs li.active { */
    
/* } */

#myTabs .active a {
    background-color: red;
}
</style>

<div class="row">
	<div class="span12">
		<ul class="nav nav-tabs" id="myTabs">

			<c:if test="${ id == 0 || id == null}">

			<li class="tab-pane fade in active"><a href="${pageContext.request.contextPath}/employee" ><spring:message code="employee.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="family.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="education.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="experience.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="ability.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="reference.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="reward.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="history.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="probation.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="punish.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="leave.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="skilllanguage.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="site.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="certification.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="card.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="allowances.name" /></a></li>
			<li class="disabled disabledTab"><a><spring:message code="health.name" /></a></li>
			</c:if>
			
			<c:if test="${id > 0}">
			<li><a class="active" href="${pageContext.request.contextPath}/employee/init/${id}" >Employee</a></li>
			<li><a href="${pageContext.request.contextPath}/family/${id}" ><spring:message code="family.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/education/${id}" ><spring:message code="education.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/experience/${id}" ><spring:message code="experience.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/ability/${id}" ><spring:message code="ability.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/leave/${id}" ><spring:message code="leave.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/reference/${id}" ><spring:message code="reference.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/reward/${id}" ><spring:message code="reward.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/history/${id}" ><spring:message code="history.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/probation/${id}" ><spring:message code="probation.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/punish/${id}" ><spring:message code="punish.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/skilllanguage/${id}" ><spring:message code="skilllanguage.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/site/${id}" ><spring:message code="site.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/certification/${id}" ><spring:message code="certification.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/card/${id}" ><spring:message code="card.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/allowances/${id}" ><spring:message code="allowances.name" /></a></li>
			<li><a href="${pageContext.request.contextPath}/health/${id}" ><spring:message code="health.name" /></a></li>
</c:if>
		</ul>
		
		
	</div>
</div>

<script type="text/javascript">

// function myFunction(element) {
// 	   //get all list items:
// 	   var liArray = document.getElementById("myTabs").getElementsByTagName("li");

// 	    //make all items inactive
// 	    for (var i = 0; i < liArray.length; i++)
// 	        liArray[i].className = "inactive";

// 	    //make clicked item active:
// 	    element.className = "active";
	    
// 	}

$('#myTabs li').click(function (e) {
  e.preventDefault();
// e.target
// e.relatedTarget
  $(this).tab('show');
})

// $(document).ready(function () {
// //iterate through the links and verify against window.location.pathname
// var loc_href = window.location.pathname;
// $('#myTabs li a').each(function () {
// if (loc_href == $(this).attr('href')) {
// $(this).addClass('active');
// }
// });
// });

// $('#myTabs li a').click(function() {           
//     $(this).parent().addClass('active').siblings().removeClass('active');           
// });
// $(document).ready(function(){ 
//     $("#myTabs li:eq(2) a").tab('show');
// });
// var make_button_active = function()
// {
//   //Get item siblings
//   var siblings =($(this).siblings());

//   //Remove active class on all buttons
//   siblings.each(function (index)
//     {
//       $(this).removeClass('active');
//     }
//   )


//   //Add the clicked button class
//   $(this)
// }

// //Attach events to menu
// $(document).ready(
//   function ()
//   {
//     $("#myTabs li").click(make_button_active);
//   }  
// )

</script>