<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error 500 page</title>
<style >

#imagePreview {
    width: 150px;
    height: 150px;
    background-position: center;
    background-size: cover;
    -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
    display: inline-block;
}
body {
background-image: url(${pageContext.request.contextPath}/resource/images/BG_W.jpg);
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: top center !important;
background-repeat: no-repeat !important;
background-attachment: fixed;
.error-template {padding: 40px 15px;text-align: center;}
.error-actions {margin-top:15px;margin-bottom:15px;}
.error-actions .btn { margin-right:10px; }
} 
h1{
border: none; box-shadow: none; margin: 0; padding: 0;
font-size: 8.0em; text-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
}
h2{
border: none; box-shadow: none; margin: 0; padding: 0;
font-size: 2.0em; line-height: 2.0em;
}
p{
border: none; box-shadow: none; margin: 0; padding: 0;
}


</style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12" align="center">
            <div class="error-template">
                <h2>
                    Oops!
                </h2>
                <h1>
                    500
                </h1>
                <p>
                    Sorry, an error has occured, Internal server!
                </p>
                <p><a href="${pageContext.request.contextPath}"><span>Return to the Homepage</span></a></p>
                <%-- <c:if test="${not empty exception.errCode}">
                	<h2>
                    	${exception.errCode}
                    </h2>
                </c:if>
                <div class="error-details">
                <c:if test="${not empty exception.errMsg}">
					<h4>
                   		${exception.errMsg}
                   	</h4>
                </c:if> --%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>