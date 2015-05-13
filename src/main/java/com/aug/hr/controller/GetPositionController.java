/**
 *
 * @author Preeyaporn
 * @date 13 พ.ค. 2558
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

import com.aug.hr.entity.GetPosition;
import com.aug.hr.services.GetPositionService;

@Controller
public class GetPositionController {

	@Autowired
	private GetPositionService getPositionService;


	@RequestMapping(value = "/getposition", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String list(ModelMap model) {
		System.out.println("ddddddddddddddddd");
		return "getposition/getposition";
	}
	

	@RequestMapping(value ="/getposition/listAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<GetPosition> listAll(){
		GetPosition getpositionid = new GetPosition();
		getpositionid.setPosition("");
		return getPositionService.findByCriteria(getpositionid);
	}
	
	@RequestMapping(value = "/getposition/add", method = RequestMethod.POST)
	public @ResponseBody GetPosition addGetPosition(@RequestBody GetPosition getpositionid) {
		getPositionService.create(getpositionid);
		return getpositionid;
	}

	@RequestMapping(value = "/getposition/update", method = RequestMethod.POST)
	public @ResponseBody GetPosition updateGetPosition(@RequestBody GetPosition getpositionid) {
		getPositionService.update(getpositionid);
		return getpositionid;
	}
	
	@RequestMapping(value = "/getposition/findById", method = RequestMethod.POST)
	public @ResponseBody GetPosition findById(@RequestParam Integer getpositionid) {
		return getPositionService.findById(getpositionid);
	}
	
		
	@RequestMapping(value = "/getposition/delete", method = RequestMethod.POST)
	public @ResponseBody String deleteGetPosition(@RequestParam Integer getpositionid) {
		getPositionService.deleteById(getpositionid);
		return "{success:true}";
	}

	@ModelAttribute("getposition")
	GetPosition setupForm() {
		return new GetPosition();
	}
}
