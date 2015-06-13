/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.controller;

import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.aug.hr.dto.services.AimEmployeeDtoService;
import com.aug.hr.dto.services.LeaveDtoService;
import com.aug.hr.entity.Leave;
import com.aug.hr.entity.dto.LeaveDto;
import com.aug.hr.services.LeaveService;
import com.aug.hr.services.MasLeaveTypeService;
import com.aug.hr.services.ReportService;

@Controller
public class LeaveController {
 
	@Autowired private LeaveService leaveService;
	@Autowired private MasLeaveTypeService masLeaveTypeService;
	@Autowired private LeaveDtoService leaveDtoService;
	@Autowired private AimEmployeeDtoService aimEmployeeDtoService;
	@Autowired private ReportService reportService;
	
	@RequestMapping(value="/leave/{id}",method={RequestMethod.GET,
			RequestMethod.POST})
	public String listleave(HttpSession session,Locale locale, ModelMap model, 
			@PathVariable("id") Integer id, 
			@ModelAttribute LeaveDto leaveDto){
		model.addAttribute("masleavetypeList",masLeaveTypeService.findAll());
		model.addAttribute("aimList",aimEmployeeDtoService.listEmployeeAim());
		
		leaveDto.setEmployeeId(id);
		model.addAttribute("id", leaveDto.getEmployeeId());
		return "/leave/leave";
		
		
	}
	
	@RequestMapping(value ="/leave/listAll/{id}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<LeaveDto> listAll(@PathVariable("id") Integer id){
		
		return (List<LeaveDto>) leaveDtoService.searchLeave(id);
	}
	
	
	
	@RequestMapping(value="/leave/add",method=RequestMethod.POST)
	public @ResponseBody LeaveDto addLeave(@RequestBody LeaveDto leaveDto){
		//Hibernate.initialize(ability.getEmployee().getNameEng());
		//Hibernate.initialize(leave.getEmployee().getNameEng());
		Leave leave = new Leave();
		leaveService.create(leave.fromLeaveDto(leaveDto,leave));
		return leaveDto;
	}
	
	
	@RequestMapping(value="/leave/findById/{leaveid}",method={ RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody LeaveDto findById(@PathVariable ("leaveid")Integer leaveid)
	{
		Leave leave = leaveService.findById(leaveid);
		return leave.toLeaveDto();
	}
	
	/*@Transactional
	@RequestMapping(value="/leave/update",method=RequestMethod.POST)
	public @ResponseBody LeaveDto ubdateLeave(@RequestBody LeaveDto leaveDto){
			
		Leave leave = new Leave();
		leaveService.update(leave.fromLeaveDto(leaveDto));
			return leaveDto;
	}*/
	
	
	@RequestMapping(value = "/leave/update", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody LeaveDto ubdateLeave(@RequestBody LeaveDto leaveDto) {
		Leave leave = leaveService.findById(leaveDto.getId());
		Leave leaveUpdate = leave.fromLeaveDto(leaveDto,leave);
		leaveService.update(leaveUpdate);
		return leave.toLeaveDto();
	}
	
	
	
	
	@RequestMapping(value="/leave/delete/{leaveid}",method=RequestMethod.POST)
	public @ResponseBody String deleteById(@PathVariable("leaveid") Integer leaveid){
		
		leaveService.deleteById(leaveid);
		
		return "redirect:/leave";
	
	
	}
	
	
	
	/*@RequestMapping(value = "/leave/modalReport", method = RequestMethod.GET)
	public String modalReport(ModelMap map) {
		return "/leave/reportModal";
	}
	
	@RequestMapping(value = "/leave/searchReport", method = {RequestMethod.POST})
    public ModelAndView searchLeaveReport(@ModelAttribute(value="leave")  Leave leave, ModelMap map ,HttpSession session,Locale locale){
		List<ReportLeaveDto> leaveList = leaveDtoService.reportLeave();
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		ResourceBundle bundle = ResourceBundle.getBundle("messages",locale);
		parameterMap.put(JRParameter.REPORT_RESOURCE_BUNDLE, bundle);
		ModelAndView mv = reportService.getReport(leaveList, "leaveReport", leave.getReportType(),parameterMap);
        return mv;
    }*/
	
	
	@ModelAttribute("leave")
	Leave setupForm(){
		return new Leave();
	}
	
}
