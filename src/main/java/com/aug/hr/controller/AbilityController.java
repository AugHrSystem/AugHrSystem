/**
 *
 * @author Pranrajit
 * @date 1 พ.ค. 2558
 */
package com.aug.hr.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.aug.hr.dto.services.AbilityDtoService;
import com.aug.hr.entity.Ability;
import com.aug.hr.entity.dto.AbilityDto;
import com.aug.hr.services.AbilityService;
import com.aug.hr.services.MasSpecialtyService;

@Controller
public class AbilityController {

	@Autowired
	private AbilityService abilityService;;
	
	@Autowired AbilityDtoService abilityDtoService;
	
	@Autowired 
	private MasSpecialtyService masSpecialtyService;
	
	

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
	public @ResponseBody Ability addAbility(@RequestBody Ability ability){
		//Hibernate.initialize(ability.getEmployee().getNameEng());
		abilityService.create(ability);
		return ability;
	}
	
	
	@RequestMapping(value="/ability/findById",method=RequestMethod.POST)
	public @ResponseBody Ability findById(@RequestParam Integer id)
	{
		return abilityService.find(id);
	}
	
	@RequestMapping(value="/ability/update",method=RequestMethod.POST)
	public @ResponseBody Ability ubdateAbility(@RequestBody Ability ability){
			abilityService.update(ability);
			return ability;
	}
	
	
	
	
	@RequestMapping(value="/ability/delete",method=RequestMethod.POST)
	public @ResponseBody String deleteById(@RequestParam Integer id){
		
		abilityService.deleteById(id);
		
		return "{success:true}";
	
	
	}
	
	@ModelAttribute("ability")
	Ability setupForm(){
		return new Ability();
	}
}
