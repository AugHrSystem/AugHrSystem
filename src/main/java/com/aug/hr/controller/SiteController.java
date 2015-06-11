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

import com.aug.hr.dto.services.SiteDtoService;
import com.aug.hr.entity.Site;
import com.aug.hr.entity.SkillLanguage;
import com.aug.hr.entity.dto.SiteDto;
import com.aug.hr.services.SiteService;



@Controller
public class SiteController {
	

	private final static Logger logger = Logger
			.getLogger(SkillLanguage.class);
	
	@Autowired
	private SiteDtoService siteDtoService;
	@Autowired
	private SiteService siteService;
	
	
	@RequestMapping(value = "/site/{id}", method = RequestMethod.GET)
	public String initSkillLanguage(Locale locale,
			@ModelAttribute(value = "site") Site site,
			ModelMap model, 
			@PathVariable("id") Integer id, 
			@ModelAttribute SiteDto siteDto){
		
		siteDto.setEmployeeId(id);
		model.addAttribute("id", siteDto.getEmployeeId());
		return "/site/site";
	}

	
	@RequestMapping(value = "/site/list/{id}", method = RequestMethod.POST)
	public @ResponseBody List<SiteDto> findData(Locale locale,
			@PathVariable("id") Integer id,
			ModelMap model){
		
		    List<SiteDto> siteDto =  siteDtoService.listByNameNativeQuery(id);		    
		    return siteDto;
		   
	}
	
	
	@RequestMapping(value = "/site/add", method = RequestMethod.POST)
	public @ResponseBody SiteDto add(Locale locale,
				@RequestBody SiteDto siteDto,
				ModelMap model){
		
		    siteService.createSetDtoToEnity(siteDto);
			return siteDto;
		   
	}
	
	
	@RequestMapping(value = "/site/initedit", method = RequestMethod.POST)
	public @ResponseBody SiteDto initEdit(Locale locale,
				@RequestBody SiteDto siteDto,
				ModelMap model){
		
		SiteDto  siteDtoReturnToPage =  siteService.findByIdReturnToDto(siteDto.getId());
		return siteDtoReturnToPage;
		   
	}
	
	
	@RequestMapping(value = "/site/edit", method = RequestMethod.POST)
	public @ResponseBody SiteDto edit(Locale locale,
				@RequestBody SiteDto siteDto,
				ModelMap model){
		
		siteService.updateSetDtoToEntity(siteDto);
		return siteDto;
		   
	}
	
	
	
	@RequestMapping(value = "/site/delete", method = RequestMethod.POST)
	public @ResponseBody SiteDto delete(Locale locale,
				@RequestBody SiteDto siteDto,
				ModelMap model){
		
		Site site = siteService.find(siteDto.getId());
		siteService.delete(site);
		return siteDto;
		   
	}
}
