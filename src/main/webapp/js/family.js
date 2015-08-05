/**
 * @author apiva kimkatanom
 * @date   Aug 5, 2015
 */

   $(document).ready(function(){
	   
	    var dt;
	    var idUpdate;
	    var idDelete ;
	    var $form = $('#formAdd');
	    var $firstName = $('#firstName');
        var $lastName  = $('#lastName');
        var $address   =  $('#address');
        var $relation  =  $('#relation');
        var $occupation  =  $('#occupation');
        var $position = $('#position');
        var $age = $('#age');
        var $mobile  = $('#mobile');
        var $masRelation  = $('#masRelation');
			
		
			
	    	$('#saveBtn').on("click",function(){
				
	    		$form.bootstrapValidator('resetForm', true);

			});
			
			
			 $('#mobile').mask("999-999-9999",{placeholder:"xxx-xxx-xxxx"});

			
			
			 
			    $form.bootstrapValidator({
				   
				   message: 'This value is not valid',
			        //container: 'tooltip',
			        feedbackIcons: {
			            valid: 'glyphicon glyphicon-ok',
			            invalid: 'glyphicon glyphicon-remove',
			            validating: 'glyphicon glyphicon-refresh'
			        },
			        fields: {
			        	
			        	firstName: {
			                validators: {
			                    notEmpty: {
			                        message: $requiredFamilyName
			                    }
			                }
			            },
			            lastName: {
			                validators: {
			                    notEmpty: {
			                        message: $requiredLastName  
			                    }
			                }
			            },
			            age: {
			                validators: {
			                    notEmpty: {
			                        message: $requiredAge 
			                    },
			                    digits: {
			                    	message: $ageIsDigit 
			                    },		      
			                    regexp: {
					                regexp: /^[1-9]/,
					                message: $ageIsZero	
					            },

			                }
			            },
			            mobile: {
			                validators: {
			                    notEmpty: {
			                        message: $requiredMobile	
			                    },
			                    regexp: {
					                regexp: /^[0-9]{3}-[0-9]{3}-[0-9]{4}/,
					                message: $formatMobile
					            },
			                  
			                }
			            },
			            address: {
			                validators: {
			                    notEmpty: {
			                        message: $requiredAddress
			                    },
			                  
			                }
			            },
			            masRelation: {
			                validators: {
			                    notEmpty: {
			                        message: $requiredMasRelation 
			                    },
			                  
			                  
			                }
			            },
			        }
			 
	    }); 
				
			 
			 $('#tableResult').dataTable({ 
					"bLengthChange": false,
					"iDisplayLength": 10,
					"pagingType": "simple_numbers",
					"ordering": false,
					"info": false,
					"dom": '<"toolbar">frtip'
				});

			 $("div.toolbar").html('<b><button type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#addModal">'+$msgNewRecord+'</button> </b>');
		     dt = $('#tableResult').dataTable();  	
		
		      
		      doFindData();
		      
		      
			 function clearModal() {
		    	  
		          $(this).removeData('bs.modal');
		          $firstName.val("");
		          $lastName.val("");
		          $("#genderMale").prop("checked", true);
		          $address.val("");
		          $relation.val("");
		          $occupation.val("");
		          $position.val("");
		          $age.val("");
		          $mobile.val("");
		          $masRelation.val("");
		          
		      } 
		      
			
		      function doFindData() {  
			   	   
		    	     var id = $("#empId").val();
			  	     $.ajax({  
			  	      type : "POST",   
			  	      url : $getContextPath+"/family/list/"+id,   
			  	      dataType : 'json', 
			  	      contentType :"application/json; charset=utf-8",
			  	     
			  	      success : function(data) {  
			    		
			  	    	
			  	    
			  	        dt.fnClearTable();
			  	    	
			  	        for(var i=0;i<data.length;i++){
				  			 	
				  			        
			  	        	   dt.fnAddData([  
						  			           data[i].firstName+" "+data[i].lastName,					  			          
						  			           data[i].occupation,
						  			           data[i].mobile,
						  			           data[i].masRelationTypeName,
						  			          '<button type="button"  style="margin-right :15px;" class="btn btn-warning btn-sm active" data-idupdate="' + data[i].id + '" data-target="#addModal" data-toggle="modal">'+$msgEdit+'</button>'+
						    				  '<button type="button" class="btn btn-danger btn-sm active" data-iddelete="' + data[i].id + '" data-target="#deleteModal" data-toggle="modal">'+$msgDelete+'</button>'
						    					
						  			           ]);
				  		
				  	    	 }
			  	        		  	        
			  	     }
			  	  }); 
			  	   
			    }
			      
		      
		      
		      $("#addModal").on("show.bs.modal", function(event){
		    	  
		    	    clearModal();
		    	    var button = $(event.relatedTarget);
		    		var idUpdate = button.data("idupdate"); 
		    		if(idUpdate != null){
		    		
		    			doInitEditDataPost(idUpdate);
		    			
					}
		     		
		    		$(this).find("#saveBtn").off("click").on("click", function()
		    		{
		    			if(idUpdate != null){
		    				
		    				  $form.bootstrapValidator();
		    				  $form.data('bootstrapValidator').validate();
		    				  if($form.data('bootstrapValidator').isValid()){
		    				 	doEditDataPost(idUpdate);
		    				}
		  		  	        
		    			}
		    			else {	    				
		    				
		    				$form.bootstrapValidator();
		    				$form.data('bootstrapValidator').validate();
		    				if($form.data('bootstrapValidator').isValid()){
		    					addFamily();
		    				}						
		    			}
		    		});
		    	  
		      });
		      
		      
		      
		      $("#addModal").on("hide.bs.modal", function(event){
		    	  
		    	   $form.bootstrapValidator('resetForm', true);
		    	  
		      });
		      
		      
		      
		      
		      function addFamily(){
		    	  
	     				 doSaveDataAjax();   			 
	    
		      }
		    		
		      
		      
		      
		    		
		      function doSaveDataAjax() {  
			   	   
		    	    
		    	    var id = $("#empId").val();
			   	   		  		
			  		var firstName = $firstName.val();
			  		var lastName =  $lastName.val();
			  		var gender;
			  		
			  		
			  		if($('#genderMale:checked').val()!=null){
			  			
			  			gender = $('#genderMale:checked').val();
			  			
			  		}else if($('#genderFemale:checked').val()!=null){
			  			
			  			gender = $('#genderFemale:checked').val();
			  		}
			  	
			  		
			  		
			  		
			  		var age = $age.val();
			  		var mobile = $mobile.val();
			  		var address = $address.val();
			  		var occupation = $occupation.val();
			  		var position = $position.val();
			  		var relation = $masRelation.val();
			  		var relationName = $("#masRelation option:selected").text();
			  			  	    
			  	    var json = {"firstName":firstName,"lastName" : lastName,"gender":gender,"age":age,"mobile":mobile,"address":address,"occupation":occupation,"position":position,"masRelationTypeId":relation,"employeeId":id};
			  	   
			  	    
			  	    
			  	    $.ajax({  
			  	      type : "POST",   
			  	      url : $getContextPath+"/family/add",   
			  	      dataType : 'json', 
			  	      data : JSON.stringify(json),  
			  	      contentType :"application/json; charset=utf-8",
			  	     
			  	      success : function(data) {  
			  	    	 
			  	    	    $('#addModal').modal('hide');
			  	    	    doFindData();
			  	    	    
			  	    	  $(function(){ new PNotify({
								title: 'Success',
								type: 'success',
								animation: {
									effect_in: 'show',
									effect_out: 'slide'
								}
						});
			  	       });
			  	    	  
			  	     }
			  	    }); 
			  	    
			  	   
			     } 
		      
		      
		      
		   
		      
		      
		      
		      function doInitEditDataPost(idUpdate) {  

		    	  
			  	    var Id = idUpdate;	    
			  	    var json = {"id":idUpdate};
			  	   
			  	    
			  	     $.ajax({  
			  	      type : "POST",   
			  	      url : $getContextPath+"/family/initedit",   
			  	      dataType : 'json', 
			  	      data : JSON.stringify(json),  
			  	      contentType :"application/json; charset=utf-8",
			  	     
			  	      success : function(data) {  
			    		
			  	    	
			  	    	
			  	    	$firstName.val(data.firstName);
			  	    	$lastName.val(data.lastName);
			  	    	
			  	   
			  	    	
			  	    	if(data.gender=="Male"){
			  	    		
			  	    	   $("#genderMale").prop("checked", true);
			  	    	   
			  	    	}else if(data.gender=="Female"){
			  	    		
			  	    	   $("#genderFemale").prop("checked", true);
			  	    	   
			  	    	} 
			  	    	
			  	    	
			  	      
			  	    	$age.val(data.age);
			  	    	$mobile.val(data.mobile);
			  	    	$address.val(data.address);
			  	    	$occupation.val(data.occupation);
			  	    	$position.val(data.position);
			  	    	$masRelation.val(data.masRelationTypeId);

			  	    	 
			  	     }
			  	    }); 
	   	    	  }
		
			      
		      
		      
		      
		      function doEditDataPost(idUpdate) {  
		    	    var idEmp = $("#empId").val();
			    	var id = idUpdate;
			  		var firstName = $firstName.val();
			  		var lastName = $lastName.val();
			  		var gender;
			  		
			  		if($('#genderMale:checked').val()!=null){
			  			
			  			gender = $('#genderMale:checked').val();
			  			
			  		}else if($('#genderFemale:checked').val()!=null){
			  			
			  			gender = $('#genderFemale:checked').val();
			  		}
			  		
			  		
			  		var age = $age.val();
			  		var mobile = $mobile.val();
			  		var address = $address.val();
			  		var occupation = $occupation.val();
			  		var position = $position.val();
			  		var relation = $masRelation.val();
			  		

			  	    
			  	    var json = {"id":id,"firstName":firstName,"lastName":lastName,"gender":gender,"age":age,"mobile":mobile,"address":address,"occupation":occupation,"position":position,"masRelationTypeId":relation,"employeeId":idEmp};
			  	     
			  	    
			  	    $.ajax({  
			  	      type : "POST",   
			  	      url : $getContextPath+"/family/edit",   
			  	      dataType : 'json', 
			  	      data : JSON.stringify(json),  
			  	      contentType :"application/json; charset=utf-8",
			  	     
			  	      success : function(data) {  
			  	    	
			  	       		 $('#addModal').modal('hide');	  
			  	       	     doFindData();
			  	       	     
			  	       		 $(function(){ new PNotify({
							 title: 'Success',
							 type: 'success',
							 animation: {
								effect_in: 'show',
								effect_out: 'slide'
							}
						  });
		  	       		});
			  	        
			  	     }
			  	   }); 	  	    
			    }
		      
		      
		      
		      
		      $("#deleteModal").on("show.bs.modal", function(event){
		    	  
		    	    var button = $(event.relatedTarget);
		    		var idDelete = button.data("iddelete"); 
		    		
		     		
		    		$(this).find("#delete").off("click").on("click", function()
		    		{
		    			doDeleteDataPost(idDelete);
		    		});
		    	  
		      });
		      
		      
		      
		      
		      
		      function doDeleteDataPost(idDelete) {  
			   	   
			  	    var Id = idDelete;	    
			  	    var json = {"id":idDelete};
			  	    
			  	    
			  	    
			  	     $.ajax({  
			  	      type : "POST",   
			  	      url : $getContextPath+"/family/delete",   
			  	      dataType : 'json', 
			  	      data : JSON.stringify(json),  
			  	      contentType :"application/json; charset=utf-8",
			  	     
			  	      success : function(data) {  
			    		
			  	    	
			  	    	$('#deleteModal').modal('hide');
		  	       	    doFindData();
		  	       		$(function(){ new PNotify({
							title: 'Success',
							type: 'success',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							}
						});
			  	       });
					  	    	 
			  	     }
			  	    }); 
			  	   
			    }
			      
			      
		      
		   
  });


	    

	