package com.aug.hr.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

import com.aug.hr.dto.services.ProbationDtoService;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Probation;
import com.aug.hr.entity.dto.ProbationDto;
//import com.aug.hr.entity.dto.ProbationDto;
import com.aug.hr.services.ProbationService;

@Controller
public class ProbationController {
	
	@Autowired private ProbationService probationService;
	@Autowired private ProbationDtoService probationDtoService;

	@RequestMapping(value = "/probation", method =  RequestMethod.GET)
    public String init(ModelMap model) {		
		return "probation/probation";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy",Locale.ENGLISH);
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        binder.registerCustomEditor(Date.class, editor);
    }	
	
//	@RequestMapping(value ="/probation/listAll", method = {RequestMethod.GET, RequestMethod.POST})
//	public @ResponseBody List<Probation> listAll(){
//		return (List<Probation>) probationService.findAll();
//	}
	
	@RequestMapping(value ="/probation/listAll/{id}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<ProbationDto> listAll(@PathVariable("id") Integer id){
		
		return (List<ProbationDto>) probationDtoService.searchProbation(id);
	}
	
	//Add	
	@RequestMapping(value = "/probation/add", method = RequestMethod.POST )
	public @ResponseBody Probation Add(@RequestBody Probation probation) {
//		EmployeeDto employeeDto = new EmployeeDto();
//		employeeDto.setName(probation.getEmployee().getNameEng());
		Hibernate.initialize(probation.getEmployee().getNameEng());
		probationService.create(probation);
		return probation;
	}
	
	//InitEdit
	@RequestMapping(value = "/probation/initEdit/{proId}", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Probation initEditProbation(@PathVariable("proId") Integer proId) {	
		return probationService.find(proId);
	}
	
	//edit
	@RequestMapping(value = "/probation/edit", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Probation editProbation(@RequestBody Probation pro) {
		probationService.update(pro);
		return pro;
	}
	
	//delete
	@RequestMapping(value = "/probation/delete/{proId}", method = RequestMethod.POST )
	public String deleteProbation(@PathVariable("proId") Integer proId) {
		probationService.deleteById(proId);
		return "redirect:/probation";
	}
	
	@ModelAttribute("probation")
	Probation setupForm() {
		return new Probation();
	}
}