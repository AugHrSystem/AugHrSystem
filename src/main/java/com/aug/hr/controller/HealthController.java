package com.aug.hr.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

import javax.validation.ConstraintViolationException;

import javassist.tools.web.BadHttpRequest;

import org.apache.http.HttpException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.exception.CustomException;
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
			@PathVariable("id") Integer id, 
			@ModelAttribute HealthDto healthDto) throws SQLException,Exception,BadHttpRequest,IOException,HttpMediaTypeNotSupportedException,HttpException{
		
		
		logger.info("Welcome to health locale: " + locale);
		model.addAttribute("health", health);

		healthDto.setEmployeeId(id);
		model.addAttribute("id", healthDto.getEmployeeId());
		
		return "/health/health";
	}
	
	
	@RequestMapping(value = "/health/list/{id}", method = RequestMethod.POST)
	public @ResponseBody List<HealthDto> findData(Locale locale,
			@PathVariable("id") Integer id,
			ModelMap model) throws SQLException,Exception,BadHttpRequest,IOException,ConstraintViolationException,HttpMediaTypeNotSupportedException,HttpException{
		
		    List<HealthDto> healthDto =  healthDtoService.listHealth(new Integer(id));		    
		    return healthDto;
		   
	}
	
	
	@RequestMapping(value = "/health/add", method = RequestMethod.POST)
	public @ResponseBody HealthDto add(Locale locale,
				@RequestBody HealthDto healthDto,
				ModelMap model) throws SQLException,Exception,BadHttpRequest,IOException,ConstraintViolationException,HttpMediaTypeNotSupportedException,HttpException,CustomException{
		
		String statusCongenitalDisease = null;
		String statusGeneticDisease = null;
		String statusTakeMedicine = null;
		String statusIntolerance = null;

		
			if(healthDto.getCongenitalDisease().isEmpty()||healthDto.getGeneticDisease().isEmpty()
					||healthDto.getTakeMedicine().isEmpty()||healthDto.getTakeMedicine().isEmpty()){
				
				throw new CustomException("Business Error", "It have some or Any field is required!");
				
			}else{
				
			
		
			if(healthDto.getCongenitalDisease().equals("No")){
				
				if(healthDto.getCongenitalDiseaseExplain().isEmpty() ==false ||
				   healthDto.getCongenitalDiseaseExplain2().isEmpty()==false ||
				   healthDto.getCongenitalDiseaseExplain3().isEmpty()==false){
					
					    statusCongenitalDisease = "not empty";
						//throw new CustomException("Business Error", "CongenitalDisease Specified must be empty!");
				}else{
					
						statusCongenitalDisease = "success";
				}
				
				
			}else if(healthDto.getCongenitalDisease().equals("Yes")){
				
				if(healthDto.getCongenitalDiseaseExplain().isEmpty()){
				    
					statusCongenitalDisease = "empty";
					//throw new CustomException("Business Error", "CongenitalDisease Specified is required!");

				}else{
					statusCongenitalDisease = "success";
				}
			}
			
			
			if(healthDto.getGeneticDisease().equals("No")){
				
				if(healthDto.getGeneticDiseaseExplain().isEmpty() ==false ||
						   healthDto.getGeneticDiseaseExplain2().isEmpty()==false ||
						   healthDto.getGeneticDiseaseExplain3().isEmpty()==false){
					
					statusGeneticDisease = "not empty";
					//throw new CustomException("Business Error", "GeneticDisease Specified must be empty!");

				}else{
					statusGeneticDisease = "success";
				}
				
			}else if(healthDto.getGeneticDisease().equals("Yes")){
				
				if(healthDto.getGeneticDiseaseExplain().isEmpty()){
					
					statusGeneticDisease = "not empty";
					//throw new CustomException("Business Error", "GeneticDisease Specified is required!");

				}else{
					statusGeneticDisease = "success";
				}
				
			}
			
			
			if(healthDto.getTakeMedicine().equals("No")){
				
				if(healthDto.getTakeMedicineExplain().isEmpty()==false){
					
					//throw new CustomException("Business Error", "TakeMedicine Specified must be empty!");
					statusTakeMedicine="not empty";
					
				}else{
					statusTakeMedicine="success";
				}
				
			}else if(healthDto.getTakeMedicine().equals("Yes")){
				
				if(healthDto.getTakeMedicineExplain().isEmpty()){
					
					//throw new CustomException("Business Error", "TakeMedicine Specified is required!");
					statusTakeMedicine="empty";
					
				}else{
					statusTakeMedicine="success";
				}
				
			}
			
			
			
			if(healthDto.getIntolerance().equals("No")){
				
				if(healthDto.getIntoleranceExplain().isEmpty()==false){
					
					//throw new CustomException("Business Error", "Intolerance Specified must be empty!");
					statusIntolerance="not empty";
					
				}else{
					statusIntolerance="success";
				}
				
			}else if(healthDto.getIntolerance().equals("Yes")){
				
				if(healthDto.getIntoleranceExplain().isEmpty()){
					
					//throw new CustomException("Business Error", "Intolerance Specified is required!");
					statusIntolerance="empty";
				}else{
					statusIntolerance="success";
				}
				
			}
			
			
			
		    if(statusCongenitalDisease.equals("success")&& statusGeneticDisease.equals("success")&&
					 statusTakeMedicine.equals("success")&&statusIntolerance.equals("success")){
				
				healthService.createSetDtoToEnity(healthDto);
				
				
			}else if(statusCongenitalDisease.equals("not empty")&& statusGeneticDisease.equals("not empty")||
			   statusTakeMedicine.equals("not empty")&&statusIntolerance.equals("not empty")){
				
				throw new CustomException("Business Error", "CongenitalDisease  Specified, GeneticDisease Specified, TakeMedicine Specified and "
						+ "Intolerance Specified must be empty!, if you select it 'No' value ");
				
			}else if(statusCongenitalDisease.equals("empty")&& statusGeneticDisease.equals("empty")||
					 statusTakeMedicine.equals("empty")&& statusIntolerance.equals("empty")){
				
				throw new CustomException("Business Error", "CongenitalDisease  Specified, GeneticDisease Specified, TakeMedicine Specified and "
						+ "Intolerance Specified is required!, if you select it 'Yes' value ");
				
			}else if(statusCongenitalDisease.equals("not empty")|| statusGeneticDisease.equals("empty")||
					 statusTakeMedicine.equals("empty")||statusIntolerance.equals("empty")){
				
				throw new CustomException("Business Error", "CongenitalDisease  Specified, GeneticDisease Specified, TakeMedicine Specified and "
						+ "Intolerance Specified [must be empty,is required]! , if you select it 'Yes' value must be required, you select 'No' value must be empty");
				
				
			}else if(statusCongenitalDisease.equals("empty")|| statusGeneticDisease.equals("not empty")||
					 statusTakeMedicine.equals("not empty")||statusIntolerance.equals("not empty")){
				
				throw new CustomException("Business Error", "CongenitalDisease  Specified, GeneticDisease Specified, TakeMedicine Specified and "
						+ "Intolerance Specified [must be empty,is required]! , if you select it 'Yes' value must be required, you select 'No' value must be empty");
				
				
			}
		}
					    
			return healthDto;
		   
	}
	
	

	@RequestMapping(value = "/health/initedit", method = RequestMethod.POST)
	public @ResponseBody HealthDto initEdit(Locale locale,
				@RequestBody HealthDto healthDto,
				ModelMap model) throws SQLException,Exception,BadHttpRequest,IOException,ConstraintViolationException,HttpMediaTypeNotSupportedException,HttpException{
		
		HealthDto  healthDtoToPage =  healthService.findByIdReturnToDto(healthDto.getId());
		return healthDtoToPage;
		   
	}
	
	
	@RequestMapping(value = "/health/edit", method = RequestMethod.POST)
	public @ResponseBody HealthDto edit(Locale locale,
				@RequestBody HealthDto healthDto,
				ModelMap model)  throws SQLException,Exception,BadHttpRequest,IOException,ConstraintViolationException,HttpMediaTypeNotSupportedException,HttpException,CustomException{
		
		
		String statusCongenitalDisease = null;
		String statusGeneticDisease = null;
		String statusTakeMedicine = null;
		String statusIntolerance = null;

		
			if(healthDto.getCongenitalDisease().isEmpty()||healthDto.getGeneticDisease().isEmpty()
					||healthDto.getTakeMedicine().isEmpty()||healthDto.getTakeMedicine().isEmpty()){
				
				throw new CustomException("Business Error", "It have some or Any field is required!");
				
			}else{
				
			
		
			if(healthDto.getCongenitalDisease().equals("No")){
				
				if(healthDto.getCongenitalDiseaseExplain().isEmpty() ==false ||
				   healthDto.getCongenitalDiseaseExplain2().isEmpty()==false ||
				   healthDto.getCongenitalDiseaseExplain3().isEmpty()==false){
					
					    statusCongenitalDisease = "not empty";
						//throw new CustomException("Business Error", "CongenitalDisease Specified must be empty!");
				}else{
					
						statusCongenitalDisease = "success";
				}
				
				
			}else if(healthDto.getCongenitalDisease().equals("Yes")){
				
				if(healthDto.getCongenitalDiseaseExplain().isEmpty()){
				    
					statusCongenitalDisease = "empty";
					//throw new CustomException("Business Error", "CongenitalDisease Specified is required!");

				}else{
					statusCongenitalDisease = "success";
				}
			}
			
			
			if(healthDto.getGeneticDisease().equals("No")){
				
				if(healthDto.getGeneticDiseaseExplain().isEmpty() ==false ||
						   healthDto.getGeneticDiseaseExplain2().isEmpty()==false ||
						   healthDto.getGeneticDiseaseExplain3().isEmpty()==false){
					
					statusGeneticDisease = "not empty";
					//throw new CustomException("Business Error", "GeneticDisease Specified must be empty!");

				}else{
					statusGeneticDisease = "success";
				}
				
			}else if(healthDto.getGeneticDisease().equals("Yes")){
				
				if(healthDto.getGeneticDiseaseExplain().isEmpty()){
					
					statusGeneticDisease = "not empty";
					//throw new CustomException("Business Error", "GeneticDisease Specified is required!");

				}else{
					statusGeneticDisease = "success";
				}
				
			}
			
			
			if(healthDto.getTakeMedicine().equals("No")){
				
				if(healthDto.getTakeMedicineExplain().isEmpty()==false){
					
					//throw new CustomException("Business Error", "TakeMedicine Specified must be empty!");
					statusTakeMedicine="not empty";
					
				}else{
					statusTakeMedicine="success";
				}
				
			}else if(healthDto.getTakeMedicine().equals("Yes")){
				
				if(healthDto.getTakeMedicineExplain().isEmpty()){
					
					//throw new CustomException("Business Error", "TakeMedicine Specified is required!");
					statusTakeMedicine="empty";
					
				}else{
					statusTakeMedicine="success";
				}
				
			}
			
			
			
			if(healthDto.getIntolerance().equals("No")){
				
				if(healthDto.getIntoleranceExplain().isEmpty()==false){
					
					//throw new CustomException("Business Error", "Intolerance Specified must be empty!");
					statusIntolerance="not empty";
					
				}else{
					statusIntolerance="success";
				}
				
			}else if(healthDto.getIntolerance().equals("Yes")){
				
				if(healthDto.getIntoleranceExplain().isEmpty()){
					
					//throw new CustomException("Business Error", "Intolerance Specified is required!");
					statusIntolerance="empty";
				}else{
					statusIntolerance="success";
				}
				
			}
			
			
			 if(statusCongenitalDisease.equals("success")&& statusGeneticDisease.equals("success")&&
					 statusTakeMedicine.equals("success")&&statusIntolerance.equals("success")){
				
				healthService.updateSetDtoToEntity(healthDto);

			}else if(statusCongenitalDisease.equals("not empty")&& statusGeneticDisease.equals("not empty")||
			   statusTakeMedicine.equals("not empty")&&statusIntolerance.equals("not empty")){
				
				throw new CustomException("Business Error", "CongenitalDisease  Specified, GeneticDisease Specified, TakeMedicine Specified and "
						+ "Intolerance Specified must be empty!, if you select it 'No' value ");
				
			}else if(statusCongenitalDisease.equals("empty")&& statusGeneticDisease.equals("empty")||
					 statusTakeMedicine.equals("empty")&& statusIntolerance.equals("empty")){
				
				throw new CustomException("Business Error", "CongenitalDisease  Specified, GeneticDisease Specified, TakeMedicine Specified and "
						+ "Intolerance Specified is required!, if you select it 'Yes' value ");
				
			}else if(statusCongenitalDisease.equals("not empty")|| statusGeneticDisease.equals("empty")||
					 statusTakeMedicine.equals("empty")||statusIntolerance.equals("empty")){
				
				throw new CustomException("Business Error", "CongenitalDisease  Specified, GeneticDisease Specified, TakeMedicine Specified and "
						+ "Intolerance Specified [must be empty,is required]! , if you select it 'Yes' value must be required, you select 'No' value must be empty");
				
				
			}else if(statusCongenitalDisease.equals("empty")|| statusGeneticDisease.equals("not empty")||
					 statusTakeMedicine.equals("not empty")||statusIntolerance.equals("not empty")){
				
				throw new CustomException("Business Error", "CongenitalDisease  Specified, GeneticDisease Specified, TakeMedicine Specified and "
						+ "Intolerance Specified [must be empty,is required]! , if you select it 'Yes' value must be required, you select 'No' value must be empty");
				
				
			}
		}

			return healthDto;
		   
	}
	
	
	
	@RequestMapping(value = "/health/delete", method = RequestMethod.POST)
	public @ResponseBody HealthDto delete(Locale locale,
				@RequestBody HealthDto healthDto,
				ModelMap model) throws SQLException,Exception,BadHttpRequest,IOException,ConstraintViolationException,HttpMediaTypeNotSupportedException,HttpException{
		
		Health health = healthService.find(healthDto.getId());
		healthService.delete(health);
		return healthDto;
		   
	}

}
