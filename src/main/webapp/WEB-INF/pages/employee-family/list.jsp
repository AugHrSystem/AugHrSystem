<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>

<script src="<c:url value="/resources/resource/bootstrap/js/jquery-1.11.2.min.js" />"></script>
<link href="<c:url value="/resources/resource/bootstrap/css/bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/resource/bootstrap/css/bootstrap-theme.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resources/resource/bootstrap/js/bootstrap.js" />"></script>
<script src="<c:url value="/resources/resource/datatable/js/jquery.dataTables.min.js" />"></script>
<link href="<c:url value="/resources/resource/bootstrap/css/dataTables.bootstrap.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/resource/datatable/css/jquery.dataTables.min.css" />" rel="stylesheet" media="all">
<link href="<c:url value="/resources/resource/datatable/css/jquery.dataTables_themeroller.css" />" rel="stylesheet" media="all">
<script src="<c:url value="/resources/resource/bootstrap/js/dataTables.bootstrap.js" />"></script>

<style type="text/css">
#example {
        width: 90%;
    }
 
</style>

</head>
<body>
		
		
<div class="container">

     <h2>Family</h2>
     <br/>
     <br/>
     

     
      <a href="<%=request.getContextPath()%>/empfamily/form" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#formModal"><span class="glyphicon glyphicon-plus-sign"></span>Add Data</a>   

     <table id="example" class="display dataTable" cellspacing="0" width="100%">
    
       <thead>
            <tr>
                <th><spring:message code="empFamily.list.no"/></th>
				<th><spring:message code="empFamily.list.employeename"/></th>
                <th><spring:message code="empFamily.list.familyname"/></th>
                <th><spring:message code="empFamily.list.occupation"/></th>
				<th><spring:message code="empFamily.list.age"/></th>
                <th><spring:message code="empFamily.list.gender"/></th>
                <th><spring:message code="empFamily.list.tel"/></th>
                <th><spring:message code="empFamily.list.relation"/></th>
                <th><spring:message code="empFamily.list.edit"/></th>

            </tr>
        </thead>

 
        <tfoot>
            <tr>
                <th><spring:message code="empFamily.list.no"/></th>
				<th><spring:message code="empFamily.list.employeename"/></th>
                <th><spring:message code="empFamily.list.familyname"/></th>
                <th><spring:message code="empFamily.list.occupation"/></th>
				<th><spring:message code="empFamily.list.age"/></th>
                <th><spring:message code="empFamily.list.gender"/></th>
                <th><spring:message code="empFamily.list.tel"/></th>
                <th><spring:message code="empFamily.list.relation"/></th>
                <th><spring:message code="empFamily.list.edit"/></th>
            </tr>
        </tfoot>
 
 
 
 <c:if test="${ !empty empFamilyList }">
	<c:forEach items="${ empFamilyList }" varStatus="i" var="empFamily">
        <tbody>
            <tr>
                <td>${ i.index+1 }</td>
                <td>${empFamily.employee.name}</td> 
                <td>${empFamily.empFamilyFirstName}&nbsp;${empFamily.empFamilyLastName}</td>
                <td>${empFamily.empFamilyOccupation}</td>
                <td>${empFamily.empFamilyAge}</td>
                <td>${empFamily.empFamilyGender}</td>
                <td>${empFamily.empFamilyMobile}</td>
                <td>${empFamily.empFamilyRelation}</td>
                <td>
                    <a href="#">
                    <span class="glyphicon glyphicon-edit"></span>
                    </a>
                    
                     <a href="#">
                     <span class="glyphicon glyphicon-remove del"></span>
                     </a>
                </td>
            </tr>          
        </tbody>
    </c:forEach>
</c:if>

    </table>
    
    
    	<div class="modal fade" id="formModal" tabindex="-1" >
			  <div class="modal-dialog"> <div class="modal-content"> </div> </div>
		</div>

</div>


 <script type="text/javascript">
        $(document).ready(function() {

            
          $('#example').dataTable( {
              "autoWidth": false,
              "bPaginate": true,
              "bFilter": true,
              "bInfo": true
           } );    

      } );
   </script>

</body>
</html>