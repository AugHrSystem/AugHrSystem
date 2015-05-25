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
	private PunishDtoService punishDtoService;
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy",Locale.ENGLISH); // dd/MM/yyyy
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, editor);
	//	binder.registerCustomEditor(Punish.class, PunishEditor);		
	}
	

	
	@RequestMapping(value = "/punish/listAll{id}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<PunsihDto> listAll(@PathVariable("id") Integer id) {
		//Punish punish = new Punish();	
		return (List<PunsihDto>) punishDtoService.searchPunish(id);
	}
	

	@RequestMapping(value = "/punish", method = {RequestMethod.GET,RequestMethod.POST})
    public String list(HttpSession session,Locale locale, ModelMap model) {
		model.addAttribute("punishList", punishService.findAll());
		return "/punish/punish";
	}
	
//	@RequestMapping(value = "/punish/listAll", method = {RequestMethod.GET, RequestMethod.POST})
//	public @ResponseBody List<Punish> listAll() {
//		Punish punish = new Punish();
//		punish.setReason("");
//		return punishService.findByCriteria(punish);
//	}
	
	@RequestMapping(value = "/punish/add", method = RequestMethod.POST)
	public @ResponseBody Punish addPunsih(@RequestBody Punish punish) {
	//	Hibernate.initialize(punish.getEmployee().getNameEng());
		punishService.create(punish);
		return punish;
	}
	@RequestMapping(value = "/punish/update", method = RequestMethod.POST)
	public @ResponseBody Punish updatePunish(@RequestBody Punish punish ) {
		punishService.update(punish);
		return punish;
	}
	
	@RequestMapping(value = "/punish/findById", method = RequestMethod.POST)
	public @ResponseBody Punish findById(@RequestParam Integer id) {
		return punishService.findById(id);
	}
	
	@RequestMapping(value = "/punish/delete", method = RequestMethod.POST)
	public @ResponseBody String deletePunish(@RequestParam Integer id) {
		punishService.deleteById(id);
		
		return "{success:true}";
	}
	@ModelAttribute("punish")
	Punish setupForm() {
		return new Punish();
	}
	

}
