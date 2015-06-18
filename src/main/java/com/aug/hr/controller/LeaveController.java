/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.lang3.time.DurationFormatUtils;
import org.apache.poi.ss.usermodel.DateUtil;
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Hours;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.dto.services.AimEmployeeDtoService;
import com.aug.hr.dto.services.LeaveDtoService;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.Leave;
import com.aug.hr.entity.dto.LeaveDto;
import com.aug.hr.entity.dto.SkillLanguageDto;
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
	
	
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		 SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm",Locale.ENGLISH);
	     CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
	     binder.registerCustomEditor(Date.class, editor);
     
    }	
	
	
	
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
	
	
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/leave/add",method=RequestMethod.POST)
	public @ResponseBody LeaveDto addLeave(Locale locale,
			@ModelAttribute LeaveDto leaveDate,
			ModelMap model){

		Leave leave = new Leave();
		
		int dateNo;
		int hoursNo = 0;
		int hoursNo2 = 0;
		int hoursNo3 = 0;
		int sum=0;

	 	DateTime dt1 = new DateTime(leaveDate.getStartTime());
		DateTime dt2 = new DateTime(leaveDate.getEndTime());
		int dateNumber = Hours.hoursBetween(dt1, dt2).getHours() / 24;
		//System.out.print(Hours.hoursBetween(dt1, dt2).getHours() / 24 + " hours, ");
		
		if(dateNumber==0){
			
			//if(leaveDate.getEndTime().getHours()>12&&leaveDate.getStartTime().getHours()<12){
					hoursNo = (leaveDate.getEndTime().getHours() - leaveDate.getStartTime().getHours())-1;
			//}
			System.out.println("hoursNo#####: "+hoursNo);
			sum=hoursNo;
		}else if(dateNumber!=0){
			
			for(int i=1;i<=dateNumber;i++){
			
			  if(i==1){
				hoursNo = (18-leaveDate.getStartTime().getHours())-1;
				System.out.println("aaa");
				System.out.println("i: "+i);
			  }if(dateNumber==i){
				System.out.println("i: "+i);
				hoursNo2 = (leaveDate.getEndTime().getHours()-9)-1;
			  }if(i!=1){
				 System.out.println("i: "+i);
				 hoursNo3 = hoursNo3+8;
				  
			  }
			  
				System.out.println("hoursNo#1: "+hoursNo);
				System.out.println("hoursNo#2: "+hoursNo2);
				System.out.println("hoursNo#3: "+hoursNo3);
				sum=hoursNo+hoursNo2+hoursNo3;
				System.out.println("sum: "+leave.getSumTime());

			}
		}
		
		leaveService.create(leave.fromLeaveDto(leaveDate,leave,new Integer(sum)));
		return leaveDate;
	}
	
	
	@RequestMapping(value="/leave/findById/{leaveid}",method={ RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody LeaveDto findById(@PathVariable ("leaveid")Integer leaveid)
	{
		Leave leave = leaveService.findById(leaveid);
		return leave.toLeaveDto();
	}
	
	/*@Transactional
	@RequestMapping(value="/leave/update",method=RequestMet hod.POST)
	public @ResponseBody LeaveDto ubdateLeave(@RequestBody LeaveDto leaveDto){
			
		Leave leave = new Leave();
		leaveService.update(leave.fromLeaveDto(leaveDto));
			return leaveDto;
	}*/
	
	
	@RequestMapping(value = "/leave/update", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody LeaveDto ubdateLeave( Locale locale,
			@ModelAttribute LeaveDto leaveDto,
			ModelMap model) {
		Leave leave = leaveService.findById(leaveDto.getId());
		
		
		int dateNo;
		int hoursNo = 0;
		int hoursNo2 = 0;
		int hoursNo3 = 0;
		int sum=0;

	 	DateTime dt1 = new DateTime(leaveDto.getStartTime());
		DateTime dt2 = new DateTime(leaveDto.getEndTime());
		int dateNumber = Hours.hoursBetween(dt1, dt2).getHours() / 24;
		//System.out.print(Hours.hoursBetween(dt1, dt2).getHours() / 24 + " hours, ");
		
		if(dateNumber==0){
			
			hoursNo = (leaveDto.getEndTime().getHours() - leaveDto.getStartTime().getHours())-1;
			System.out.println("hoursNo#####: "+hoursNo);
			sum=hoursNo;
		}else if(dateNumber!=0){
			
			for(int i=1;i<=dateNumber;i++){
			
			  if(i==1){
				hoursNo = (18-leaveDto.getStartTime().getHours())-1;
				System.out.println("aaa");
				System.out.println("i: "+i);
			  }if(dateNumber==i){
				System.out.println("i: "+i);
				hoursNo2 = (leaveDto.getEndTime().getHours()-9)-1;
			  }if(i!=1){
				 System.out.println("i: "+i);
				 hoursNo3 = hoursNo3+8;
				  
			  }
			  
				System.out.println("hoursNo#1: "+hoursNo);
				System.out.println("hoursNo#2: "+hoursNo2);
				System.out.println("hoursNo#3: "+hoursNo3);
				sum=hoursNo+hoursNo2+hoursNo3;
				System.out.println("sum: "+leave.getSumTime());

			}
		}
		
		Leave leaveUpdate = leave.fromLeaveDto(leaveDto,leave,new Integer(sum));
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
