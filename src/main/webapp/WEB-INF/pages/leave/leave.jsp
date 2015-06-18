<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spring -->	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<jsp:include page="../employeeMenu.jsp"></jsp:include>
<input id="empId" type="hidden" value="${id}">
<form:form id ="listForm" method="post" commandName="leave">




		<div class="row-md-12">

				<div class="col-md-6">
					<h2>Leave</h2> 

				</div>

				<div class="col-md-6">

					<br>
					<!-- Button trigger modal -->
					<div class="form-group" align="right">
						<button type="button" id="addBtnLe" class="btn btn-info btn-md"
							data-toggle="modal" data-target="#addModal">New record</button>
					</div>


				</div>
			</div>






<!-- Table -->
<div class="form-group">
<table id="tbResult" class="table">
	<thead>
		<tr>
			<!-- <th>Start_Date</th> -->
			<th>Start_Date-Time</th>
			<!-- <th>End_Date</th> -->
			<th>End_Date-Time</th>
			<th>Leave_Type</th>
			<th>Reason</th>
			 <th>AIM</th> 
			<th>Action</th>
			<!-- <th>Delete</th> -->
		</tr>
	</thead>
	<tbody></tbody>
</table>
</div>

</form:form>

<form:form id ="addForm" method="post" commandName="leave" >

	
	
	<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Leave</h4>
      </div>
      <div class="modal-body row">
   	

<%-- 
<div class="form-group col-md-6">
	 <!-- <div class="form-group">  -->
	    <label>Start Date:</label>
	    <div class='input-group date' id='dateFrom'>
	    <form:input path="startDate" type="text" class="form-control" id="startDate" placeholder="DD-MM-YYYY"/>
	    <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
	    </div>
	    <!-- </div> -->
	    </div> --%>
	    
	    
	  <%--   <div class="form-group col-md-6">
	    <!-- <div class="form-group"> -->
			<label>Start Time :</label>

			<div class="input-group clockpicker">

				<form:input path="startTime" type="text" class="form-control" id="startTime"
					placeholder="Enter startTime" /> <span
					class="input-group-addon"> <span
					class="glyphicon glyphicon-time"></span>
				</span>
			</div>
		<!-- </div> -->
	    </div> --%>
	    
	    
	    
	    
	     <div class='col-sm-6'>
            <div class="form-group">
            <label>Start Date-Time:</label>
                <div class='input-group date' id="startTime1">
				    <form:input id="startTime" name="startTime" path="startTime" cssClass="form-control"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                </div>
                </div>
                
                
                
<%--              

<div  class="form-group col-md-6">
 <!-- <div class="form-group"> -->
	    <label>End Date :</label>
	    <div class='input-group date' id='dateTo1'>
	    <form:input path="endDate" type="text" class="form-control" id="endDate" placeholder="DD-MM-YYYY"/>
	    <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
        </div>
	  <!-- </div> -->
</div> --%>



<%-- <div class=" form-group col-md-6">
<!-- <div class="form-group"> -->
			<label>End Time:</label>

			<div class="input-group clockpicker1">

				<form:input path="endTime" type="text" class="form-control" id="endTime"
					placeholder="Enter endTime" /> <span
					class="input-group-addon"> <span
					class="glyphicon glyphicon-time"></span>
				</span>
			</div>
		<!-- </div> -->
</div> --%>



		<!--  <div class='col-sm-6'>
            <div class="form-group">
            <label>End Date-Time:</label>
                <div class='input-group date' id="endTime1">
                    <input type='text' class="form-control"  id="endTime"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                </div>
                </div> -->
                
                
                
                  <div class='col-sm-6'>
            <div class="form-group">
            <label>Start End-Time:</label>
                <div class='input-group date' id="endTime1">
				    <form:input id="endTime" name="endTime" path="endTime" cssClass="form-control"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                </div>
                </div>


		
  	<div  class=" form-group col-md-6">
	    <label>Leave type:</label>
	    
		<div class="form-group">
		  <form:select path="masleavetype" class="form-control" id="masleavetype">
			<form:option value="" label="---Select Leavetype---" />
			<c:forEach var="obj" items="${masleavetypeList}">
				<option value="${obj.id}">${ obj.name}</option>
			</c:forEach>
		</form:select>
		</div>
	  </div>
	  
	  
	  
	<div  class=" form-group col-md-6">
	 <label>AIM:</label>
		  <form:select path="aim" class="form-control"
			id="aim">
			<form:option  value="" label="--Select AIM--" />
  		    <form:options items="${ aimList }"  itemValue="id" itemLabel="name_eng" />
    		
		</form:select>
	  
	  </div>
	  

	     <div  class=" form-group col-md-12">
		
		
		 <label>Reason :</label>
	    <form:textarea path="reason" type="text" class="form-control" id="reason" placeholder="Enter Reason Of Leave"/>
	 
	
  	</div>
        
		</div>
      <div class="form-group" align="center">
        <button type="button" class="btn btn-default btnClose " data-dismiss="modal">Close</button>
        <button id="saveButton" type="button" class="btn btn-info saveButton">Save</button>
      </div>
    
  
