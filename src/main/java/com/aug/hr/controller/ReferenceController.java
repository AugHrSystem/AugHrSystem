package com.aug.hr.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.entity.Reference;
import com.aug.hr.entity.editor.ReferenceEditor;
import com.aug.hr.services.ReferenceService;


@Controller
public class ReferenceController {

	@Autowired
	private ReferenceService referenceService;
	@Autowired
	private ReferenceEditor referenceEditor;
//	@Autowired
//	private ReferenceValidator referenceValidator;
	
	
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy",
//				Locale.ENGLISH); // dd/MM/yyyy
//		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
//		binder.registerCustomEditor(Date.class, editor);
//		binder.registerCustomEditor(Reference.class, referenceEditor);		
//	}
//	
	@RequestMapping(value = "/reference", method = {RequestMethod.GET,RequestMethod.POST})
    public String list(HttpSession session,Locale locale, ModelMap model) {
		model.addAttribute("referenceList", referenceService.findAll());
		return "/reference/listreference";
	}
	
	@RequestMapping(value = "/searchReference", method = RequestMethod.POST)
	public @ResponseBody List<Reference> searchReference(
			@RequestBody Reference reference) {
		return referenceService.findByCriteria(reference);
	}
	
	@RequestMapping(value = "/reference/add", method = RequestMethod.POST)
	public @ResponseBody Reference addReference(@RequestBody Reference reference) {
		referenceService.create(reference);
		return reference;
	}
	@RequestMapping(value = "/reference/update", method = RequestMethod.POST)
	public @ResponseBody Reference updateReference(@RequestBody Reference reference ) {
		referenceService.update(reference);
		return reference;
	}
	
	@RequestMapping(value = "/reference/findById", method = RequestMethod.POST)
	public @ResponseBody Reference findById(@RequestParam Integer id) {
		return referenceService.find(id);
	}
	
	@RequestMapping(value = "/reference/delete", method = RequestMethod.POST)
	public @ResponseBody String deleteReference(@RequestParam Integer id) {
		referenceService.deleteById(id);
		
		return "{success:true}";
	}
	@ModelAttribute("reference")
	Reference setupForm() {
		return new Reference();
	}
	
	
}
