package com.aug.hr.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javassist.tools.web.BadHttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.http.HttpException;
import org.apache.log4j.Logger;
import org.apache.sling.commons.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.aug.exception.CustomException;
import com.aug.hr.dto.services.FamilyDtoService;
import com.aug.hr.entity.Family;
import com.aug.hr.entity.MasRelationType;
import com.aug.hr.entity.dto.FamilyDto;
import com.aug.hr.entity.dto.Family2Dto;
import com.aug.hr.entity.editor.FamilyEditor;
//import com.aug.hr.entity.validator.FamilyValidator;
import com.aug.hr.services.FamilyService;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.MasRelationTypeService;




@Controller
public class FamilyController {
	
	private final static Logger logger = Logger
			.getLogger(Family.class);
	
	@Autowired
	private FamilyService familyService;
	@Autowired
	private FamilyEditor familyEditor;
	//@Autowired
	//private FamilyValidator familyValidator;
	@Autowired
	private FamilyDto familyDto;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private MasRelationTypeService masRelationService;
	@Autowired
	private FamilyDtoService familyDtoServiceTest;
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy",
				Locale.ENGLISH); // dd/MM/yyyy
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, editor);
		binder.registerCustomEditor(Family.class, familyEditor);		
	}
	
	
	
	@RequestMapping(value = "/family/{id}", method = RequestMethod.GET)
	public String initEmpFamily(Locale locale,
			@ModelAttribute(value = "family") Family family,
			ModelMap model, 
			@PathVariable("id") Integer id, 
			@ModelAttribute Family2Dto family2Dto)   throws SQLException,Exception,BadHttpRequest,ConstraintViolationException,HttpMediaTypeNotSupportedException,HttpException{
		
		//init page for display page 
		
		logger.info("Welcome to employee family(list) locale: " + locale);
		List<MasRelationType> masRelationTypeList = masRelationService.findAll();
		model.addAttribute("family", family);
		model.addAttribute("masRelationTypeList", masRelationTypeList);
		
		family2Dto.setEmployeeId(id);
		model.addAttribute("id", family2Dto.getEmployeeId());
		return "/family/familychange";

	}
	
	

	@RequestMapping(value = "/family/list/{id}", method = RequestMethod.POST,produces="application/json")
	public @ResponseBody List<Family2Dto> findEmpFamily(Locale locale,
		    //@ModelAttribute(value = "family") Family family,
			ModelMap model,
			@PathVariable("id") Integer id) throws SQLException,Exception,BadHttpRequest,IOException,ConstraintViolationException,HttpMediaTypeNotSupportedException,HttpException{
			
		List<Family2Dto> familyDtoTest = familyDtoServiceTest.listFamily(new Integer(id));
		return familyDtoTest;
		
		
	}
	
	
	

	@RequestMapping(value = "/family/add", method =  RequestMethod.POST)
	public @ResponseBody Family2Dto Add(Locale locale,
			    @RequestBody Family2Dto familyDto,
				ModelMap model,
				BindingResult result,
				HttpServletRequest request,
				HttpServletResponse response,
				Exception ex, 
				WebRequest webRequest) throws SQLException,Exception,BadHttpRequest,ConstraintViolationException,HttpMediaTypeNotSupportedException,HttpException,CustomException{
		
		      
		        //familyService.saveByNameQuery(familyDto);
		        
				int numberOfChar = 0;
		       
			        
	            if(familyDto.getFirstName().isEmpty()||familyDto.getLastName().isEmpty()||familyDto.getGender().isEmpty()||
	            		familyDto.getAge()==null||familyDto.getMobile().isEmpty()||familyDto.getAddress().isEmpty()||
	            		familyDto.getMasRelationTypeId()==null){
	            	
	            	throw new CustomException("Business Error", "It have some or Any field is required!");
	            	
	            }else{
	            	
	            
	            	if(familyDto.getMobile().length()!=12){
	    
	            			throw new CustomException("Business Error", "length of mobile is not equal 10!");
	            	
	            	
	            	}
	            	/*else if(familyDto.getMobile().length()==12){
	            		
	            		for (int i = 0; i < familyDto.getMobile().length(); i++) {
		            		   if (Character.isLetter(familyDto.getMobile().charAt(i))) {
		            			   System.out.println();
		            			   numberOfChar=numberOfChar+1;
		            		   }
		            		   
		            	   }
		            		

	            		if(numberOfChar!=2){
	            			
	            			throw new CustomException("Business Error", "mobile must be contain digit!");	            			
	            		}*/else{
	    	            	familyService.createFindMasRelationAndEmployee(familyDto);	
	            		}
	            	}
	            	
	           // }
	            
		        return familyDto;
		
		
	}
	
	
	
	@RequestMapping(value = "/family/initedit", method = RequestMethod.POST)
	public @ResponseBody Family2Dto initEdit(Locale locale,
							@RequestBody Family2Dto family,
							ModelMap modal) throws SQLException,Exception,BadHttpRequest,IOException,ConstraintViolationException,HttpMediaTypeNotSupportedException,HttpException{
		
	    logger.info("init edit");
		return familyService.findForInitEdit(family);
		
	}
	
	
	

	
	
	@RequestMapping(value = "/family/edit", method = RequestMethod.POST)
	public @ResponseBody Family2Dto Edit(Locale locale,
							@RequestBody Family2Dto familyDto,
							ModelMap modal) throws SQLException,Exception,BadHttpRequest,IOException,ConstraintViolationException,HttpMediaTypeNotSupportedException,HttpException,CustomException{
		
	    logger.info("edit");

	    
	    int numberOfChar = 0;
	       
        
        if(familyDto.getFirstName().isEmpty()||familyDto.getLastName().isEmpty()||familyDto.getGender().isEmpty()||
        		familyDto.getAge()==null||familyDto.getMobile().isEmpty()||familyDto.getAddress().isEmpty()||
        		familyDto.getMasRelationTypeId()==null){
        	
        	throw new CustomException("Business Error", "It have some or Any field is required!");
        	
        }else{
        	
        
        	if(familyDto.getMobile().length()!=10){

        			throw new CustomException("Business Error", "length of mobile is not equal 10!");

        	}else if(familyDto.getMobile().length()==10){
        		
        		for (int i = 0; i < familyDto.getMobile().length(); i++) {
            		   if (Character.isLetter(familyDto.getMobile().charAt(i))) {
            			   System.out.println();
            			   numberOfChar=numberOfChar+1;
            		   }
            		   
            	   }
            		

        		if(numberOfChar!=0){
        			
        			throw new CustomException("Business Error", "mobile must be contain digit");	            			
        		}else{
        			
        		    familyService.updateFindMasRelationAndEmployee(familyDto);
	
        		}
        	}
        	
        }

        return familyDto;
	}
	
	
	
	
	
	@RequestMapping(value = "/family/delete", method = RequestMethod.POST)
	public @ResponseBody Family2Dto Delete(Locale locale,
							@RequestBody Family2Dto familyDtoTest,
							ModelMap modal) throws SQLException,Exception,BadHttpRequest,IOException,ConstraintViolationException,HttpMediaTypeNotSupportedException,HttpException{
		
	    logger.info("delete");	 
	    familyService.deleteByNameQuery(familyDtoTest);
		return familyDtoTest;		
	}
	
	
	

	
	
	/*@RequestMapping(value = "/family/transection", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String ManageData(Locale locale,
							@RequestBody String info,
							ModelMap modal) throws JSONException{
		
		logger.info("manage data");

		JSONArray jsonArr = new JSONArray(info);
		List<String> jsonInfoList = new ArrayList<String>();
		List<Family> familyList = new ArrayList<Family>();
		int id;
		int age;
		Employee employee = new Employee();
		employee = employeeService.findById(1);
		
		logger.info("info: "+jsonArr);
		
		if(jsonArr!=null){
			
			 for(int i=0;i<jsonArr.length();i++){
				 
				 Family family = new Family();
				 
				 jsonInfoList.add(jsonArr.get(i).toString());
				 logger.info("jsonArr.get(i): "+jsonInfoList);
				 JSONObject jsonObj = jsonArr.getJSONObject(i);
				 logger.info("json object: "+jsonObj);
				 
				 if(jsonObj.getString("id")=="null"){
										 
					 family.setId(null);
					 
				 }else{
					 
					 id = Integer.parseInt(jsonObj.getString("id"));
					 family.setId(new Integer(id));
				 }
				
				 
				 
				 
				 family.setFirstName(jsonObj.getString("firstName"));
				 family.setLastName(jsonObj.getString("lastName"));
				 family.setName(jsonObj.getString("firstName")+" "+jsonObj.getString("lastName"));
				 
				 if(jsonObj.getString("id")=="age"){
					 
					 family.setAge(null);
					 
				 }else{
					 
					 age = Integer.parseInt(jsonObj.getString("age"));
					 family.setAge(new Integer(age));
				 }
				 
				 family.setGender(jsonObj.getString("gender"));
				 family.setAddress(jsonObj.getString("address"));
				 
				 
				 if(jsonObj.getString("occupation")=="null"){
					 family.setOccupation(null);
				 }else{
					 family.setOccupation(jsonObj.getString("occupation"));
				 }
				 
				 
				 if(jsonObj.getString("position")=="null"){
					 family.setOccupation(null);
				 }else{
					 family.setOccupation(jsonObj.getString("position"));
				 }
				 
				 
				 family.setMobile(jsonObj.getString("mobile"));
				 family.setRelationName(jsonObj.getString("relation"));
				 family.setStatus(jsonObj.getString("status"));
				 

				 familyList.add(family);
				 
				 logger.info("family dto list: "+family);
			
			 }
			 
			 
			 for(Family familyObj:familyList){
				 
				 if(familyObj.getStatus().equals("add")){
					 Family family = new Family();
					 family.setFirstName(familyObj.getFirstName());
					 family.setLastName(familyObj.getLastName());
					 family.setAge(familyObj.getAge());
					 family.setGender(familyObj.getGender());
					 family.setMobile(familyObj.getMobile());
					 family.setAddress(familyObj.getAddress());
					 family.setOccupation(familyObj.getOccupation());
					 family.setPosition(familyObj.getPosition());
					 family.setEmployee(employee);
					 
					 MasRelationType masRelationType = new MasRelationType();
					 masRelationType = masRelationService.findByName(familyObj.getRelationName());
					 
					 family.setMasRelation(masRelationType);					 
					 family.setCreatedBy(0);
					 Calendar cal = Calendar.getInstance();
					 family.setCreatedTimeStamp(cal.getTime());
					 family.setAuditFlag("C");
					 
					 familyService.create(family);
					 
					 
					 
				 }else if(familyObj.getStatus().equals("edit")){
					 
					 Family family= new Family();
					 family = familyService.find(new Integer(familyObj.getId()));
					 family.setFirstName(familyObj.getFirstName());
					 family.setLastName(familyObj.getLastName());
					 family.setAge(familyObj.getAge());
					 family.setGender(familyObj.getGender());
					 family.setAddress(familyObj.getAddress());
					 family.setMobile(familyObj.getMobile());
					 family.setOccupation(familyObj.getOccupation());
					 family.setPosition(familyObj.getPosition());
					 
					 MasRelationType masRelationType = new MasRelationType();
					 masRelationType = masRelationService.findByName(familyObj.getRelationName());
					 
					 family.setMasRelation(masRelationType);
					 family.setUpdatedBy(0);
					 Calendar cal = Calendar.getInstance();
					 family.setUpdatedTimeStamp(cal.getTime());
					 
					 familyService.update(family);
					 
				 }else if(familyObj.getStatus().equals("delete")){
					 
					 Family family= new Family();
					 family = familyService.find(new Integer(familyObj.getId()));
					 familyService.delete(family);
					 
				 }
				 
			 }
			
			 
		}
		
		return info;
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/family/managedata", method = {RequestMethod.POST})
	public String manageData(Locale locale,
							@ModelAttribute FamilyForm familyList,
							ModelMap modal,
							@ModelAttribute(value="family") Family familyModal) {
		
		
		logger.info("infooooo: "+familyList.getFamily());
		
		Employee employee = new Employee();
		employee = employeeService.findById(1);
		
		
		for(Family familyObj : familyList.getFamily()){
		    
			  if(familyObj.getId()==null){
				  
				  logger.info("is null");
				  
			  }else if(familyObj.getId()!=null){
				  logger.info("data info: "+familyObj);
				  
				  if(familyObj.getStatus().equals("add")){
					  logger.info("");
					  Family family = new Family();
					  family.setFirstName(familyObj.getFirstName());
					  family.setLastName(familyObj.getLastName());
					  family.setAge(familyObj.getAge());
					  family.setMobile(familyObj.getMobile());
					  family.setGender(familyObj.getGender());
					  
					  if(familyObj.getOccupation().equals("null")==false){
						  family.setOccupation(familyObj.getOccupation());
					  }else if(familyObj.getOccupation().equals("null")==true){
						  family.setOccupation(null);
						  logger.info("occupation null");
					  }
					  
					  
					  if(familyObj.getPosition().equals("null")==false){
						  family.setPosition(familyObj.getPosition());
					  }else if(familyObj.getPosition().equals("null")==true){
						  family.setPosition(null);
					  }
					  
					  
					  family.setAddress(familyObj.getAddress());
					  
					  MasRelationType masRelationType = new MasRelationType();
					  masRelationType = masRelationService.findByName(familyObj.getRelationName());
					  
					  family.setMasRelation(masRelationType);
					  family.setEmployee(employee);
					  Calendar cal = Calendar.getInstance();
					  family.setCreatedTimeStamp(cal.getTime());
					  family.setCreatedBy(employee.getId());
					  family.setAuditFlag("C");
					  familyService.create(family);
					  
				  }else if(familyObj.getStatus().equals("edit")){
					  
					  Family family= new Family();
					  family = familyService.find(new Integer(familyObj.getId()));
					  family.setFirstName(familyObj.getFirstName());
					  family.setLastName(familyObj.getLastName());
					  family.setAge(familyObj.getAge());
					  family.setMobile(familyObj.getMobile());
					  family.setGender(familyObj.getGender());						
				      family.setOccupation(familyObj.getOccupation());
					  family.setPosition(familyObj.getPosition());
					  family.setAddress(familyObj.getAddress());
						  
					  MasRelationType masRelationType = new MasRelationType();
					  masRelationType = masRelationService.findByName(familyObj.getRelationName());
					  
					  family.setAuditFlag("U");
					  family.setUpdatedBy(employee.getId());
					  family.setMasRelation(masRelationType);
					  Calendar cal = Calendar.getInstance();
				      family.setUpdatedTimeStamp(cal.getTime());
						 
					  familyService.update(family);
						 
		
					  
				  }else if(familyObj.getStatus().equals("delete")){
					  
					  Family family= new Family();
					  family = familyService.find(new Integer(familyObj.getId()));
					  familyService.delete(family);
						 
					  
				  }
				  
			  }
		
		}
		
		
		List<Family> familyListforShow = familyService.findFamilyByEmployeeId(1);
		List<MasRelationType> masRelationTypeList = masRelationService.findAll();
		modal.addAttribute("familyList", familyListforShow);
		modal.addAttribute("masRelationTypeList", masRelationTypeList);
		modal.addAttribute("family", familyModal);
		
		return "redirect:/family/";
		//return "/family/familytest";
		
		}
*/
	
	
}
