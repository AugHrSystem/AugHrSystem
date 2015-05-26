package com.aug.hr.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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

import com.aug.hr.dto.services.ReferenceDtoService;
import com.aug.hr.entity.Reference;
import com.aug.hr.entity.dto.EmployeeDto;
import com.aug.hr.entity.dto.ReferenceDto;
import com.aug.hr.services.ReferenceService;


@Controller
public class ReferenceController {

	@Autowired
	private ReferenceService referenceService;	
	@Autowired
	private ReferenceDtoService referenceDtoService;
//	@Autowired
//	private ReferenceValidator referenceValidator;
	
	

	

	@RequestMapping(value = "/reference", method = {RequestMethod.GET,RequestMethod.POST})
    public String list(HttpSession session,Locale locale, ModelMap model) {
		model.addAttribute("referenceList", referenceService.findAll());
		return "/reference/reference";
	}
	
//	@RequestMapping(value = "/reference/listAll", method = {RequestMethod.GET, RequestMethod.POST})
//	public @ResponseBody List<Reference> listAll() {
//		Reference reference = new Reference();
//		reference.setName("");
//		return referenceService.findByCriteria(reference);
//	}
	
	

	
	@RequestMapping(value = "/reference/listAll/{id}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<ReferenceDto> listAll(@PathVariable("id") Integer id) {
		return (List<ReferenceDto>) referenceDtoService.searchReference(id);
	}
	
	
	@RequestMapping(value = "/reference/add", method = RequestMethod.POST)
	public @ResponseBody ReferenceDto addReference(@RequestBody ReferenceDto referenceDto) {
		Reference reference = new Reference();
		referenceService.create(reference.fromReferenceDto(referenceDto));
		return referenceDto;
	}
	
	@Transactional
	@RequestMapping(value = "/reference/update", method = RequestMethod.POST)
	public @ResponseBody ReferenceDto updateReference(@RequestBody ReferenceDto referenceDto ) {
		Reference reference = new Reference();
		referenceService.update(reference.fromReferenceDto(referenceDto));
		return referenceDto;
	}
	
	
	@RequestMapping(value = "/reference/findById", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody ReferenceDto findById(@RequestParam Integer id) {
		Reference reference = referenceService.findById(id);
		return reference.toReferenceDto();
	}
	
	@RequestMapping(value = "/reference/delete", method =  RequestMethod.POST)
	public @ResponseBody String deleteReference(@PathVariable("referenceid") Integer id) {
		referenceService.deleteById(id);		
		return "{success:true}";
	}
	
	@ModelAttribute("reference")
	Reference setupForm() {
		return new Reference();
	}
	
	
}
