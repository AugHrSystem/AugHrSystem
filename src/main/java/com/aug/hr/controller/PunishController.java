package com.aug.hr.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.dto.services.PunishDtoService;
import com.aug.hr.entity.Punish;
import com.aug.hr.entity.dto.PunsihDto;
import com.aug.hr.entity.editor.PunishEditor;
import com.aug.hr.services.PunishService;


@Controller
public class PunishController {
	@Autowired 
	private PunishService punishService;
	@Autowired
	private PunishDtoService punishDtoService;
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy",Locale.ENGLISH); // dd/MM/yyyy
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, editor);		
	}
	 

	@RequestMapping(value = "/punish/{id}", method = {RequestMethod.GET,RequestMethod.POST})
    public String list(HttpSession session,Locale locale, ModelMap model, 
			@PathVariable Integer id, 
			@ModelAttribute PunsihDto punsihDto) {
		
		punsihDto.setEmployeeId(id);
		model.addAttribute("id", punsihDto.getEmployeeId());
		return "/punish/punish";
	}
	
	
//	@RequestMapping(value = "/punish/listAll", method = {RequestMethod.GET, RequestMethod.POST})
//	public @ResponseBody List<Punish> listAll() {
//		Punish punish = new Punish();
//		punish.setReason("");
//		return punishService.findByCriteria(punish);
//	}
	
	
	@RequestMapping(value = "/punish/listAll{id}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<PunsihDto> listAll(@PathVariable("id") Integer id) {
		return (List<PunsihDto>) punishDtoService.searchPunish(id);
	}
	
	
	@RequestMapping(value = "/punish/add", method = RequestMethod.POST)
	public @ResponseBody PunsihDto addPunsih(@RequestBody PunsihDto punishDto) {
		Punish punish = new Punish();
		punishService.create(punish.fromPunishDto(punish,punishDto));
		return punishDto;
	}
	
	@RequestMapping(value = "/punish/update", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody PunsihDto updatePunish(@RequestBody PunsihDto punishDto ) {
		
		Punish entityLoaded = punishService.findById(punishDto.getId());
		entityLoaded.setDatepunish(punishDto.getDatepunish());
		entityLoaded.setDescription(punishDto.getDescription());	
		entityLoaded.setPenalty(punishDto.getPenalty());
		
		punishService.update(entityLoaded);
		return punishDto;
	}
	
	@RequestMapping(value = "/punish/findById/{punishid}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody PunsihDto findById(@PathVariable("punishid") Integer punishid) {
		Punish punish = punishService.findById(punishid);
		return punish.toPunishDto();
	}
	
	@RequestMapping(value = "/punish/delete/{punishid}", method = RequestMethod.POST)
	public @ResponseBody String deletePunish(@PathVariable("punishid")Integer punishid) {
		punishService.deleteById(punishid);		
		//return "{success:true}";
		return "redirect:/punish";
	}
	@ModelAttribute("punish")
	Punish setupForm() {
		return new Punish();
	}
	

}
