/**
 *
 * @author Preeyaporn
 * @date 13 พ.ค. 2558
 */
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

import com.aug.hr.dto.services.HistoryDtoService;
import com.aug.hr.entity.History;
import com.aug.hr.entity.dto.HistoryDto;
import com.aug.hr.services.HistoryService;

@Controller
public class HistoryController {

	@Autowired
	private HistoryService historyService;
	
	@Autowired
	private HistoryDtoService historyDtoService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy",Locale.ENGLISH);
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        binder.registerCustomEditor(Date.class, editor);
    }
	
	@RequestMapping(value = "/history", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String init(ModelMap model) {
		return "/history/history";
	}
	

	@RequestMapping(value ="/history/listAll/{id}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<HistoryDto> listAll(@PathVariable("id") Integer id){
		
		return (List<HistoryDto>) historyDtoService.searchHistory(id);
	}
	
	/*@RequestMapping(value ="/history/listAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<History> listAll(){
		History historyid = new History();
		historyid.setPosition("");
		return historyService.findByCriteria(historyid);
	}*/
	
	@RequestMapping(value = "/history/add", method = RequestMethod.POST)
	public @ResponseBody HistoryDto addHistory(@RequestBody HistoryDto historyDto) {
		History history = new History();
		historyService.create(history.fromHistoryDto(historyDto));
		return historyDto;
	}

	@RequestMapping(value = "/history/update", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody HistoryDto updateHistory(@RequestBody HistoryDto historyDto) {
		History history = new History();
		historyService.update(history.fromHistoryDto(historyDto));
		return historyDto;
	}
	
	@RequestMapping(value = "/history/findById", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody HistoryDto findById(@RequestParam Integer historyid) {
		History history = historyService.findById(historyid);
		return history.toHistoryDto();
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
