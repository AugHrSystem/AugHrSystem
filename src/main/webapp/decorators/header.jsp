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
		    <ul class="nav navbar-nav navbar-right">
			    <li>
			     	<a class="navbar-link" href="<%=request.getContextPath()%>/logout">Logout</a>
			    </li>
		    </ul>   
	</div>
	</nav>
</div>
