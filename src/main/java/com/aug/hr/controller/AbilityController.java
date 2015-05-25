/**
 *
 * @author Pranrajit
 * @date 1 พ.ค. 2558
 */
package com.aug.hr.controller;


import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.aug.hr.dto.services.AbilityDtoService;
import com.aug.hr.entity.Ability;
import com.aug.hr.entity.dto.AbilityDto;
import com.aug.hr.services.AbilityService;
import com.aug.hr.services.MasSpecialtyService;
import com.aug.hr.services.utils.UploadService;

@Controller
public class AbilityController {

	@Autowired private AbilityService abilityService;;
	
	@Autowired private AbilityDtoService abilityDtoService;
	
	@Autowired private MasSpecialtyService masSpecialtyService;
	
	@Autowired private UploadService uploadService;

	/*@RequestMapping(value = "/ability", method =RequestMethod.GET)
    public String init(ModelMap model) {	
		model.addAttribute("masspecialtyList",
				masSpecialtyService.findAll());
		return "ability/ability";
	}*/
	
	
	
	@RequestMapping(value="/ability",method={RequestMethod.GET,
			RequestMethod.POST})
	public String listAbility(HttpSession session,Locale locale, ModelMap model){
		model.addAttribute("masspecialtyList",
				masSpecialtyService.findAll());
		
		return "/ability/ability";
	}
	
	
	@RequestMapping(value ="/ability/listAll/{id}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<AbilityDto> listAll(@PathVariable("id") Integer id){
		
		return (List<AbilityDto>) abilityDtoService.searchAbility(id);
	}
	
	
	/*@RequestMapping(value ="/ability/listAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<Ability> listAll(){
		
		return abilityService.findAll();
	}*/
	
	@RequestMapping(value="/ability/add",method=RequestMethod.POST)
	public @ResponseBody String addAbility(@RequestBody Ability ability,
    		@RequestParam(value = "image", required = false) MultipartFile image,
    		Locale locale, BindingResult result, ModelMap model,HttpSession session){
		//Hibernate.initialize(ability.getEmployee().getNameEng());
		Hibernate.initialize(ability.getEmployee().getNameEng());
		
		/*
		
		 * upload image
		 
		try {
			if (image != null && image.getSize() > 0){
					*//**
					 * delete old upload picture
					 *//*
					if (!StringUtils.isEmpty(ability.getTmpImage()))
						uploadService.deleteImage(Constants.ABILITY_MODULE, ability.getTmpImage());
					
					String extension[] = image.getOriginalFilename().split("\\.");
					String fileName = ability.getName()+Calendar.getInstance().getTimeInMillis()+"."+extension[1];
					ability.setPicture(fileName);
					ability.setTmpImage(fileName);
					*//**
					 * upload new picture
					 *//*
					uploadService.uploadImage(Constants.ABILITY_MODULE, fileName, image);
					
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("msgerror", e.getMessage());
			return "/ability/ability";
		}*/
		
		abilityService.create(ability);
		return "redirect:/ability/ability";
	}
	
	
	@RequestMapping(value="/ability/findById",method=RequestMethod.POST)
	public @ResponseBody Ability findById(@RequestParam Integer id)
	{
		return abilityService.find(id);
	}
	
	
	
	/*@RequestMapping(value="/ability/findById/{abilityid}",method=RequestMethod.POST)
	public @ResponseBody Ability findById(@PathVariable("abilityid") Integer abilityid)
	{
		return (Ability) abilityService.find(abilityid);
	}
	*/
	
	@RequestMapping(value="/ability/update",method=RequestMethod.POST)
	public @ResponseBody Ability ubdateAbility(@RequestBody Ability ability){
			abilityService.update(ability);
			return ability;
	}
	
	
	
	
	@RequestMapping(value="/ability/delete{abilityid}",method=RequestMethod.POST)
	public @ResponseBody String deleteById(@PathVariable("abilityid") Integer abilityid){
		
		abilityService.deleteById(abilityid);
		
		return "redirect:/ability";
	
	
	}
	
	@ModelAttribute("ability")
	Ability setupForm(){
		return new Ability();
	}
}
