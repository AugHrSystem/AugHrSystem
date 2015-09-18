package com.aug.hr.controller;


import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.entity.editor.LanguageEditor;
import com.aug.hrdb.dto.LanguageDto;
import com.aug.hrdb.entities.Language;
import com.aug.hrdb.services.EmployeeService;
import com.aug.hrdb.services.LanguageDtoService;
import com.aug.hrdb.services.LanguageService;




@Controller
public class LanguageController {
	
	@Autowired
	private LanguageService languageService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private LanguageDtoService languageDtoService;
	@Autowired
	private LanguageEditor languageEditor;
	

	private final static Logger logger = Logger
			.getLogger(Language.class);
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		
		binder.registerCustomEditor(Language.class, languageEditor);
	
	}
	
	
	@RequestMapping(value = "/skilllanguage/{id}", method = RequestMethod.GET)
	public String initSkillLanguage(Locale locale,
			@ModelAttribute(value = "skillLanguage") Language language,
			ModelMap model, 
			@PathVariable("id") Integer id, 
			@ModelAttribute LanguageDto languageDto) {
		
		
		logger.info("Welcome to skill language locale: " + locale);
		
		
		model.addAttribute("skillLaguage", language);
		
		languageDto.setEmployeeId(id);
		model.addAttribute("id", languageDto.getEmployeeId());
		
		return "/skilllanguage/skilllanguage";
	}
	
	
	
	
	
	@RequestMapping(value = "/skilllanguage/list/{id}", method = RequestMethod.POST,produces="application/json")
	public @ResponseBody List<LanguageDto> findSkillLanguage(Locale locale,
		   //@ModelAttribute(value = "family") Family family,
			@PathVariable("id") Integer id,
			ModelMap model)  {
		
		
		List<LanguageDto> languageList = languageDtoService.listLanguage(new Integer(id));	
		return languageList;
	
	}
	
	
	
	

	@RequestMapping(value = "/skilllanguage/add", method =  {RequestMethod.POST})
	public @ResponseBody LanguageDto addData(Locale locale,
				@Valid @ModelAttribute LanguageDto languageInfo,
				ModelMap model)  {
		
	    LanguageDto LanguageDto = new LanguageDto();
	    LanguageDto = languageInfo;
		logger.info("Info skill language: " + LanguageDto.toString());
		languageService.saveByFindEmployee(languageInfo.getEmployeeId(), LanguageDto);

		return LanguageDto;
		
	}
	
	
	
	@RequestMapping(value = "/skilllanguage/initedit", method =  {RequestMethod.POST})
	public @ResponseBody LanguageDto initEdit(Locale locale,
				@ModelAttribute LanguageDto languageInfo,
				ModelMap model) {
		
    
	LanguageDto languageDto = new LanguageDto();
	languageDto = languageService.findLanguageById(languageInfo.getId());
	return languageDto;
	
		
	}
	
	
	
	@RequestMapping(value = "/skilllanguage/edit", method = RequestMethod.POST)
	public @ResponseBody LanguageDto edit(Locale locale,
				@ModelAttribute LanguageDto language,
				ModelMap model) {
	logger.info("info of skill language: "+language.toString());
	languageService.updateSetLanguage(language);
	return language;
	}

	
	
	@RequestMapping(value = "/skilllanguage/delete", method = RequestMethod.POST)
	public @ResponseBody LanguageDto delete(Locale locale,
				@ModelAttribute LanguageDto language,
				ModelMap model) {
	logger.info("info of skill language: "+language.toString());
	Language languageDelete = languageService.find(language.getId());
	logger.info("info of skill language: "+languageDelete.getId().toString());
	languageService.delete(languageDelete);
	return language;
	}
	
	

}
