<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery -->
<script src="<c:url value="/resource/bootstrap/js/jquery-1.11.2.js" />"></script>

<!-- Bootstrap -->
<link href="<c:url value="/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet">
<script src="<c:url value="/resource/bootstrap/js/bootstrap.js" />"></script>

<title>Error 404 page</title>
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

.navbar-header {
    margin-left:5%;
}

.contain{ 
	margin-top: 5%;
}

 .navbar-inverse {
position:absolute;
background-color: #707070;
background-image: linear-gradient(to bottom, #707070 0%, #707070 100%); 
border-color: #C7A5A5;
height: 72px;
}

.navbar-inverse .navbar-nav > li > a{
color:#fff;
}


#bgLogout{
margin-top:2%;
background-color: #ffffff;
height: 100%;
width: 100%;
padding-top:2%;
padding-bottom: 2%;
}


.navbar-default{
	background-image: linear-gradient(to bottom, yellow 0%, yellow 100%); 
}

a{
color: #fff;
}


/* .navbar-link-report b{
width:5px;
height:5px;
margin-top:5px;
padding-left:2px;
margin-left:5px;
border:1px solid white; 
font-family: Dosis-Regular;
font-size:13px;
color:#fff;
} */


                #Logout {
                    position: absolute;
                    right: 2%;
                    margin-top: 10px;
                }

                #bgLogout {
                    background-color: #ffffff;
                    width: 183px;
                    height: 25px;
                    font-size: 16px;
                    text-align: center;
                    color: #808080;
                }

                #profileUser {
                    background-color: #ffd800;
                    width: 160px;
                    height: 200px;
                    right: 5px;
                }

                #userEmpID {
                    color: #636666;
                    font-family: Dosis-Regular;
                }

                #linkLogout {
                    color: #636666;
                    text-decoration: none;
                    font-family: Dosis-Regular;
                }


/* Tab Setting */
.tab-content {
    background-color: #eeeeee;
    border: 5px solid #eeeeee;
    border-radius: 3px;
}

.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
    color: #fa9900;
    cursor: pointer;
    background-color: #eeeeee;
    border: 1px solid #dddddd;
    border-bottom-color: transparent;
    border-top: 3px solid #fa9900;
    border-radius: 3px;
}

.nav-tabs > li > a {
    color: #414141;
    cursor: pointer;
    background-color: #eeeeee;
    border: 1px solid #dddddd;
    border-top: 3px solid #414141;
    border-radius: 3px;
}

    .nav-tabs > li > a:hover {
        color: #b1b1b1;
        cursor: pointer;
        background-color: #eeeeee;
        border: 1px solid #dddddd;
        border-top: 3px solid #b1b1b1;
        border-radius: 3px;

    }
#top-bar {
    height: 65px;
    background-color: #707070;
    box-shadow: 0px 2px 10px #1A1A1A;
}

#footer-bar {
    background-color: #FBCA00;
    text-align: right;
    width: 100%;
    height: 35px;
    position: absolute;
    bottom: 0;
    left: 0;
}

#footer-menu {
    padding: 10px 0;
    overflow: hidden;
}

#copy-right {
    font-family: supermarket;
    font-size: 12px;
    color: white;
    text-align: right;
}

.navbar-defaults .navbar-nav > li > a {
    height: 65px;
    padding-top: 25px;
    padding-left: 20px;
    padding-right: 20px;
    font-family: Dosis-SemiBold;
    font-weight: bold;
    font-size: 18px;
    background-color: #707070;
    color: white;
    
}

    .navbar-defaults .navbar-nav > li > a:hover {
        background-color: #ff9900;
        color: white;
    }

    .navbar-defaults .navbar-nav > li > a:focus {
       	background-color: #ff9900;
        color: white;
    }


.navbar-defaults {

    border-color: transparent;
}


.navbar-link {
	position:center;
}

.navbar-link img {
width:40px;
height:25px;
border:1px solid white; 
padding-left:7px;
padding-right:7px;
margin-top:5px;
margin-right:7px;
}

.navbar-link > img:hover {
	background-color: #fff;
    color: white;
}

.navbar-link > img:focus{
       	background-color: #fff;
        color: white;
}


.navbar-link > img:visited{
       	background-color: #fff;
        color: #292929;
        
}

