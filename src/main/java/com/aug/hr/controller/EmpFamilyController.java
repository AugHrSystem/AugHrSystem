package com.aug.hr.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aug.hr.entity.EmpFamily;
import com.aug.hr.entity.editor.EmpFamilyEditor;
import com.aug.hr.services.EmpFamilyService;


@Controller
public class EmpFamilyController {
	
	@Autowired
	private EmpFamilyService empFamilyService;
	@Autowired
	private EmpFamilyEditor empFamilyEditor;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy",
				Locale.ENGLISH); // dd/MM/yyyy
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, editor);
		binder.registerCustomEditor(EmpFamily.class, empFamilyEditor);		
	}
	
	
	
	@RequestMapping(value = "/empfamily/list", method = RequestMethod.GET)
	public String searchEmpFamily(Locale locale,
			@ModelAttribute(value = "empFamily") EmpFamily empfamily,
			ModelMap model){
		
		
		List<EmpFamily> empFamilyList = empFamilyService.findAllEmpAndEmp();
		Hibernate.initialize(empFamilyList);
		System.out.println(empFamilyList);
		model.addAttribute("empFamilyList", empFamilyList);
		model.addAttribute("empFamily", empfamily);
		
		return "/empfamily/list";
	}
	
	
	
	@RequestMapping(value = "/empfamily/form", method = RequestMethod.GET)
	public String initCreate(Locale locale,
			@ModelAttribute(value = "empFamily") EmpFamily empfamily,
			ModelMap model){
		
		return "/empfamily/form";
	}

}
