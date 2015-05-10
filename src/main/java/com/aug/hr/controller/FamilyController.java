package com.aug.hr.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.sling.commons.json.JSONException;
import org.apache.sling.commons.json.JSONObject;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.dto.FamilyDto;
import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasRelationType;
import com.aug.hr.entity.editor.FamilyEditor;
import com.aug.hr.entity.validator.FamilyValidator;
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
	@Autowired
	private FamilyValidator familyValidator;
	@Autowired
	private FamilyDto familyDto;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private MasRelationTypeService masRelationService;


	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy",
				Locale.ENGLISH); // dd/MM/yyyy
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, editor);
		binder.registerCustomEditor(Family.class, familyEditor);		
	}
	
	
	
	@RequestMapping(value = "/family/", method = RequestMethod.GET)
	public String initEmpFamily(Locale locale,
			@ModelAttribute(value = "empFamily") Family family,
			ModelMap model){
		
		//init page for display page 
		
		logger.info("Welcome to employee family(list) locale: " + locale);
		List<Family> familyList = familyService.findFamilyByEmployeeId(1);
		List<MasRelationType> masRelationTypeList = masRelationService.findAll();
		Hibernate.initialize(familyList);
		System.out.println(familyList);
		model.addAttribute("familyList", familyList);
		model.addAttribute("family", family);
		model.addAttribute("masRelationTypeList", masRelationTypeList);
		
		return "/family/family";
	}
	
	

	@RequestMapping(value = "/family/list", method = RequestMethod.GET,produces="application/json")
	public @ResponseBody Map<String,List< FamilyDto>> findEmpFamily(Locale locale,
			@ModelAttribute(value = "empFamily") Family family,
			ModelMap model){// throws JSONException{
		
		
		//find data on database and set it to list
		List<Family> familyList = familyService.findFamilyByEmployeeId(1);
		Hibernate.initialize(familyList);
	    
		List<FamilyDto> familyDtoList = new ArrayList<FamilyDto>();
	
		
		//set data after get it from database and set it to dto 
		
		 for(int i=0;i<familyList.size();i++){
			
			 Family familyObj = new Family();
			 familyObj = familyList.get(i);			
			 FamilyDto familyDto = new FamilyDto();
		     familyDto.setId(familyObj.getId());
		     familyDto.setOccupation(familyObj.getOccupation());
		     familyDto.setFirstName(familyObj.getFirstName());
		     familyDto.setLastName(familyObj.getLastName());
		     familyDto.setName(familyObj.getFirstName()+" "+familyObj.getLastName());
		     familyDto.setRelationId(new Integer(familyObj.getMasRelation().getId()));
		     familyDto.setRelation(familyObj.getMasRelation().getRelationType());
			 familyDto.setAge(familyObj.getAge());
			 familyDto.setGender(familyObj.getGender());
			 familyDto.setMobile(familyObj.getMobile());		 
			 familyDto.setAddress(familyObj.getAddress());
			 familyDto.setPosition(familyObj.getPosition());			 
			 familyDtoList.add(i,familyDto);
			 
		 }
		 
		//set map for return data type is json
		Map<String,List<FamilyDto>>data = new HashMap<String,List<FamilyDto>>();
		data.put("data", familyDtoList);
	
		return data;
		
		
		
	}
	
	
	

	@RequestMapping(value = "/family/add", method =  {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody FamilyDto Add(Locale locale,
				@RequestBody Family family,
				ModelMap model,
				BindingResult result){
		
		logger.info("Info : " + family);
		
		MasRelationType masRelationType = new MasRelationType();
		masRelationType = masRelationService.find(family.getMasRelation().getId());
		family.setMasRelation(masRelationType);		
		
		family.setAuditFlag("C");
		family.setCreatedBy(0);
		Calendar cal = Calendar.getInstance();
		family.setCreatedTimeStamp(cal.getTime());
		
		
		Employee employee = new Employee();
		employee = familyService.findEmployeeById(new Integer(1));		
		family.setEmployee(employee);
		
		
		
		familyService.create(family);
		
		
		
		logger.info("Employee info : " +employee);
		
		
		List<Family> familyList = new ArrayList<Family>();
		familyList = familyService.findAll();
		Family familyforId = new Family();
		
		
		familyforId = familyList.get(familyList.size()-1);
		
		
		Family familyObj = new Family();
		familyObj = familyService.findLastFamily(familyforId.getId());
		FamilyDto familyDto = new FamilyDto();
		familyDto.setId(familyObj.getId());
		familyDto.setFirstName(familyObj.getFirstName());
		familyDto.setLastName(familyObj.getLastName());
		familyDto.setName(familyObj.getFirstName()+" "+familyObj.getLastName());
		familyDto.setAge(familyObj.getAge());
		familyDto.setGender(familyObj.getGender());
		familyDto.setMobile(familyObj.getMobile());
		familyDto.setOccupation(familyObj.getOccupation());	
		familyDto.setRelationId(familyObj.getMasRelation().getId());
    	familyDto.setRelation(familyObj.getMasRelation().getRelationType());
		familyDto.setAddress(familyObj.getAddress());
		familyDto.setPosition(familyObj.getPosition());
		
		return familyDto;
		
	}
	
	
	
	@RequestMapping(value = "/family/initedit", method = {RequestMethod.POST})
	public @ResponseBody FamilyDto initEdit(Locale locale,
							@RequestBody String familyId,
							@ModelAttribute Family family,
							ModelMap modal) throws JSONException{
		
	    logger.info("edit");
		logger.info("id json: "+familyId);
		
		
        JSONObject obj = new JSONObject(familyId);
        String idStr = obj.get("Id").toString();
        int id = Integer.parseInt(idStr);
        Family familyEdit = familyService.findLastFamily(new Integer(id));
        Hibernate.initialize(familyEdit);
        logger.info("emp edit: "+familyEdit);	
        FamilyDto familyDto = new FamilyDto();
        familyDto.setId(familyEdit.getId());
        familyDto.setFirstName(familyEdit.getFirstName());
        familyDto.setLastName(familyEdit.getLastName());
        familyDto.setName(familyEdit.getFirstName()+" "+familyEdit.getLastName());
        familyDto.setAge(familyEdit.getAge());
        familyDto.setAddress(familyEdit.getAddress());
        familyDto.setGender(familyEdit.getGender());
        familyDto.setMobile(familyEdit.getMobile());
        familyDto.setOccupation(familyEdit.getOccupation());
        familyDto.setPosition(familyEdit.getPosition());
        familyDto.setRelationId(familyEdit.getMasRelation().getId());
        familyDto.setRelation(familyEdit.getMasRelation().getRelationType());
        family = familyEdit;
        family.setCmd("update");
        modal.addAttribute("family", family);
        
		return familyDto;
		
	}
	
	
	

	
	
	@RequestMapping(value = "/family/edit", method = {RequestMethod.POST})
	public @ResponseBody FamilyDto Edit(Locale locale,
							@RequestBody Family family,
							ModelMap modal) throws JSONException{
		
	    logger.info("edit");
		logger.info("info edit json: "+family);
       
		MasRelationType masRelationType = new MasRelationType();
		masRelationType = masRelationService.find(family.getMasRelation().getId());
		
		Family familyObj = new Family();
		familyObj = familyService.findLastFamily(family.getId());	
		familyObj.setFirstName(family.getFirstName());
		familyObj.setLastName(family.getLastName());
		familyObj.setGender(family.getGender());
		familyObj.setAge(family.getAge());
		familyObj.setAddress(family.getAddress());
		familyObj.setMobile(family.getMobile());
		familyObj.setOccupation(family.getOccupation());
		familyObj.setPosition(family.getPosition());
		familyObj.setMasRelation(masRelationType);
		Calendar cal = Calendar.getInstance();
		familyObj.setUpdatedTimeStamp(cal.getTime());
		familyObj.setAuditFlag("U");
		
		familyService.update(familyObj);
		
		
		Family familySetDto = familyService.findLastFamily(family.getId());
		FamilyDto familyDto = new FamilyDto();
		familyDto.setId(familySetDto.getId());
		familyDto.setFirstName(familySetDto.getFirstName());
		familyDto.setLastName(familySetDto.getLastName());
		familyDto.setName(familySetDto.getFirstName()+" "+familySetDto.getLastName());
		familyDto.setGender(familySetDto.getGender());
		familyDto.setAge(familySetDto.getAge());
		familyDto.setAddress(familySetDto.getAddress());
		familyDto.setMobile(familySetDto.getMobile());
		familyDto.setOccupation(familySetDto.getOccupation());
		familyDto.setPosition(familySetDto.getPosition());
		familyDto.setRelationId(familySetDto.getMasRelation().getId());
		familyDto.setRelation(familySetDto.getMasRelation().getRelationType());
		
        
		return familyDto;
		
	}
	
	
	
	
	
	@RequestMapping(value = "/family/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String Delete(Locale locale,
							@RequestBody String familyId,
							ModelMap modal) throws JSONException{
		
	    logger.info("delete");
		logger.info("id json delete: "+familyId);
		
		JSONObject obj = new JSONObject(familyId);
	    String idStr = obj.get("Id").toString();
	    int id = Integer.parseInt(idStr);
	    
        Family familyDelete = familyService.findLastFamily(new Integer(id));
        familyService.delete(familyDelete);
	    
        Family family = new Family();
	    family = familyService.find(new Integer(id));
	 
		
		return familyId;		
	}
	
	
	

}