.navbar-link-report b{
width:75px;
height:25px;
margin-top:5px;
padding-left:3px;
margin-left:5px;
border:1px solid white; 
font-family: Dosis-Regular;
font-size:16px;
color:#fff;
}

.navbar-defaults > a:hover > b {
       	background-color: #fff;
        color: #292929;
        
}

.navbar-defaults > a:focus > b {
       	background-color: #fff;
        color: #292929;
        
}



.container{
margin-left:40px;
margin-right:40px;
width: 93%;

}

.pull-right{
padding-right:55px;
}




</style>
</head>
<body>

<nav  class="navbar navbar-inverse navbar-fixed-top navbar-custom " role="navigation">

        <div class="navbar-header">        
           <img style="width:145px; height:80px; background-color: #707070; box-shadow: 0px 2px 10px #1A1A1A;" src="<c:url value="/resource/images/augmentis_logo_border.jpg" />"/>                       	
        </div>   
        
        <div class="navbar-collapse collapse" aria-expanded="false">   
          <ul class="nav navbar-nav pull-left" style="margin-left: 2%;padding-top: 1%">
            <li>
         		<a class="navbar-link" href="<%=request.getContextPath()%>/listemployee"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
       		</li>
       	  </ul>
       	  
       	  
       	  <div class="navbar-nav pull-right">
       	   <div class="row-md-12">
       	 	 <div id="bgLogout" class="col col-md-3">
                        <span>
                        	<a id="linkLogout" class="navbar-link" href="<%=request.getContextPath()%>/logout" style="color:#636666;padding-top: 100%;"><spring:message code="label.logout" /> | username</a>
                       	</span>
              </div>
            </div>
            
            
            <div class="form-group navbar navbar-defaults" >
				<a class="navbar-link" href="<%=request.getRequestURL()%>?locale=th"><img id="flag-tha" src="<c:url value="/resource/images/flag_thailand.png" />"> </a>
				<a class="navbar-link" href="<%=request.getRequestURL()%>?locale=en"><img id="flag-usa" src="<c:url value="/resource/images/flag_usa.png" />"> </a>
                <a class="navbar-link-report" href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="label.report" var="report" /><b>${report}  <span style= "padding-left:5px;font-size:10px;"class="glyphicon glyphicon-triangle-bottom"></span></b></a>
	        	
		    		<ul class="dropdown-menu">
		    			<li>
		    				<a href="<%=request.getContextPath()%>/employee/reportEmpName"><spring:message code="report.empName" /></a>
		    			</li>
		    			<li>
		    				<a href="<%=request.getContextPath()%>/employee/reportEmpCode"><spring:message code="report.empCode" /></a>
		    			</li>
		    			
		    			<li>
		    				<a  href="<%=request.getContextPath()%>/employee/ReportStatusEmp"><spring:message code="report.empStatus" /></a>
		    			</li>
		    			
		    			<li>
		    				<a href="<%=request.getContextPath()%>/employee/ReportLeave"><spring:message code="report.empLeave" /></a>
		    			</li>
		    			
		    		</ul>
                </div>
             </div>

    	</div>
</nav>


<br/>
<div class="contain">
    <div class="row">
          <div class="col-md-6">
            <img src="${pageContext.request.contextPath}/resource/images/error.png" alt="Mountain View" style="width:304px;height:228px;">
         </div>  
    </div> 
</div>

