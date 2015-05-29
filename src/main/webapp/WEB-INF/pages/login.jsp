<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>

<title>Login</title>
</head>
<body>
	<div class="container">
		<form name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>
		<div class="col col-lg-4 col-md-5 col-sm-6 col-xs-12 col-lg-offset-4 col-sm-offset-3">
		<div class="headLogo" >
			<span><img style="width: 200px; text-align: left;" src="<c:url value="/resource/images/augmentis-logo.png" />" /></span>
		</div>	
			<div class="form-group">
			      <label for="user">Username:</label>
			      <input type="text" class="form-control" id="user" name='j_username' placeholder="Enter Username">
		    </div>
		    <div class="form-group">
			      <label for="pwd">Password :</label>
			      <input type="password" class="form-control" name='j_password' id="pwd" placeholder="Enter password">
		    </div>
		    <input name="submit" type="submit" class="btn btn-default" value="Login" />
			<div id="message">
				${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
			</div>
		</div>

		</form>
	</div>
	

</body>
</html>