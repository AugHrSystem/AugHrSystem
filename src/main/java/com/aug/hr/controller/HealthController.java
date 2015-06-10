package com.aug.hr.controller;


import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.dto.services.HealthDtoService;
import com.aug.hr.entity.Health;
import com.aug.hr.entity.SkillLanguage;
import com.aug.hr.entity.dto.HealthDto;
import com.aug.hr.services.HealthService;

@Controller
public class HealthController {
	
	
	private final static Logger logger = Logger
			.getLogger(SkillLanguage.class);
	
	@Autowired 
	private HealthService healthService;
	@Autowired
	private HealthDtoService healthDtoService;
	
	
	@RequestMapping(value = "/health/{id}", method = RequestMethod.GET)
	public String initSkillLanguage(Locale locale,
			@ModelAttribute(value = "health") Health health,
			ModelMap model, 
			@PathVariable Integer id, 
			@ModelAttribute HealthDto healthDto){
		
		
		logger.info("Welcome to health locale: " + locale);
		model.addAttribute("health", health);

		healthDto.setEmployeeId(id);
		model.addAttribute("id", healthDto.getEmployeeId());
		
		return "/health/health";
	}
	
	
	@RequestMapping(value = "/health/list/{id}", method = RequestMethod.POST)
	public @ResponseBody List<HealthDto> findData(Locale locale,
			@PathVariable("id") Integer id,
			ModelMap model){
		
		    List<HealthDto> healthDto =  healthDtoService.listHealth(new Integer(id));		    
		    return healthDto;
		   
	}
	
	
	@RequestMapping(value = "/health/add", method = RequestMethod.POST)
	public @ResponseBody HealthDto add(Locale locale,
				@RequestBody HealthDto healthDto,
				ModelMap model){
		
		    healthService.createSetDtoToEnity(healthDto);
			return healthDto;
		   
	}
	
	

	@RequestMapping(value = "/health/initedit", method = RequestMethod.POST)
	public @ResponseBody HealthDto initEdit(Locale locale,
				@RequestBody HealthDto healthDto,
				ModelMap model){
		
		HealthDto  healthDtoToPage =  healthService.findByIdReturnToDto(healthDto.getId());
		return healthDtoToPage;
		   
	}
	
	
	@RequestMapping(value = "/health/edit", method = RequestMethod.POST)
	public @ResponseBody HealthDto edit(Locale locale,
				@RequestBody HealthDto healthDto,
				ModelMap model){
		
		healthService.updateSetDtoToEntity(healthDto);
		return healthDto;
		   
	}
	
	
	
	@RequestMapping(value = "/health/delete", method = RequestMethod.POST)
	public @ResponseBody HealthDto delete(Locale locale,
				@RequestBody HealthDto healthDto,
				ModelMap model){
		
		Health health = healthService.find(healthDto.getId());
		healthService.delete(health);
		return healthDto;
		   
	}

}