<footer>
   
    
 <!--    <div class="navbar navbar-default navbar-fixed-bottom" role="navigation">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">Project name</a>
  </div>
  <div class="navbar-collapse collapse">

    Left nav
    <ul class="nav navbar-nav">
      <li><a href="#">Link</a></li>
      <li><a href="#">Link</a></li>
      <li><a href="#">Link</a></li>
      <li><a href="#" class="dropup">Dropdown <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li class="divider"></li>
          <li class="dropdown-header">Nav header</li>
          <li><a href="#">Separated link</a></li>
          <li><a href="#">One more separated link <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">A long sub menu <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="disabled"><a class="disabled" href="#">Disabled item</a></li>
                  <li><a href="#">One more link</a></li>
                  <li><a href="#">Menu item 1</a></li>
                  <li><a href="#">Menu item 2</a></li>
                  <li><a href="#">Menu item 3</a></li>
                  <li><a href="#">Menu item 4</a></li>
                  <li><a href="#">Menu item 5</a></li>
                  <li><a href="#">Menu item 6</a></li>
                  <li><a href="#">Menu item 7</a></li>
                  <li><a href="#">Menu item 8</a></li>
                  <li><a href="#">Menu item 9</a></li>
                  <li><a href="#">Menu item 10</a></li>
                  <li><a href="#">Menu item 11</a></li>
                  <li><a href="#">Menu item 12</a></li>
                  <li><a href="#">Menu item 13</a></li>
                  <li><a href="#">Menu item 14</a></li>
                  <li><a href="#">Menu item 15</a></li>
                  <li><a href="#">Menu item 16</a></li>
                  <li><a href="#">Menu item 17</a></li>
                  <li><a href="#">Menu item 18</a></li>
                  <li><a href="#">Menu item 19</a></li>
                  <li><a href="#">Menu item 20</a></li>
                  <li><a href="#">Menu item 21</a></li>
                  <li><a href="#">Menu item 22</a></li>
                  <li><a href="#">Menu item 23</a></li>
                  <li><a href="#">Menu item 24</a></li>
                  <li><a href="#">Menu item 25</a></li>
                  <li><a href="#">Menu item 26</a></li>
                  <li><a href="#">Menu item 27</a></li>
                  <li><a href="#">Menu item 28</a></li>
                  <li><a href="#">Menu item 29</a></li>
                  <li><a href="#">Menu item 30</a></li>
                  <li><a href="#">Menu item 31</a></li>
                  <li><a href="#">Menu item 32</a></li>
                  <li><a href="#">Menu item 33</a></li>
                  <li><a href="#">Menu item 34</a></li>
                  <li><a href="#">Menu item 35</a></li>
                  <li><a href="#">Menu item 36</a></li>
                  <li><a href="#">Menu item 37</a></li>
                  <li><a href="#">Menu item 38</a></li>
                  <li><a href="#">Menu item 39</a></li>
                  <li><a href="#">Menu item 40</a></li>
                  <li><a href="#">Menu item 41</a></li>
                  <li><a href="#">Menu item 42</a></li>
                  <li><a href="#">Menu item 43</a></li>
                  <li><a href="#">Menu item 44</a></li>
                  <li><a href="#">Menu item 45</a></li>
                  <li><a href="#">Menu item 46</a></li>
                  <li><a href="#">Menu item 47</a></li>
                  <li><a href="#">Menu item 48</a></li>
                  <li><a href="#">Menu item 49</a></li>
                  <li><a href="#">Menu item 50</a></li>
                  <li><a href="#">Menu item 51</a></li>
                  <li><a href="#">Menu item 52</a></li>
                  <li><a href="#">Menu item 53</a></li>
                  <li><a href="#">Menu item 54</a></li>
                  <li><a href="#">Menu item 55</a></li>
                  <li><a href="#">Menu item 56</a></li>
                  <li><a href="#">Menu item 57</a></li>
                  <li><a href="#">Menu item 58</a></li>
                  <li><a href="#">Menu item 59</a></li>
                  <li><a href="#">Menu item 60</a></li>
                </ul>
              </li>
              <li><a href="#">Another link</a></li>
              <li><a href="#">One more link</a></li>
            </ul>
          </li>
        </ul>
      </li>
    </ul>

    Right nav
    <ul class="nav navbar-nav navbar-right">
      <li><a href="bootstrap-navbar.html">Default</a></li>
      <li><a href="bootstrap-navbar-static-top.html">Static top</a></li>
      <li><a href="bootstrap-navbar-fixed-top.html">Fixed top</a></li>
      <li class="active"><a href="bootstrap-navbar-fixed-bottom.html">Fixed bottom</a></li>
      <li><a href="#" class="dropup">Dropdown <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li class="divider"></li>
          <li class="dropdown-header">Nav header</li>
          <li><a href="#">A sub menu <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="disabled"><a class="disabled" href="#">Disabled item</a></li>
              <li><a href="#">One more link</a></li>
            </ul>
          </li>
          <li><a href="#">A separated link</a></li>
        </ul>
      </li>
    </ul>

  </div>/.nav-collapse
</div>-->


<nav  class="navbar navbar-default navbar-fixed-bottom">
  <div class="container">
      
  </div>
</nav>
</footer> 
</body>
</html>