<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>

<link href="<c:url value="/css/header.css" />" rel="stylesheet" type="text/css">

 <style>
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
/* Set width on the form input elements since they're 100% wide by default */
input,
select,
textarea {
    max-width: 280px;
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
padding-left:5px;
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

/* Set Table */
table.dataTable thead th,
table.dataTable tfoot th {
    font-weight: normal;
}

table.dataTable thead th,
table.dataTable thead td {
    padding: 10px 18px;
    border-bottom: 0px none #111111;
}


table.dataTable.no-footer {
    border-bottom: 1px none #111111;
}

.defaultTable {
    border: none;
    border-collapse: separate;
    border-bottom: 0px;
}

    .defaultTable th {
        border-left: 0px solid #ffffff;
        border-right: 1px solid #ffffff;
    }

        .defaultTable th:last-child {
            border-right: none;
        }

    .defaultTable td {
        border-left: 0px solid #ffffff;
        border-right: 1px solid #ABABAB;
    }

        .defaultTable td:first-child {
            border-left: none;
        }

        .defaultTable td:last-child {
            border-right: none;
        }

    .defaultTable thead {
        background-color: #ababab;
    }

        .defaultTable thead tr th {
            color: #ffffff;
        }

.dataTables_info {
    padding-left: 10px;
}

.defaultTable tbody tr.odd{
    background-color:#e7e7e7;
}

.previous, .next {
    padding: 5px;
}

.glyphicon-calendar {
    color: white;
}

.input-group-addon {
    background-color: #ff9900;
}

.dl-horizontal dt {
    white-space: normal;
}

</style>

<nav class="navbar navbar-defaults navbar-fixed-top" id="top-bar" role="navigation">
        <div class="container">
            <div class="navbar-header">

                <img style="width:145px; height:75px;" src="<c:url value="/resource/images/Logo_Augmentis.png" />"/>

            </div>
        
            <div class="navbar-collapse collapse" id="navbar" aria-expanded="false" style="height: 1px;">
                <div class="navbar-nav pull-left">
                    <ul class="nav navbar-nav">
                    	<li>
							<a class="navbar-link" href="<%=request.getContextPath()%>/listemployee"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
						</li>
                    </ul>
                    
                </div>
	
               <div class=" navbar-nav pull-right">
                <div class="row-md-12">
                    	<div id="bgLogout">
                        <span>
                        	<a id="linkLogout" class="navbar-link" href="<%=request.getContextPath()%>/logout" style="color:#636666;"><spring:message code="label.logout" /> | username</a>
                       	</span>
                   		</div>
                    	<div id="profileUser" hidden="hidden">
                        	<ul class="nav navbar-nav" id="profile"></ul>
                    	</div>
                	</div>
                <div class="form-group navbar navbar-defaults">
				<a class="navbar-link" href="<%=request.getRequestURL()%>?locale=th"><img src="<c:url value="/resource/images/flag_thailand.png" />"> </a>
				<a class="navbar-link" href="<%=request.getRequestURL()%>?locale=en"><img src="<c:url value="/resource/images/flag_usa.png" />"> </a>
                <a class="navbar-link-report" href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="label.report" var="report" /><b class="caret">${report}  <span class="glyphicon glyphicon-triangle-bottom"></span></b></a>
	        	
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

        </div>
</nav>

