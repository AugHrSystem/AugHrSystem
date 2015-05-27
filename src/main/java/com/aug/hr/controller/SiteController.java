package com.aug.hr.controller;

import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aug.hr.entity.Site;
import com.aug.hr.entity.SkillLanguage;



@Controller
public class SiteController {
	

	private final static Logger logger = Logger
			.getLogger(SkillLanguage.class);
	
	
	@RequestMapping(value = "/site", method = RequestMethod.GET)
	public String initSkillLanguage(Locale locale,
			@ModelAttribute(value = "site") Site site,
			ModelMap model){
		
		return "/site/site";
	}

}
