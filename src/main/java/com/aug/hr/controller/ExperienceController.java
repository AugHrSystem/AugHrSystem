package com.aug.hr.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Experience;
import com.aug.hr.services.ExperienceService;

@Controller
public class ExperienceController {
	@Autowired private ExperienceService experienceService;
	
	
	@RequestMapping(value = "/experience", method =  RequestMethod.GET)
    public String init(ModelMap model) {		
		return "experience/experience";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy",Locale.ENGLISH);
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        binder.registerCustomEditor(Date.class, editor);
    }	
	
	@RequestMapping(value ="/experience/listAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<Experience> listAll(@RequestParam Integer id){
		Employee emp = new Employee();
		emp.setId(id);
		Experience experience = new Experience();
		experience.setEmployee(emp);
		return (List<Experience>) experienceService.findByCriteria(experience);
	}
	
	@RequestMapping(value ="/experience/testAjax/{string}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String testAjax(@PathVariable String string){
		return "testAjax: "+string;
	}
	
	//Add	
	@RequestMapping(value = "/experience/add", method = RequestMethod.POST )
	public @ResponseBody Experience Add(@RequestBody Experience experience) {
		experienceService.create(experience);
		return experience;
	}
	
	//InitEdit
	@RequestMapping(value = "/experience/initEdit/{expId}", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Experience initEditExperience(@PathVariable("expId") Integer expId) {	
		return experienceService.find(expId);
	}
	
	//edit
	@RequestMapping(value = "/experience/edit", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Experience editExperience(@RequestBody Experience exp) {
		experienceService.update(exp);
		return exp;
	}
	
	//delete
	@RequestMapping(value = "/experience/delete/{expId}", method = RequestMethod.POST )
	public String deleteExperience(@PathVariable("expId") Integer expId) {
		experienceService.deleteById(expId);
		return "redirect:/experience";
	}
	
	@ModelAttribute("experience")
	Experience setupForm() {
		return new Experience();
	}
}
