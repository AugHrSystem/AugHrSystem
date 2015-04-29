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
import com.aug.hr.services.impl.EducationServiceImpl;

@Controller
public class EducationController {

	@Autowired
	private EducationServiceImpl educationServiceImpl;


	@RequestMapping(value = "/education", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String listEducation(ModelMap model) {
		model.addAttribute("educationList",
				educationServiceImpl.findAll());
		return "/education/list";
	}
	
	@RequestMapping(value = "/education/searchEducation", method = RequestMethod.POST)
	public @ResponseBody List<Education> searchEducation(
			@RequestBody Education education) {
		return educationServiceImpl.findByCriteria(education);
	}

	@RequestMapping(value = "/education/add", method = RequestMethod.POST)
	public @ResponseBody Education addEducation(@RequestBody Education education) {
		educationServiceImpl.create(education);
		return education;
	}

	@RequestMapping(value = "/education/update", method = RequestMethod.POST)
	public @ResponseBody Education updateEducation(@RequestBody Education education) {
		educationServiceImpl.update(education);
		return education;
	}
	
	@RequestMapping(value = "/education/findById", method = RequestMethod.POST)
	public @ResponseBody Education findById(@RequestParam Integer id) {
		return educationServiceImpl.findById(id);
	}
	
	@RequestMapping(value = "/education/delete", method = RequestMethod.POST)
	public @ResponseBody String deleteEducation(@RequestParam Integer id) {
		educationServiceImpl.deleteById(id);
		return "{success:true}";
	}

	@ModelAttribute("education")
	Education setupForm() {
		return new Education();
	}
}
