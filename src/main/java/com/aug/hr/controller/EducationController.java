/**
 *
 * @author Preeyaporn
 * @date 28 เม.ย. 2558
 */
package com.aug.hr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.entity.Education;
import com.aug.hr.services.EducationService;
import com.aug.hr.services.MasDegreetypeService;

@Controller
public class EducationController {

	@Autowired
	private EducationService educationService;

	@Autowired
	private MasDegreetypeService masDegreetypeService;

	@RequestMapping(value = "/education", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String listEducation(ModelMap model) {
		model.addAttribute("masdegreetypeList",
				masDegreetypeService.findAll());
		return "/education/education";
	}
	
	/*@RequestMapping(value = "/education/listAll", method = RequestMethod.POST)
	public @ResponseBody List<Education> listAll(
			@RequestBody Education education) {
		return educationService.findByCriteria(education);
	}*/

	@RequestMapping(value ="/education/listAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<Education> listAll(){
		Education education = new Education();
		education.setMajor("");
		return educationService.findByCriteria(education);
	}
	
	@RequestMapping(value = "/education/add", method = RequestMethod.POST)
	public @ResponseBody Education addEducation(@RequestBody Education education) {
		educationService.create(education);
		return education;
	}

	@RequestMapping(value = "/education/update", method = RequestMethod.POST)
	public @ResponseBody Education updateEducation(@RequestBody Education education) {
		educationService.update(education);
		return education;
	}
	
	@RequestMapping(value = "/education/findById", method = RequestMethod.POST)
	public @ResponseBody Education findById(@RequestParam Integer educationid) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>");
		return educationService.findById(educationid);
	}
	
	/*
	@RequestMapping(value = "/education/findById/{educationid}", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Education findById(@PathVariable("educationid") Integer educationid) {	
		return educationService.findById(educationid);
	}*/
		
	@RequestMapping(value = "/education/delete", method = RequestMethod.POST)
	public @ResponseBody String deleteEducation(@RequestParam Integer educationid) {
		educationService.deleteById(educationid);
		return "{success:true}";
	}

	@ModelAttribute("education")
	Education setupForm() {
		return new Education();
	}
}
