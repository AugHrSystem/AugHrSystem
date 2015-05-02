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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.entity.Ability;

import com.aug.hr.services.AbilityService;
import com.aug.hr.services.MasSpecialtyService;

@Controller
public class AbilityController {

	@Autowired
	private AbilityService abilityService;;
	
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
		System.out.print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
				+ "aaaaaaaaaaaaaaaaaaaaa"
				+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaauuuuu"
				+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
				+ "aaaaaaaaaaaaaaaaaaaaaa");
		model.addAttribute("masspecialtyList",
				masSpecialtyService.findAll());
		
		
		System.out.print("ooooooooooooooooooooooooooooooooooooooooooo"
				+ "uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"
				+ "uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"
				+ "uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"
				+ "uuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
		return "/ability/ability";
	}
	
	@RequestMapping(value="/ability/add",method=RequestMethod.POST)
	public @ResponseBody Ability addAbility(@RequestBody Ability ability){
		
		
		System.out.print("33333333333333333333333333333333333333333"
				+ "3333333333333333333333333333333333333"
				+ "3333333333333333333333333333"
				+ "333333333333333333333333333333"
				+ "3333333333333333333333333333333333333");
		
		abilityService.create(ability);
		
		
		System.out.print("1111111111111111111111111111111"
				+ "1111111111111111111111111111111111"
				+ "1111111111111111111111111111111"
				+ "11111111111111111111111111"
				+ "111111111111111111111111111111");
		return ability;
	}
	
	@ModelAttribute("ability")
	Ability setupForm(){
		return new Ability();
	}
}