</div>
</div>
</div>
</form:form>

<form:form id="deleteForm" commandName="leave" method="post">

<!-- Modal Delete -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title" id="deleteModalLabel">Delete Leave</h4>
      </div>
      <div class="modal-body">
      	Do you want to delete leave ?
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-danger yesButton" >Yes</button>
      	<button type="button" class="btn btn-info" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>
</form:form>

<script>

var dt;
$(document).ready(function() {
	
	
	
	
	 function duration(){
		 var t1=$("#startTime").val();
		 var t2=$("#endTime").val();
		 
		 alert("startTime"+t1);
		 alert("endTime"+t2);
		 }
	
	
	$('#tbResult').dataTable({ 
		"bLengthChange": false,
		"iDisplayLength": 10,
		"pagingType": "simple_numbers",
		"ordering": false,
		"info": false
	});
	
	
	$("#addBtnLe").on("click", function(){
		
		clearModal();
	
 }); 
	
	$("#saveButton").on("click",function(){
			
			/* $('#addForm').bootstrapValidator(); */
			$('#addForm').data('bootstrapValidator').resetForm();


		});
	
	
	
	$('#addForm').bootstrapValidator({
		
		  message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	masleavetype: {
	                validators: {
	                    notEmpty: {
	                        message: 'Masleavetype is required and cannot be empty'
	                    },
	        digits: {
            	min:0,
            	message: 'Masspecialty is required'
            },
	                }
	            },
	            
            reason: {
                validators: {
                    notEmpty: {
                        message: 'Reason is required and cannot be empty'
                    }
                }
            },
       /*      
            startDate: {
                validators: {
                    notEmpty: {
                        message: 'The Start Date is required and cannot be empty'
                    },
                    date: {
                        format: 'DD-MM-YYYY'
                    }
                }
            },
            endDate: {
                validators: {
                    notEmpty: {
                        message: 'The End Date is required and cannot be empty'
                    },
                    date: {
                        format: 'DD-MM-YYYY'
                    }
                }
            }, */
            startTime: {
                validators: {
                    notEmpty: {
                        message: 'Start Date and Time is required and cannot be empty'
                    }
                }
            },
            endTime: {
                validators: {
                    notEmpty: {
                        message: 'End  Date and Time  is required and cannot be empty'
                    }
                }
            },
            aim: {
                validators: {
                    notEmpty: {
                        message: 'Aim is required and cannot be empty'
                    },
           
                }
            },
           
            
            
            
            }
	        
	         
	      
		
	}); 
	
	
    $('#startTime1').datetimepicker({
    	
    	// viewMode: 'days',
		 format : 'DD-MM-YYYY HH:mm a',
		 //defaultDate: 'moment'
    }); 


	
	
	$( '#endTime1').datetimepicker({
		//viewMode: 'days',
		format : 'DD-MM-YYYY hh:mm a',
	}); 
	
	
	
	/* $( "#dateTo1" ).datetimepicker({
		format : 'DD-MM-YYYY',
	}); */
	
	
//	$('.clockpicker').clockpicker();

  
/*                     $('#datetimepicker2').datetimepicker({
                    	 viewMode: 'days',
            			 format : 'DD-MM-YYYY',
            			 defaultDate: 'moment'
                });
 */
	
	/*  $('.clockpicker').clockpicker({
		placement: 'bottom', // clock popover placement
		align: 'left',       // popover arrow align
		donetext: 'Done',     // done button text
		autoclose: true,    // auto close when minute is selected
		vibrate: true,        // vibrate the device when dragging clock hand
		
	 });
	
	
	 $('.clockpicker1').clockpicker({
			placement: 'bottom', // clock popover placement
			align: 'left',       // popover arrow align
			donetext: 'Done',     // done button text
			autoclose: true,    // auto close when minute is selected
			vibrate: true        // vibrate the device when dragging clock hand
					
	 }); */
		
		
	
	 $("#dateFrom").on("dp.change", function (e) {
		  			
					$('#addForm')
		             // Get the bootstrapValidator instance
		             .data('bootstrapValidator')
		             // Mark the field as not validated, so it'll be re-validated when the user change date
		            .updateStatus('dateFrom', 'NOT_VALIDATED', null)
		             // Validate the field
		            .validateField('dateFrom');
	 });
	
	
	dt=$("#tbResult").dataTable();
		listAll();

		
		
		$("#addModal").on("show.bs.modal",function(event) {
			
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var leaveid = button.data("id") //Extract info from data-* attribute
			 
			if(leaveid != null){
				getId(leaveid);
			}  
			
			$(this).find(".saveButton").off("click").on("click",function() {
				 if(leaveid != null){
					/*  alert("be up"); */
					updateLeave(button,leaveid);
					
				}else{ 
					addLeave();
					
				  } 
				
			});
			
			$(this).find(".btnClose").off("click").on("click",function() {
				$('#addForm').bootstrapValidator('resetForm', true);
			
				
			});
			
		});
		
		
		/* --- DeleteName --- */
		$("#deleteModal").on("show.bs.modal",function(event) {
			
			var button = $(event.relatedTarget) //Button that triggered the model เพื่อดูว่า evet ของ ปุ่มไหน
			var leaveid = button.data("id") //Extract info from data-* attribute
			
			$(this).find(".yesButton").off("click").on("click",function() {
				deleteLeave(button,leaveid);
			});
			
		});
		
		
		
		function addLeave(){
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			var leave="masleavetypeId="+$("#masleavetype").val()+"&masleavetype="+$("#masleavetype option:selected").text()+"&startTime="+$("#startTime").val()+"&endTime="+$("#endTime").val()+"&reason="+$("#reason").val()+"&aim="+$("#aim").val()+"&employeeId="+id;
			$.ajax({
				url : "${pageContext.request.contextPath}/leave/add",
				data :leave,
					/* JSON.stringify({
					

					masleavetypeId:$("#masleavetype").val(),
					masleavetype:$("#masleavetype option:selected").text(),
					//startDate:$("#startDate").val(),
					//endDate:$("#endDate").val(),
					startTime:$("#startTime").val(),
					endTime:$("#endTime").val(),
					reason:$("#reason").val(),
					aim:$("#aim").val(),
					employeeId :id 
				}) ,*/
				type : "POST",
				/* contentType : "application/json", */
				/* dataType: "json", */
				success : function(data) {
					
					 //duration();
					$('#addForm').bootstrapValidator('resetForm', true);
				//alert(JSON.stringify(data));
						
				/* 
					 dt.fnClearTable();
					
					dt.fnAddData([
					
					              
						data.masleavetype,
						data.startDate,
						data.endDate,			
						data.startTime,
						data.endTime,
						data.reason,
						data.aim,
					
						
						'<button type="button" class="btn btn-warning" data-id="'+data.id+'" data-toggle="modal" data-target="#addModal" > Edit</button>',
						'<button type="button" class="btn btn-danger" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal"> Delete</button>'
					]); */
					
					$('#addModal').modal('toggle');
					listAll();
				},
				error : function() {
// 					alert("ERROR");
					$('#addForm').bootstrapValidator('validate');
				}
			});
		}
		
		function getId(leaveid){
			
			
			$.ajax({
				
				url : "${pageContext.request.contextPath}/leave/findById/"+ leaveid,
				//data : "id=" + abilityid,
				type : "POST",
				success : function(data) {
					//alert(JSON.stringify(data));
					
					$("#masleavetype").val(data.masleavetypeId);
					//$("#startDate").val(data.startDate);
					//$("#endDate").val(data.endDate);
					$("#startTime").val(data.startTimeString);
					$("#endTime").val(data.endTime);
					$("#reason").val(data.reason);
					$("#aim").val(data.aim);
					
					employeeId: data.employeeId;
				},
				error : function(data, textStatus, jqXML) {
					{
						alert("error");
					}
					;
				}
			});
		}
		
		
		
		function updateLeave(button,leaveid) {
			/* alert("fn up"); */
// 				var id = getUrlParameter('Id');
				var id = $("#empId").val();
				$.ajax({
					url : "${pageContext.request.contextPath}/leave/update",
					data : JSON.stringify({
						id:leaveid,
						masleavetypeId : $("#masleavetype").val(),
						masleavetype : $("#masleavetype option:selected").text(),
						//startDate:$("#startDate").val(),
						//endDate:$("#endDate").val(),
						startTime:$("#startTime").val(),
						endTime:$("#endTime").val(),
						reason:$("#reason").val(),
						aim:$("#aim").val(),
						employeeId: id
					}),
					type : "POST",
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						//alert(abilityid);
						//alert(JSON.stringify(data));
						
						$('#addForm').bootstrapValidator('resetForm', true);

						/* 
						var tr = button.closest("tr");						
						dt.fnUpdate(data.startDate, tr, 0 );
						dt.fnUpdate(data.startTime, tr, 1 );
						dt.fnUpdate(data.endDate, tr, 2 );
						dt.fnUpdate(data.endTime, tr, 3 );
						dt.fnUpdate(data.masleavetype.name, tr, 4);
						dt.fnUpdate(data.reason, tr, 5 );
						dt.fnUpdate(data.aim, tr, 6 ); */
						$('#addModal').modal('toggle');
						listAll();
					},
					error : function() {
						alert("ERROR");
					}
				});
			}
		
		
		
		
		
		
		function deleteLeave(button,leaveid) {
			
			$.ajax({
				url : "${pageContext.request.contextPath}/leave/delete/"+leaveid,
				
				type : "POST",
				success : function(data) {
					
					
					$('#deleteModal').modal('toggle');
					
					listAll();
				},
				error : function() {
					alert("ERROR");
				}
			
				});
		}
		
		
		function listAll(){
			//var id=2;
// 			var id = getUrlParameter('Id');
			var id = $("#empId").val();
			//alert("id >>>>"+id);	
			$.ajax({
					url : "${pageContext.request.contextPath}/leave/listAll/"+id,
					type : "POST",
					success : function(data) {
						dt.fnClearTable();
					for (var i=0;i< data.length; i++) {
						dt.fnAddData([
						              
						             
						              //data[i].startDate,
						              data[i].startTimeString,
						              //data[i].endDate,
						              data[i].endTime,
						              data[i].masleavetype,
						              data[i].reason,
						              data[i].nameEng,
						              
						              
							 '<button type="button" class="btn btn-warning btn-sm active" data-id="' + data[i].id + '" data-target="#addModal" data-toggle="modal">Edit</button>'+
							'<button type="button" class="btn btn-danger btn-sm active" data-id="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">Delete</button>']);
				 	}
					},
					error : function() { 
						alert("ERROR");
					}
				}); 
			}
		
		
		 function clearModal(){
				
				$("#masleavetype").val(""),
				//$("#startDate").val(""),
				//$("#endDate").val(""),
				$("#startTime").val(""),
				$("#endTime").val(""),
				$("#reason").val(""),
				$("#aim").val("");
				
				
				
				;
			}
		
		 function getUrlParameter(sParam)
		 {
		 	//alert("url "+document.referrer);
		     var sPageURL = document.referrer;
		     var sURLVariables = sPageURL.split('?');
		     var sParameterName;
		     //alert("spilt "+sURLVariables);
		    	
		     
		     sParameterName = sURLVariables[1].split('=');
		     //alert("Param "+parseInt(sParameterName[1]));
		     if (sParameterName[0] == sParam) 
		         {
		         	//alert("Param "+sParameterName[0]);
		         	return sParameterName[1];
		         	
		         }
		         //alert("Param2 "+parseInt(sParameterName[1]));
		     
		 }      
		 	
		
		
});
</script>


</body>
</html>