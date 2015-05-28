package com.aug.hr.controller;


import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.dto.services.SkillLanguageDtoService;
import com.aug.hr.entity.Family;
import com.aug.hr.entity.MasSkillLanguage;
import com.aug.hr.entity.SkillLanguage;
import com.aug.hr.entity.dto.SkillLanguageDto;
import com.aug.hr.entity.editor.SkillLanguageEditor;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.MasSkillLanguageService;
import com.aug.hr.services.SkillLanguageService;


@Controller
public class SkillLanguageController {
	
	@Autowired
	private SkillLanguageService skillLanguageService;
	@Autowired
	private MasSkillLanguageService masSkillLanguageService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private SkillLanguageDtoService skillLanguageDtoService;
	@Autowired
	private SkillLanguageEditor skillLanguageEditor;
	

	private final static Logger logger = Logger
			.getLogger(SkillLanguage.class);
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		
		binder.registerCustomEditor(SkillLanguage.class, skillLanguageEditor);
	
	}
	
	
	@RequestMapping(value = "/skilllanguage", method = RequestMethod.GET)
	public String initSkillLanguage(Locale locale,
			@ModelAttribute(value = "skillLanguage") SkillLanguage skillLanguage,
			ModelMap model){
		
		
		logger.info("Welcome to skill language locale: " + locale);
		List<MasSkillLanguage> masSkillLanguageList = masSkillLanguageService.findAll();
		List<SkillLanguage> skillLanguageList = skillLanguageService.findAllByEmployee(1);
		
		
		
		model.addAttribute("skillLaguageList", skillLanguageList );
		model.addAttribute("skillLaguage", skillLanguage);
		model.addAttribute("masSkillLanguageList", masSkillLanguageList);
		
		return "/skilllanguage/skilllanguage";
	}
	
	
	
	
	
	@RequestMapping(value = "/skilllanguage/list/{id}", method = RequestMethod.POST,produces="application/json")
	public @ResponseBody List<SkillLanguageDto> findSkillLanguage(Locale locale,
		   //@ModelAttribute(value = "family") Family family,
			@PathVariable("id") Integer id,
			ModelMap model){
		
		
		List<SkillLanguageDto> skillLanguageList = skillLanguageDtoService.listSkillLanguage(new Integer(1));
		
		return skillLanguageList;
	
	}
	
	
	
	

	@RequestMapping(value = "/skilllanguage/add", method =  {RequestMethod.POST})
	public @ResponseBody SkillLanguageDto addData(Locale locale,
				@ModelAttribute SkillLanguageDto skillLanguageInfo,
				ModelMap model){
		
	    SkillLanguageDto skillLanguage = new SkillLanguageDto();
	    skillLanguage = skillLanguageInfo;
		logger.info("Info skill language: " + skillLanguage.toString());
		skillLanguageService.saveByFindEmployee(skillLanguageInfo.getEmployeeId(), skillLanguage);

		return skillLanguage;
		
	}
	
	
	
	@RequestMapping(value = "/skilllanguage/initedit", method =  {RequestMethod.POST})
	public @ResponseBody SkillLanguageDto initEdit(Locale locale,
				@ModelAttribute SkillLanguageDto skillLanguageInfo,
				ModelMap model){
		
    
	SkillLanguageDto skillLanguage = new SkillLanguageDto();
	skillLanguage = skillLanguageService.findSkillLanguageById(skillLanguageInfo.getId());
	return skillLanguage;
	
		
	}
	
	
	
	@RequestMapping(value = "/skilllanguage/edit", method = RequestMethod.POST)
	public @ResponseBody SkillLanguageDto edit(Locale locale,
				@ModelAttribute SkillLanguageDto skillLanguage,
				ModelMap model){
	logger.info("info of skill language: "+skillLanguage.toString());
	skillLanguageService.updateSetSkillLanguage(skillLanguage);
	return skillLanguage;
	}

	
	
	@RequestMapping(value = "/skilllanguage/delete", method = RequestMethod.POST)
	public @ResponseBody SkillLanguageDto delete(Locale locale,
				@ModelAttribute SkillLanguageDto skillLanguage,
				ModelMap model){
	logger.info("info of skill language: "+skillLanguage.toString());
	SkillLanguage skillLanguageDelete = skillLanguageService.find(skillLanguage.getId());
	logger.info("info of skill language: "+skillLanguageDelete.getId().toString());
	skillLanguageService.delete(skillLanguageDelete);
	return skillLanguage;
	}
	
	
	

}
