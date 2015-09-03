
var dt;
var rowUpdate;
var dataUpdate;
var getIndex = 0;

	$(document).ready(function() {


		
		$("#telHome").mask("99-999-9999");
		$("#telMobile").mask("999-999-9999");
		$("#telFax").mask("99-999-9999");
		$("#idCard").mask("9-9999-99999-99-9");
		$("#emergencyContactPhoneNumber").mask("999-999-9999"); 
		
		$('#salaryExpected').mask('0,000,000.00', {reverse: true});
		
		
		/* $("#startWorkDate").datepicker({
	        minDate: 0,
	        maxDate: "+60D",
	        numberOfMonths: 2,
	        onSelect: function(selected) {
	          $("#txtToDate").datepicker("option","minDate", selected)
	        }
	    });
		
		$("#endWorkDate").datepicker({ 
	        minDate: 0,
	        maxDate:"+60D",
	        numberOfMonths: 2,
	        onSelect: function(selected) {
	           $("#txtFromDate").datepicker("option","maxDate", selected)
	        }
	    });  */
		
//------------------------------------------------------ Validate --------------------------------------------------------------------------------------------

$(".closeAddressButton").off("click").on("click",function() {
	//$('#validateAddress').bootstrapValidator('resetForm', true);
});
		
		
$("#validateAddress").validate({
	rules: {
		addressType: "required",
		address1: "required",
		address2: "required",
		province: "required",
		zipcode: {
			required: true,
			 digits: true,
			 rangelength : [5, 5]
		}
		
	},
	messages: {
		addressType: $validateaddressType,
		address1: $validateaddress1,
		address2: $validateaddress2,
		province: $validateprovince,
		zipcode: $validatezipcode
		
	}
});		
		
		
$("#addForm").validate({
	rules: {
		nameThai: "required",
		surnameThai: "required",
		nicknameThai: "required",
		nameEng: "required",
		surnameEng: "required",
		nicknameEng: "required",
		congenitalDisease: "required",
		hospital: "required",
		
		emergencyContact: "required",
		relationshipWithEmergencyContact: "required",
		emergencyContactAddress: "required",
		dateOfBirth: "required",
		placeOfBirth: "required",
		fromYear: "required",
		toYear: "required",
		
		religion: "required",
		issuedOffice: "required",
		expiryDate: "required",
		
		sex:{ required:true},
		maritalStatus:{ required:true},
		spouseName: "required",
		marriageCertificateNo: "required",
		
		issuedOffice2: "required",
		address: "required",
		occupation: "required",
		militaryServiceYes: "required",
		descriptionYes: "required",
		
		branchOfService: "required",
		serviceNo: "required",
		reasonsNo: "required",
		dateToBeDrafted: "required",
		previousEmpreasonsNo: "required",
		
		officialDate: "required",
		startWorkDate: "required",
		/*endWorkDate: "required", */
		positionAppliedFor: "required",
		
		probationDate: "required",
		masEmployment: "required",
		masCoreSkill: "required",
		masLocation: "required",
		masDivision: "required",
		
		masJoblevel: "required",
		technology: "required",
		masStaffType: "required",
		
		email: {
			required: true,
			email: true
		}, 
		
	 	telHome: {
			required: true,
			rangelength : [11, 11]
			/*  digits: true, 
			 minlength: 9,
			 maxlength: 9  */ 
			 
		}, 
		
		telMobile: {
			required: true,
			rangelength : [12, 12]
			 /* digits: true,
			 minlength: 10,
			 maxlength: 10 */
		},
		
		telFax: {
			required: true,
			rangelength : [11, 11]
			 /* digits: true,
			 minlength: 10,
			 maxlength: 10 */
		},
		
		idCard: {
			required: true,
			rangelength : [17, 17]
			 /* digits: true,
			 minlength: 13,
			 maxlength: 13 */
		},
		
		age: {
			required: true,
			 digits: true,
			 minlength: 2
		},
		
		height: {
			required: true,
			 digits: true
		},
		
		weigth: {
			required: true,
			 digits: true
		},
		
		emergencyContactPhoneNumber: {
			required: true,
			rangelength : [12, 12]
			 /* digits: true,
			 minlength: 10,
			 maxlength: 10 */
		},
		
		numberOfChildren: {
			required: true,
			 digits: true
		},
		
		salaryExpected: {
			required: true
			 /* digits: true */
		},
		statusemp: "required"
	
	},
	
	messages: {
		nameThai: $validatenameThai,
		surnameThai: $validatesurnameThai,
		nicknameThai: $validatenicknameThai,
		nameEng: $validatenameEng,
		surnameEng: $validatesurnameEng,
		nicknameEng: $validatenicknameEng,
		
		email: $validateemail,
		telHome: $validatetelHome,
		telMobile: $validatetelMobile,
		telFax: $validatetelFax,
		congenitalDisease: $validatecongenitalDisease,
		hospital: $validatehospital,
		
		emergencyContact: $validateemergencyContact,
		relationshipWithEmergencyContact: $validaterelationshipWithEmergencyContact,
		emergencyContactAddress: $validateemergencyContactAddress,
		emergencyContactPhoneNumber: $validateemergencyContactPhoneNumber,
		dateOfBirth: $validatedateOfBirth,
		fromYear: $validatefromYear,
		
		toYear: $validatetoYear,
		placeOfBirth: $validateplaceOfBirth,
		age: $validateage,
		religion: $validatereligion,
		idCard: $validateidCard,
		issuedOffice: $validateissuedOffice,
		
		expiryDate: $validateexpiryDate,
		height: $validateheight,
		weigth: $validateweigth,
		sex: $validatesex,
		maritalStatus: $validatemaritalStatus,
		numberOfChildren: $validatenumberOfChildren,
		
		spouseName: $validatespouseName,
		marriageCertificateNo: $validatemarriageCertificateNo,
		issuedOffice2: $validateissuedOffice2,
		address: $validateaddress,
		occupation: $validateoccupation,
		militaryServiceYes: $validatemilitaryServiceYes,
		
		descriptionYes: $validatedescriptionYes,
		branchOfService: $validatebranchOfService,
		serviceNo: $validateserviceNo,
		reasonsNo: $validatereasonsNo,
		dateToBeDrafted: $validatedateToBeDrafted,
		previousEmpreasonsNo: $validatepreviousEmpreasonsNo,
		
		officialDate: $validateofficialDate,
		startWorkDate: $validatestartWorkDate,
		/*endWorkDate: $validateendWorkDate,*/ 
		positionAppliedFor: $validatepositionAppliedFor,
		salaryExpected: $validatesalaryExpected,
		probationDate: $validateprobationDate,
		
		masEmployment: $validatemasEmployment,
		masCoreSkill: $validatemasCoreSkill,
		masLocation: $validatemasLocation,
		masDivision: $validatemasDivision,
		masJoblevel: $validatemasJoblevel,
		technology: $validatetechnology,
		masStaffType: $validatemasStaffType,
		statusemp: $validatestatusemp
		
		
		
	}
});		
	

/* -------------------------------------------- Validate CheckBox ----------------------------------------------------------- */	
$("#descriptionNewspaper").hide();//descriptionYes ชื่อกล่อง
$("input:checkbox[name=knowAugNewspaper]").change(function(){//name= ชื่อ group checkbox

	if(this.value == 'Newspaper' && this.checked){
	 $("#descriptionNewspaper").show();
	}else{
	$("#descriptionNewspaper").hide();
}
});


$("#descriptionMagazine").hide();//descriptionYes ชื่อกล่อง
$("input:checkbox[name=knowAugMagazine]").change(function(){//name= ชื่อ group checkbox

	if(this.value == 'Magazine' && this.checked){
	 $("#descriptionMagazine").show();
	}else{
	$("#descriptionMagazine").hide();
}
});

$("#descriptionWebsite").hide();//descriptionYes ชื่อกล่อง
$("input:checkbox[name=knowAugWebsite]").change(function(){//name= ชื่อ group checkbox

	if(this.value == 'Website' && this.checked){
	 $("#descriptionWebsite").show();
	}else{
	$("#descriptionWebsite").hide();
}
});

$("#descriptionFriend").hide();//descriptionYes ชื่อกล่อง
$("input:checkbox[name=knowAugFriend]").change(function(){//name= ชื่อ group checkbox

	if(this.value == 'Friend' && this.checked){
	 $("#descriptionFriend").show();
	}else{
	$("#descriptionFriend").hide();
}
});


$("#descriptionOther").hide();//descriptionYes ชื่อกล่อง
$("input:checkbox[name=knowAugOther]").change(function(){//name= ชื่อ group checkbox

	if(this.value == 'Other' && this.checked){
	 $("#descriptionOther").show();
	}else{
	$("#descriptionOther").hide();
}
});

if($('#Newspaper').prop( "checked" )){
	 $("#descriptionNewspaper").show();
}

if($('#Magazine').prop( "checked" )){
	 $("#descriptionMagazine").show();
}

if($('#Website').prop( "checked" )){
	 $("#descriptionWebsite").show();
}

if($('#Friend').prop( "checked" )){
	 $("#descriptionFriend").show();
}


if($('#Other').prop( "checked" )){
	$("#descriptionOther").show();
}
/* -------------------------------------------- Validate radio Yes/No ----------------------------------------------------------- */		

$("#descriptionYes").hide();//descriptionYes ชื่อกล่อง
$("input:radio[name=knowEmployed]").change(function(){//name= ชื่อ group radio

	if(this.value == 'Yes' && this.checked){
	 $("#descriptionYes").show();
	}else{
	$("#descriptionYes").hide();
}
});


if($('#knowEmployed').val()=="Yes"){
	$("#descriptionYes").show();
	
}else if($('#knowEmployed').val()=="No"){
	$("#descriptionYes").hide();
	
}



$("#fromYear").hide();//descriptionYes ชื่อกล่อง
$("#toYear").hide();
$("#branchOfService").hide();
$("#serviceNo").hide();
$("input:radio[name=militaryService]").change(function(){//name= ชื่อ group radio

	if(this.value == 'Yes' && this.checked){
	 $("#fromYear").show();
	 $("#toYear").show();
	 $("#branchOfService").show();
	 $("#serviceNo").show();
	 
	}else{
		 $("#fromYear").hide();
		 $("#toYear").hide();
		 $("#branchOfService").hide();
		 $("#serviceNo").hide();
  }
});


if($('#militaryService').val()=="Yes"){
	 $("#fromYear").show();
	 $("#toYear").show();
	 $("#branchOfService").show();
	 $("#serviceNo").show();
	
	
}else if($('#knowEmployed').val()=="No"){
	 $("#fromYear").hide();
	 $("#toYear").hide();
	 $("#branchOfService").hide();
	 $("#serviceNo").hide();
	
}



$("#reasonsNo").hide();//descriptionYes ชื่อกล่อง
$("#dateToBeDrafted").hide();
$("input:radio[name=militaryService]").change(function(){//name= ชื่อ group radio

if(this.value == 'No' && this.checked){
	 $("#reasonsNo").show();
	 $("#dateToBeDrafted").show();
	 
	}else{
		$("#reasonsNo").hide();
		$("#dateToBeDrafted").hide();
}
});

if($('#militaryService').val()=="No"){
	 $("#reasonsNo").show();
	 $("#dateToBeDrafted").show();
	
	
}else if($('#knowEmployed').val()=="Yes"){
	 $("#reasonsNo").hide();
	 $("#dateToBeDrafted").hide();
	
}




$("#previousEmpreasonsNo").hide();//descriptionYes ชื่อกล่อง
$("input:radio[name=previousEmployer]").change(function(){//name= ชื่อ group radio

	if(this.value == 'No' && this.checked){
	 $("#previousEmpreasonsNo").show();
	}else{
	$("#previousEmpreasonsNo").hide();
}
});
		
if($('#previousEmployer').val()=="No"){
	$("#previousEmpreasonsNo").show();
	
}else if($('#previousEmployer').val()=="Yes"){
	$("#previousEmpreasonsNo").hide();
	
}
		
		
		var date1 = $( "#dateOfBirth" ).datetimepicker({
			format : "DD-MM-YYYY",
			viewMode : 'years'
		});
		
    	var date2 = $( "#expiryDate" ).datetimepicker({
    		format : "DD-MM-YYYY",
		});
    	
    	var date3 = $( "#fromYear" ).datetimepicker({
    		format : "DD-MM-YYYY",
		});
    	
    	var date4 = $( "#toYear" ).datetimepicker({
    		format : "DD-MM-YYYY",
		});
    	
    	var date5 = $( "#dateToBeDrafted" ).datetimepicker({
    		format : "DD-MM-YYYY",
		});
    	
    	var date6 = $( "#officialDate" ).datetimepicker({
    		format : "DD-MM-YYYY",
		});
    
    	
    	var date6 = $( "#startWorkDate" ).datetimepicker({
    		format : "DD-MM-YYYY"
		});
    	
    
    	
    	var date6 = $( "#endWorkDate" ).datetimepicker({
    		format : "DD-MM-YYYY",
		});
    	
 	
    	
    	var date6 = $( "#probationDate" ).datetimepicker({
    		format : "DD-MM-YYYY",
		});
    	
    
    	
     if($('#id').val()==null||$('#id').val()===''){
    	 
    	 $('#endWorkDate').data("DateTimePicker").disable();
    	 
     }
    	
     if($('#id').val()!=null&&$('#id').val()!==''){
     	 
    	  var defaultDate2 = new Date($('#startWorkDate').data("DateTimePicker").date());
		  defaultDate2.setDate(defaultDate2.getDate()+1);
		  $('#endWorkDate').data("DateTimePicker").minDate(defaultDate2);
    	 
    	
    	 $("#startWorkDate").on("dp.change", function (d) {
  				 
    		      var defaultDate = new Date($('#startWorkDate').data("DateTimePicker").date());
				  defaultDate.setDate(defaultDate.getDate()+1);
				  $('#endWorkDate').data("DateTimePicker").minDate(defaultDate);
				  /* $('#endWorkDate').data("DateTimePicker").date(defaultDate); */
    	
         }); 
    		
     }	
     
     
     $('#toYear').data("DateTimePicker").disable();
     
    if($("input[name='fromYear']").val()==null||$("input[name='fromYear']").val()===''){
    	
    	
        $("#fromYear").on("dp.change", function (d) {
   			 
      	  $('#toYear').data("DateTimePicker").enable();    	
   	      var defaultDate4 = new Date($('#fromYear').data("DateTimePicker").date());
   		  defaultDate4.setDate(defaultDate4.getDate()+1);
   		  $('#toYear').data("DateTimePicker").minDate(defaultDate4);
   		  /* $('#endWorkDate').data("DateTimePicker").date(defaultDate); */
	
   		}); 
    	
    } else if($("input[name='fromYear']").val()!=null&&$("input[name='fromYear']").val()!==''){
    	
    	  $('#toYear').data("DateTimePicker").enable();    	
    	  var defaultDate3 = new Date($('#fromYear').data("DateTimePicker").date());
		  defaultDate3.setDate(defaultDate3.getDate()+1);
		  $('#toYear').data("DateTimePicker").minDate(defaultDate3);
    	
         $("#fromYear").on("dp.change", function (d) {
    			 
    	      var defaultDate4 = new Date($('#fromYear').data("DateTimePicker").date());
    		  defaultDate4.setDate(defaultDate4.getDate()+1);
    		  $('#toYear').data("DateTimePicker").minDate(defaultDate4);
    		  /* $('#endWorkDate').data("DateTimePicker").date(defaultDate); */

    	}); 
    }
		
     
		
    	$('[name="saveButton"]').click(function() {
    							
			$('[name="employeeForm"]').attr('action',
					$getContextPath+"/employee/submit");
			$('[name="employeeForm"]').submit(); 
		});
    	
    	 dt=$("#tbResult").dataTable( 
    		 	 { 
    		 		"searching": false,
    				"bLengthChange": false,
    				"iDisplayLength": 10,
    				"pagingType": "simple_numbers",
    				"ordering": false,
    				"info": false,
    				"paging": false,
    		 		 
    		 	 
    		 		 "columnDefs": [
    	    	                  {
    	    	                     "targets": [ 0 ],
    	    	                     "visible": false
    	    	                 },
    	    	                 {
    	    	                     "targets": [ 1 ],
    	    	                     "visible": false
    	    	                 },
    	    	                 
    	    	                  {
    	    	                     "targets": [ 5 ],
    	    	                     "visible": false
    	    	                 }, 
    	    	                 
    	    	                 {
    	    	                     "targets": [ 7 ],
    	    	                     "visible": false
    	    	                 },
    	    	                 
    	    	                 {
    	    	                     "targets": [ 8 ],
    	    	                     "visible": false
    	    	                 },
    	    	                 
    	    	                 {
    	    	                     "targets": [ 10 ],
    	    	                     "visible": false
    	    	                 }     	    	                 
    	    	           ]  
    			
    			} ); 
    	 
          	 
			    	
		
/* 	 	$("#nameThai").val('bbb');
		$("#surnameThai").val('aaa');
		$("#nicknameThai").val('nnn');
		$("#nameEng").val('mmm');
		$("#surnameEng").val('ppp');
		$("#nicknameEng").val('aaa');
		$("#email").val('bb@hotmail.com');
		$("#telHome").val('02356995');
		$("#telMobile").val('02445533');
		$("#telFax").val('0235996');
		$("#congenitalDisease").val('help');
		$("#hospital").val('rama');
		$("#emergencyContact").val('bbaa');
		$("#relationshipWithEmergencyContact").val('mom');
		$("#emergencyContactAddress").val('adcd');
		$("#emergencyContactPhoneNumber").val('0235660');
		//$("#dateOfBirth").val(),
		$("#placeOfBirth").val('home');
		$("#age").val(25);
		$("#religion").val('christ');
		$("#idCard").val(122233333333);
		$("#issuedOffice").val('bnn');
		//$("#expiryDate").val(),
		$("#height").val(160);
		$("#weigth").val(45);
		$("#Female").prop('checked','checked');
		$("#Married").prop('checked','checked');
		$("#numberOfChildren").val('5');
		$("#spouseName").val('num');
		$("#marriageCertificateNo").val('2');
		$("#issuedOffice2").val('aa');
		$("#address").val('aaa/bb');
		$("#occupation").val('vvvv');
		$("#Newspaper").prop('checked','checked');
		$("#descriptionNewspaper").val('nn');
		$("#Magazine").prop('checked','checked');
		$("#descriptionMagazine").val('doo');
		$("#Website").prop('checked','checked');
		$("#descriptionWebsite").val('vv');
		$("#Friend").prop('checked','checked');
		$("#descriptionFriend").val('aa');
		$("#Other").prop('checked','checked');
		$("#descriptionOther").val('ll');
		$("#Yes").prop('checked','checked');
		$("#descriptionYes").val('yes');
		$("#No").prop('checked','checked');
		//$("#militaryServiceYes").prop('checked','checked');
		//$("#fromYear").val(),
		//$("#toYear").val(),
		$("#branchOfService").val('gg');
		$("#serviceNo").val('aa');
		//$("#militaryServiceNo").prop('checked','checked');
		$("#reasonsNo").val('bbb');
		//$("#dateToBeDrafted").val();
		$("#previousEmployerYes").prop('checked','checked');
		$("#previousEmployerNo").prop('checked','checked');
		$("#previousEmpreasonsNo").val('n');
		$("#statusemp").val('office');  */

		
		
			    	  
			    
			           $("#masLocation").change(function() {
				    	   //alert('bb');
				    	   var code = $("#masLocation").val();
				    	   //alert(code);
				    	   $('#employeeCodeForShow').val(''); 
				  	       $('#employeeCode').val(''); 

			           }); 
			           
			           
			
			           
			       	
			 			$("#uploadFile").on("change", function()
					    {
			 			    
					        var files = !!this.files ? this.files : [];
					        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

					        if (/^image/.test( files[0].type)){ // only image file
					            var reader = new FileReader(); // instance of the FileReader
					            reader.readAsDataURL(files[0]); // read the local file

					            reader.onloadend = function(){ // set image data as background of div
					            	
					                $("#imagePreview").css("background-image", "url("+this.result+")");
			   	              }
					        }
					        
					    });
			 		
			 		
			 		
			    		
			    		
			    $('body').on('click','#addaddress', function() {
			    	
			    		
			  		$("#saveAddressButton").off("click").on("click", function()
			  				
			  		{
			  			if($("#validateAddress").valid()
			  		){
			   				
			  			addAddress();
			  			}
						
					});
			    		
			    });		
			    		
			    	

			        $("#myModal").on("hide.bs.modal", function(event){
			        	
			        	clearDataModal();
			       
			        });
			    		
			    		
			    
			    	$("#deleteModal").on("show.bs.modal", function(event){
			   	    	  
			 	    	    var button = $(event.relatedTarget);
			 	    		var idDelete = button.data("iddelete"); 
			 	    		
			 	     		
			 	    		$(this).find("#delete").off("click").on("click", function()
			 	    		{
			 	    			doDeleteDataPost(idDelete);
			 	    		});
			 	    	  
			 	      });
			  		
			  		
			 /* --------------------------------------------------- Clear Address Function --------------------------------------------------- */	  		
			  		function clearDataModal(){
			  			
			  			$('#addressType').val('');
			  			$('#address1').val('');
			  			$('#address2').val('');
			  			$("#province").val('');
			  			$('#zipcode').val('');
			  			
			  		}

			   
			   	/* ----------------------------------------------------- Add Address Function --------------------------------------------------- */		
						
						function addAddress() {
							alert("Do you want to Add Address ?"); 
							
			 				 var addressId = $("#addressType").val();
							 var addressType = $("#addressType option:selected").text();
							 
							 var address1 = $("#address1").val();
							 var address2 = $("#address2").val();
							 
							 var provinceId = $("#province").val();
							 var province = $("#province option:selected").text();
							 
							 var zipcode= $("#zipcode").val();
							 
							 var id=0;
							 var status="add";
							 
							  dt.fnAddData([  id, 
							                  addressId,
							                  addressType,
								              address1,
								              address2,
								              provinceId,
								              province,
								              zipcode,
								              getIndex,
								              
								              '<button id="edit" type="button" class="btn btn-warning btn-sm active"  data-target="#addModal" style="margin-right :15px;" data-toggle="modal">'+$msgEdit+'</button>'+
							    			  '<button id="delete" type="button" class="btn btn-danger btn-sm active" data-target="#deleteModal" data-toggle="modal">'+$msgDelete+'</button>',
							    			 
							    			  status
							    				
						   	 ]); 
							  
							  
							  $('<input>').attr({
								    type: 'hidden',
								    id: 'dataaddressid'+getIndex,
								    name: 'addressList['+getIndex+'].id',
								    value: id
								}).appendTo('form');
							  
							  
							  $('<input>').attr({
								    type: 'hidden',
								    id: 'dataaddresstype'+getIndex,
								    name: 'addressList['+getIndex+'].addressTypeId',
								    value: addressId
								}).appendTo('form');
							  
							  $('<input>').attr({
								    type: 'hidden',
								    id: 'dataaddress1'+getIndex,
								    name: 'addressList['+getIndex+'].address1',
								    value: address1
								}).appendTo('form');
							  
							  $('<input>').attr({
								    type: 'hidden',
								    id: 'dataaddress2'+getIndex,
								    name: 'addressList['+getIndex+'].address2',
								    value: address2
								}).appendTo('form');
							  
							  $('<input>').attr({
								    type: 'hidden',
								    id: 'dataprovinceid'+getIndex,
								    name: 'addressList['+getIndex+'].masprovinceId',
								    value: provinceId
								}).appendTo('form');
							  
							  $('<input>').attr({
								    type: 'hidden',
								    id: 'datazipcode'+getIndex,
								    name: 'addressList['+getIndex+'].zipcode',
								    value: zipcode
								}).appendTo('form');
							  
							  $('<input>').attr({
								    type: 'hidden',
								    id: 'datastatus'+getIndex,
								    name: 'addressList['+getIndex+'].status',
								    value: status
								}).appendTo('form');
							  
							 
							 
							  
							  getIndex = getIndex+1; 
							
							 
							  $('#myModal').modal('toggle');
							  clearDataModal();
							  //$('#validateAddress').bootstrapValidator('resetForm', true);
			   	
			   	    }
			   	
			   	
			/* ----------------------------------------------------- Edit Address Function --------------------------------------------------- */		
					 	
						$('#tbResult tbody').on( 'click', '#edit', function (){		   
					    	
							
					    	  rowUpdate = $(this).parents('tr');
					    	  dataUpdate = dt.fnGetData($(this).parents('tr'));
					    	  //alert("data[1]: "+dataUpdate[1]); 
					    	
					    	  editAddress(rowUpdate,dataUpdate);
					    	    	  
					  }); 
			   	
			   	

			   	
			   	function editAddress(rowUpdate,dataUpdate){
			   		
			   		$('#myModal').modal('show');
			   		
			   		$("#addressType").val(dataUpdate[1]);
			   		$("#address1").val(dataUpdate[3]);
			   		$("#address2").val(dataUpdate[4]);
			   		$("#province").val(dataUpdate[5]);
			   		$("#zipcode").val(dataUpdate[7]);
			   		
			   		
			   		$('#saveAddressButton').off("click").on("click",function(){
			   			
			   			/* $('[name="validateAddress"]').submit();
			   			if($('#validateAddress').data('bootstrapValidator').isValid()){ */
				   			
				   			
			   			
			   		var id = dataUpdate[0];	
			   		var addressId = $("#addressType").val();
					var addressType = $("#addressType option:selected").text();
					
			   		var address1 = $("#address1").val();
			   		var address2 = $("#address2").val();
			   		
			   	    var provinceId = $("#province").val();
				    var province = $("#province option:selected").text();
				    var zipcode= $("#zipcode").val();
				   
			   		
				    
			   		
			   		if(dataUpdate[0]!=0){
			   			
			   			dt.fnUpdate(addressId, rowUpdate, 1);
			   			dt.fnUpdate(addressType, rowUpdate, 2);
					    dt.fnUpdate(address1, rowUpdate, 3);
					    dt.fnUpdate(address2, rowUpdate, 4);
					    dt.fnUpdate(provinceId, rowUpdate, 5);
					    dt.fnUpdate(province, rowUpdate, 6);
					    dt.fnUpdate(zipcode, rowUpdate, 7);
					    dt.fnUpdate('edit', rowUpdate, 10);
					    
					    $("#dataaddressid"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].id");
					    $("#dataaddressid"+dataUpdate[8]).val(id);
					    
					    $("#dataaddresstype"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].addressTypeId");
					    $("#dataaddresstype"+dataUpdate[8]).val(addressId);
					    
					    $("#dataaddress1"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].address1");
					    $("#dataaddress1"+dataUpdate[8]).val(address1);
					    
					    $("#dataaddress2"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].address2");
					    $("#dataaddress2"+dataUpdate[8]).val(address2);
					    
					    $("#dataprovinceid"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].masprovinceId");
					    $("#dataprovinceid"+dataUpdate[8]).val(provinceId);
					    
					
					    $("#datazipcode"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].zipcode");
					    $("#datazipcode"+dataUpdate[8]).val(zipcode);
					    
					    $("#datastatus"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].status");
					    $("#datastatus"+dataUpdate[8]).val('edit');
					    
					    
					    
			   	 }else{
			   		 
			   		dt.fnUpdate(addressId, rowUpdate, 1);
				    dt.fnUpdate(addressType, rowUpdate, 2);
				    dt.fnUpdate(address1, rowUpdate, 3);
				    dt.fnUpdate(address2, rowUpdate, 4);
				    dt.fnUpdate(provinceId, rowUpdate, 5);
				    dt.fnUpdate(province, rowUpdate, 6);
				    dt.fnUpdate(zipcode, rowUpdate, 7);
				    
				    $("#dataaddressid"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].id");
				    $("#dataaddressid"+dataUpdate[8]).val(id);
				    
				    $("#dataaddresstype"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].addressTypeId");
				    $("#dataaddresstype"+dataUpdate[8]).val(addressId);
				    
				    $("#dataaddress1"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].address1");
				    $("#dataaddress1"+dataUpdate[8]).val(address1);
				    
				    $("#dataaddress2"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].address2");
				    $("#dataaddress2"+dataUpdate[8]).val(address2);
				    
				    $("#dataprovinceid"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].masprovinceId");
				    $("#dataprovinceid"+dataUpdate[8]).val(provinceId);
				    
				
				    $("#datazipcode"+dataUpdate[8]).attr('name', "addressList["+dataUpdate[8]+"].zipcode");
				    $("#datazipcode"+dataUpdate[8]).val(zipcode);

			   		
			   	 }
			   		
			   		$('#myModal').modal('toggle');
			   			
			   		});
			   	
			   	
			   	} 
			   	
			   	
			   	
			   	$('#tbResult tbody').on( 'click', '#delete', function (){	
			   		
			   	  var row = $(this).parents('tr');
			      var dataDelete = dt.fnGetData($(this).parents('tr'));
			      if(dataDelete[0]==0){
			   	  
				   	 $('#yesButton').off("click").on("click",function(){ 
				   	  
					  dt.fnDeleteRow(row);
					
					  $( '#dataaddressid'+dataDelete[0] ).remove();
					  $( '#dataaddresstype'+dataDelete[0] ).remove();
					  $( '#dataaddress1'+dataDelete[0] ).remove();
					  $( '#dataaddress2'+dataDelete[0] ).remove();
					  $( '#dataprovinceid'+dataDelete[0] ).remove();
					  $( '#datazipcode'+dataDelete[0] ).remove();
					  $( '#datastatus'+dataDelete[0] ).remove();
					 
					 
					  $('#deleteModal').modal('toggle');
					  
				   	});
				 		
			      }else{
			    	  
			    	  $('#yesButton').off("click").on("click",function(){ 
			    		  
			    		  //alert(dataDelete[8]);
				    	  dt.fnUpdate('delete', row, 10);
				    	  $("#datastatus"+dataDelete[8]).attr('name', "addressList["+dataDelete[8]+"].status");
						  $("#datastatus"+dataDelete [8]).val('delete');
						  dt.fnDeleteRow(row);
						  $('#deleteModal').modal('toggle');

			    	 	});
			      }
			   	 
			   	 
			   	clearDataModal();
			 });
			   	
			   	
			   	
			   	
			   	
			   	
			   	if($('#id').val()!=null||$('#id').val()!==""){
			   		
			   	    listAddress($('#id').val());
			   		
			   	}		
			   		
			   	
			   		function listAddress(id){
			   			
			    			//alert('list address: '+id);
							var status = 'unmodified';
			   			
			   			$.ajax({
							url : $getContextPath+"/employee/address/",
							data: JSON.stringify({"employeeId":id}),
							type : "POST",
							dataType : 'json', 
						  	//data : JSON.stringify({"id":id}),  
						  	contentType :"application/json; charset=utf-8",
							success : function(data) {
						    dt.fnClearTable();
							for (var i=0;i< data.length; i++) {
							
									dt.fnAddData([
									          data[i].id,
								              data[i].addressTypeId,
								              data[i].masaddresstypeName,
								              data[i].address1,
								              data[i].address2, 
								              data[i].masprovinceId, 
								              data[i].masprovinceName, 					              
								              data[i].zipcode,
								              getIndex,
									'<button id="edit" type="button" class="btn btn-warning btn-sm active" data-addId="' + data[i].id + '" data-target="#addModal" style="margin-right :15px; data-toggle="modal">'+$msgEdit+'</button>'+
									'<button id="delete" type="button" class="btn btn-danger btn-sm active" data-addId="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">'+$msgDelete+'</button>',
									 "unmodified",
									]);
								 
									
									  $('<input>').attr({
										    type: 'hidden',
										    id: 'dataaddressid'+getIndex,
										    name: 'addressList['+getIndex+'].id',
										    value: data[i].id
										}).appendTo('form');
									  
									  
									  $('<input>').attr({
										    type: 'hidden',
										    id: 'dataaddresstype'+getIndex,
										    name: 'addressList['+getIndex+'].addressTypeId',
										    value: data[i].addressTypeId
										}).appendTo('form');
									  
									  $('<input>').attr({
										    type: 'hidden',
										    id: 'dataaddress1'+getIndex,
										    name: 'addressList['+getIndex+'].address1',
										    value: data[i].address1
										}).appendTo('form');
									  
									  $('<input>').attr({
										    type: 'hidden',
										    id: 'dataaddress2'+getIndex,
										    name: 'addressList['+getIndex+'].address2',
										    value: data[i].address2
										}).appendTo('form');
									  
									  $('<input>').attr({
										    type: 'hidden',
										    id: 'dataprovinceid'+getIndex,
										    name: 'addressList['+getIndex+'].masprovinceId',
										    value: data[i].masprovinceId
										}).appendTo('form');
									  
									  $('<input>').attr({
										    type: 'hidden',
										    id: 'datazipcode'+getIndex,
										    name: 'addressList['+getIndex+'].zipcode',
										    value: data[i].zipcode
										}).appendTo('form');
									  
									  $('<input>').attr({
										    type: 'hidden',
										    id: 'datastatus'+getIndex,
										    name: 'addressList['+getIndex+'].status',
										    value: status
										}).appendTo('form');
									
									
									getIndex = getIndex+1; 
//			 						alert(getIndex);
						
							  }
							} /*,
							error : function(data,testStatus,jqXHR) {
								alert('err');
								$("#outputajax").text(testStatus);
								} */
							}); 
					}
				
			 
			   		
			  
			   		
			   		$('.renew').click(function() {
				
					 if( $('#id').val()==null||$('#id').val()===''){
						 window.location = $getContextPath+"/employee";
					 }else if($('#id').val()!=null||$('#id').val()!==''){
						 window.location = $getContextPath+"/employee/init/"+$('#id').val();
					 }
				 });
			
          
			           
			       
			});
		


 	