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

import com.aug.hr.entity.History;
import com.aug.hr.services.HistoryService;

@Controller
public class HistoryController {

	@Autowired
	private HistoryService historyService;


	@RequestMapping(value = "/history", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String list(ModelMap model) {
		System.out.println("ddddddddddddddddd");
		return "history/history";
	}
	

	@RequestMapping(value ="/history/listAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<History> listAll(){
		History historyid = new History();
		historyid.setPosition("");
		return historyService.findByCriteria(historyid);
	}
	
	@RequestMapping(value = "/history/add", method = RequestMethod.POST)
	public @ResponseBody History addHistory(@RequestBody History historyid) {
		historyService.create(historyid);
		return historyid;
	}

	@RequestMapping(value = "/history/update", method = RequestMethod.POST)
	public @ResponseBody History updateHistory(@RequestBody History historyid) {
		historyService.update(historyid);
		return historyid;
	}
	
	@RequestMapping(value = "/history/findById", method = RequestMethod.POST)
	public @ResponseBody History findById(@RequestParam Integer historyid) {
		return historyService.findById(historyid);
	}
	
		
	@RequestMapping(value = "/history/delete", method = RequestMethod.POST)
	public @ResponseBody String deleteHistory(@RequestParam Integer historyid) {
		historyService.deleteById(historyid);
		return "{success:true}";
	}

	@ModelAttribute("history")
	History setupForm() {
		return new History();
	}
}
