/**
 *
 * @author Preeyaporn
 * @date 4 มิ.ย. 2558
 */
package com.aug.hr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.dto.services.AllowancesDtoService;
import com.aug.hr.entity.Allowances;
import com.aug.hr.entity.dto.AllowancesDto;
import com.aug.hr.services.AllowancesService;

@Controller
public class AllowancesController {

	@Autowired
	private AllowancesService allowancesService;
	
	@Autowired
	private AllowancesDtoService allowancesDtoService;
	
	@RequestMapping(value = "/allowances", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String init(ModelMap model) {
		return "/allowances/allowances";
	}
	
	@RequestMapping(value ="/allowances/listAll/{id}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<AllowancesDto> listAll(@PathVariable("id") Integer id){
		
		return (List<AllowancesDto>) allowancesDtoService.searchAllowances(id);
	}
	
	
	@RequestMapping(value = "/allowances/add", method = RequestMethod.POST)
	public @ResponseBody AllowancesDto addAllowances(@RequestBody AllowancesDto allowancesDto) {
		Allowances allowances = new Allowances();
		allowancesService.create(allowances.fromAllowancesDto(allowances, allowancesDto));
		return allowancesDto;
	}

	@RequestMapping(value = "/allowances/update", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody AllowancesDto updateAllowances(@RequestBody AllowancesDto allowancesDto) {
		Allowances allowances = allowancesService.findById(allowancesDto.getId());
		Allowances allowancesUpdate = allowances.fromAllowancesDto(allowances, allowancesDto);
		allowancesService.update(allowancesUpdate);
		return allowances.toAllowancesDto();
	}
	
	@RequestMapping(value = "/allowances/findById", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody AllowancesDto findById(@RequestParam Integer allowancesid) {
		Allowances allowances = allowancesService.findById(allowancesid);
		return allowances.toAllowancesDto();
	}
	
	@RequestMapping(value = "/allowances/delete", method = RequestMethod.POST)
	public @ResponseBody String deleteAllowances(@RequestParam Integer allowancesid) {
		allowancesService.deleteById(allowancesid);
		return "{success:true}";
	}

	@ModelAttribute("allowances")
	Allowances setupForm() {
		return new Allowances();
	}
}
