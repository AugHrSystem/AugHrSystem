package com.aug.hr.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

import javassist.tools.web.BadHttpRequest;

import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import javax.validation.Valid;

import org.apache.http.HttpException;
import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hrdb.services.LanguageDtoService;
import com.aug.hrdb.entities.Family;
import com.aug.hrdb.entities.Language;
import com.aug.hrdb.dto.LanguageDto;
import com.aug.hr.entity.editor.SkillLanguageEditor;
import com.aug.hrdb.services.EmployeeService;
import com.aug.hrdb.services.LanguageService;


@Controller
public class SkillLanguageController {
	
	@Autowired
	private LanguageService languageService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private LanguageDtoService languageDtoService;
	@Autowired
	private SkillLanguageEditor skillLanguageEditor;
	

	private final static Logger logger = Logger
			.getLogger(Language.class);
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		
		binder.registerCustomEditor(Language.class, skillLanguageEditor);
	
	}
	
	
	@RequestMapping(value = "/skilllanguage/{id}", method = RequestMethod.GET)
	public String initSkillLanguage(Locale locale,
			@ModelAttribute(value = "skillLanguage") Language language,
			ModelMap model, 
			@PathVariable("id") Integer id, 
			@ModelAttribute LanguageDto languageDto) {
		
		
		logger.info("Welcome to skill language locale: " + locale);
		List<Language> languageList = languageService.findAll();
		//List<SkillLanguage> skillLanguageList = languageService.findAllByEmployee(1);
		
		
		
		//model.addAttribute("skillLaguageList", skillLanguageList );
		model.addAttribute("skillLaguage", language);
		model.addAttribute("masSkillLanguageList", languageList);
		
		LanguageDto.setApplicantId(id);
		model.addAttribute("id", languageDto.getApplicantId());
		
		return "/skilllanguage/skilllanguage";
	}
	
	
	
	
	
	@RequestMapping(value = "/skilllanguage/list/{id}", method = RequestMethod.POST,produces="application/json")
	public @ResponseBody List<LanguageDto> findSkillLanguage(Locale locale,
		   //@ModelAttribute(value = "family") Family family,
			@PathVariable("id") Integer id,
			ModelMap model)  {
		
		
		List<LanguageDto> skillLanguageList = languageDtoService.listSkillLanguage(new Integer(id));
		
		return skillLanguageList;
	
	}
	
	
	
	

	@RequestMapping(value = "/skilllanguage/add", method =  {RequestMethod.POST})
	public @ResponseBody LanguageDto addData(Locale locale,
				@Valid @ModelAttribute LanguageDto skillLanguageInfo,
				ModelMap model)  {
		
	    LanguageDto language = new LanguageDto();
	    language = skillLanguageInfo;
		logger.info("Info skill language: " + language.toString());
		languageService.saveByFindEmployee(skillLanguageInfo.getApplicantId(), language);

		return language;
		
	}
	
	
	
	@RequestMapping(value = "/skilllanguage/initedit", method =  {RequestMethod.POST})
	public @ResponseBody SkillLanguageDto initEdit(Locale locale,
				@ModelAttribute LanguageDto skillLanguageInfo,
				ModelMap model) {
		
    
	LanguageDto skillLanguage = new LanguageDto();
	skillLanguage = languageService.findSkillLanguageById(skillLanguageInfo.getId());
	return skillLanguage;
	
		
	}
	
	
	
	@RequestMapping(value = "/skilllanguage/edit", method = RequestMethod.POST)
	public @ResponseBody SkillLanguageDto edit(Locale locale,
				@ModelAttribute SkillLanguageDto skillLanguage,
				ModelMap model) {
	logger.info("info of skill language: "+skillLanguage.toString());
	languageService.updateSetSkillLanguage(skillLanguage);
	return skillLanguage;
	}

	
	
	@RequestMapping(value = "/skilllanguage/delete", method = RequestMethod.POST)
	public @ResponseBody SkillLanguageDto delete(Locale locale,
				@ModelAttribute SkillLanguageDto skillLanguage,
				ModelMap model) {
	logger.info("info of skill language: "+skillLanguage.toString());
	SkillLanguage skillLanguageDelete = languageService.find(skillLanguage.getId());
	logger.info("info of skill language: "+skillLanguageDelete.getId().toString());
	languageService.delete(skillLanguageDelete);
	return skillLanguage;
	}
	
	
	
	@RequestMapping(value = "/skilllanguage/validate", method = RequestMethod.POST)
	public @ResponseBody String validateMasSkillLanguage(Locale locale,
				@ModelAttribute SkillLanguageDto skillLanguage,
				ModelMap model,
				HttpServletResponse response) {
	logger.info("validate mas skill language");
	SkillLanguage skillLanguageValidate = languageService.findJoinMasSkillLanguage(skillLanguage.getMasSkillLanguageId());
	String msg = null;
	System.out.println("mas skill lang: "+skillLanguageValidate.getMasSkillLanguage());
	if(skillLanguageValidate.getMasSkillLanguage()==null){		
		msg = "success";
	}else if(skillLanguageValidate.getMasSkillLanguage()!=null){
		msg = "Can't create with same skill language";
        response.setStatus( HttpServletResponse.SC_BAD_REQUEST  );
	}
	
	return msg;
	}
	

}
