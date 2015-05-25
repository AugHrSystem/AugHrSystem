/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
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
import com.aug.hr.entity.Leave;
import com.aug.hr.services.LeaveService;
import com.aug.hr.services.MasLeaveTypeService;

@Controller
public class LeaveController {
 
	@Autowired private LeaveService leaveService;
	@Autowired private MasLeaveTypeService masLeaveTypeService;
	
	
	
	@RequestMapping(value="/leave",method={RequestMethod.GET,
			RequestMethod.POST})
	public String listleave(HttpSession session,Locale locale, ModelMap model){
		model.addAttribute("masleavetypeList",
		masLeaveTypeService.findAll());
		
		return "/leave/leave";
		
		
	}
	
	/*@RequestMapping(value ="/leave/listAll/{id}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<LeaveDto> listAll(@PathVariable("id") Integer id){
		
		return (List<LeaveDto>) leaveDtoService.searchLeave(id);
	}
	*/
	
	
	@RequestMapping(value="/leave/add",method=RequestMethod.POST)
	public @ResponseBody String addLeave(@RequestBody Leave leave){
		//Hibernate.initialize(ability.getEmployee().getNameEng());
		Hibernate.initialize(leave.getEmployee().getNameEng());
		leaveService.create(leave);
		return "redirect:/leave/leave";
	}
	
	
	@RequestMapping(value="/leave/findById",method=RequestMethod.POST)
	public @ResponseBody Leave findById(@RequestParam Integer id)
	{
		return leaveService.findById(id);
	}
	
	@RequestMapping(value="/leave/update",method=RequestMethod.POST)
	public @ResponseBody Leave ubdateLeave(@RequestBody Leave leave){
			leaveService.update(leave);
			return leave;
	}
	
	
	
	
	@RequestMapping(value="/leave/delete{leaveid}",method=RequestMethod.POST)
	public @ResponseBody String deleteById(@PathVariable("leaveid") Integer leaveid){
		
		leaveService.deleteById(leaveid);
		
		return "redirect:/leave";
	
	
	}
	
	
	@ModelAttribute("leave")
	Leave setupForm(){
		return new Leave();
	}
	
}
