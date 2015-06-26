package com.aug.hr.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JRParameter;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aug.hr.dto.services.EmployeeDtoService;
import com.aug.hr.entity.Ability;
import com.aug.hr.dto.services.AimEmployeeDtoService;
import com.aug.hr.dto.services.EmployeeCodeDtoService;
import com.aug.hr.dto.services.EmployeeDtoService;
import com.aug.hr.dto.services.EmployeeIdDtoService;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.Education;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Leave;
import com.aug.hr.entity.MasAddressType;
import com.aug.hr.entity.MasProvince;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.Reference;
import com.aug.hr.entity.dto.AbilityDto;
import com.aug.hr.entity.dto.AddressDto;
import com.aug.hr.entity.dto.AllEmployeeDto;
import com.aug.hr.entity.dto.EducationDto;
import com.aug.hr.entity.dto.EmployeeCodeDto;
import com.aug.hr.entity.dto.EmployeeDto;
import com.aug.hr.entity.dto.EmployeeIdDto;
import com.aug.hr.entity.dto.OfficialDto;
import com.aug.hr.entity.dto.ReferenceDto;
import com.aug.hr.entity.dto.ReportCriStatusEmpDto;
import com.aug.hr.entity.dto.ReportEmployeeDto;
import com.aug.hr.entity.dto.ReportLeaveDto;
import com.aug.hr.entity.dto.ReportStatusEmployeeDto;
import com.aug.hr.entity.editor.AddressEditor;
import com.aug.hr.services.AddressService;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.JoblevelService;
import com.aug.hr.services.MasAddressTypeService;
import com.aug.hr.services.MasCoreSkillService;
import com.aug.hr.services.MasDivisionService;
import com.aug.hr.services.MasEmploymentService;
import com.aug.hr.services.MasLocationService;
import com.aug.hr.services.MasProvinceService;
import com.aug.hr.services.MasSpecialtyService;
import com.aug.hr.services.MasStaffTypeService;
import com.aug.hr.services.ReportService;
import com.aug.hr.services.masTechnologyService;
import com.aug.hr.services.utils.UploadService;

@Controller
public class EmployeeController {
	@Resource(name="employeeService")
	@Autowired private EmployeeService employeeService;
	@Autowired private MasSpecialtyService masSpecialtyService;
	@Autowired private AddressService addressService;
	@Autowired private MasAddressTypeService masAddressTypeService;
	@Autowired private MasProvinceService masProvinceService;
	@Autowired private MasEmploymentService masEmploymentService;
	@Autowired private MasDivisionService masDivisionService;
	@Autowired private masTechnologyService masTechnologyService;
	@Autowired private MasCoreSkillService masCoreSkillService;
	@Autowired private JoblevelService joblevelService;
	@Autowired private MasLocationService masLocationService;
	@Autowired private MasStaffTypeService masStaffTypeService;
	@Autowired private AddressEditor addressEditor;
	@Autowired private EmployeeDtoService employeeDtoService;
	@Autowired private AimEmployeeDtoService aimEmployeeDtoService;
	@Autowired private UploadService uploadService;
	@Autowired private EmployeeCodeDtoService employeeCodeDtoService;
	@Autowired private ReportService reportService;
	@Autowired private EmployeeIdDtoService employeeIdService;

	
	
	private static final Logger logger = Logger.getLogger(Employee.class);
	
	 
	
	//@RequestMapping(value = "/listemployee", method =  {RequestMethod.GET,RequestMethod.POST})
	@RequestMapping(value = "/employee/list", method =  {RequestMethod.GET,RequestMethod.POST})
    public String init(ModelMap model) {		
		return "/employee/listemployee";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy",Locale.ENGLISH);
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        binder.registerCustomEditor(Date.class, editor);
        binder.registerCustomEditor(Address.class, addressEditor);
    }	
	
	
	
	

	@RequestMapping(value="/employee",method={RequestMethod.POST,RequestMethod.GET})
	//@Transactional
	public String listAll(@ModelAttribute AllEmployeeDto allEmployeeDto,
						  HttpSession session,
						  Locale locale,
						  ModelMap model){
						  //@PathVariable Integer id){
	
		//model.addAttribute("masspecialtyList",masSpecialtyService.findAll());
		//model.addAttribute("masAddressTypeList",masAddressTypeService.findAll());
		model.addAttribute("masAddressTypeList",masAddressTypeService.findAll());
		model.addAttribute("provinceList",masProvinceService.findAll());
		
		model.addAttribute("employmentList",masEmploymentService.findAll());
		model.addAttribute("divisionList", masDivisionService.findAll());
		model.addAttribute("technologyList", masTechnologyService.findAll());
		model.addAttribute("coreskillList",masCoreSkillService.findAll());
		model.addAttribute("joblevelList",joblevelService.findAll());
		model.addAttribute("locationList",masLocationService.findAll());
		model.addAttribute("staffTypeList",masStaffTypeService.findAll());
		model.addAttribute("aimList",aimEmployeeDtoService.listEmployeeAim());
		
		//allEmployeeDto.setId(id);
		//model.addAttribute("id",allEmployeeDto.getId());
		//model.addAttribute("employeeCodeDto",employeeCodeDtoService.serchRunningNo(1));


//		 return "/employee/employee";
		return "/employee/employeetest";
	}
	

	@RequestMapping(value ="/employee/listAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<EmployeeDto> listAll(){
		return (List<EmployeeDto>)employeeDtoService.searchEmployee();

	}
	

	/*@RequestMapping(value ="/employee/listEmployeeAim", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<Employee> listEmployeeAim(){
		return (List<Employee>)employeeService.listEmployeeAim();
	}
	*/
	
	//Add	
	@RequestMapping(value = "/employee/add", method = RequestMethod.POST )
	public @ResponseBody Employee Add(@RequestBody Employee employee) {
		employeeService.create(employee);
		return employee;
	}
	
	
	
	//findAddress
	@RequestMapping(value = "/employee/address", method = RequestMethod.POST )
	public @ResponseBody List<AddressDto> findAddress(@RequestBody AddressDto addressDto,
			@ModelAttribute("allEmployeeDto") AllEmployeeDto allEmployeeDto,
			ModelMap model) {
			//model.addAttribute("masAddressTypeList",masAddressTypeService.findAll());
			//model.addAttribute("provinceList",masProvinceService.findAll());
		
			return addressService.findAddressByEmployeeId(addressDto.getEmployeeId());
			//return addressService.searchAddress(addressDto.getEmployeeId());
	}
	
	
	
	//Add Address
		@RequestMapping(value = "/employee/addAddress", method = { RequestMethod.GET, RequestMethod.POST })
		public @ResponseBody Address AddAddress(@RequestBody Address address) {
			addressService.create(address);
			return address;
		}
	

   
   //initedit
   @RequestMapping(value = "/employee/init/{id}",method =  RequestMethod.GET )
		 public String initEditEmployee(@PathVariable("id") Integer empId, 
				 @ModelAttribute("allEmployeeDto") AllEmployeeDto allEmployeeDto,
				 Model model) {	
	   
	   			model.addAttribute("myDate", new Date());
		     
	   			System.out.println("date: "+allEmployeeDto.getDateOfBirth());
	   
	   			allEmployeeDto = employeeService.findEmployeeByEmployeeIdWithSetToDto(empId);
	   			
	   			
	   			model.addAttribute("masAddressTypeList",masAddressTypeService.findAll());
    			model.addAttribute("provinceList",masProvinceService.findAll());
    			
    			model.addAttribute("employmentList",masEmploymentService.findAll());
    			model.addAttribute("divisionList", masDivisionService.findAll());
    			model.addAttribute("technologyList", masTechnologyService.findAll());
    			model.addAttribute("coreskillList",masCoreSkillService.findAll());
    			model.addAttribute("joblevelList",joblevelService.findAll());
    			model.addAttribute("locationList",masLocationService.findAll());
    			model.addAttribute("staffTypeList",masStaffTypeService.findAll());
    			model.addAttribute("aimList",aimEmployeeDtoService.listEmployeeAim());
				model.addAttribute("allEmployeeDto", allEmployeeDto);
				
				new SimpleDateFormat("dd-MMM-yyyy").format(allEmployeeDto.getDateOfBirth());
				System.out.println("date: "+allEmployeeDto.getDateOfBirth());


				
			return "/employee/employeetest";
	}
		
		

	//InitEdit
//	@RequestMapping(value = "/employee/initEdit/{empId}", method = { RequestMethod.GET, RequestMethod.POST })
//	@Transactional
//	public @ResponseBody Employee initEditEmployee(@PathVariable("empId") Integer empId, Model model) {	
//		Employee employee = employeeService.findById(empId);
//		
//		
//		model.addAttribute("asdfaf",new Employee());
//		
//		Employee user = new Employee();
//		
//		user.setId(employee.getId());
//		user.setName(employee.getName());
//		
//		return employee;
//	}
	


    
	//edit
	@RequestMapping(value = "/employee/edit", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Employee editEmployee(@RequestBody Employee emp) {
		employeeService.update(emp);
		return emp;
	}
	
	@RequestMapping(value="/employee/findById",method=RequestMethod.POST)
	public @ResponseBody Address findById(@RequestParam Integer id)
	{
		return addressService.find(id);
	}
	
	//editAddress
		@RequestMapping(value = "/employee/editAddress", method = RequestMethod.POST)
		public @ResponseBody Address editAddress(@RequestBody Address addres) {
			addressService.update(addres);
			return addres;
		}
	
	//delete
	@RequestMapping(value = "/employee/delete/{empId}", method = RequestMethod.POST )
	public @ResponseBody String deleteEmployee(@PathVariable("empId") Integer empId) {
		employeeService.deleteById(empId);
		return "{success:true}";
	}
	
	
	
	@RequestMapping(value = "/employee/submit", method = RequestMethod.POST )
	public String manageSubmit(@ModelAttribute AllEmployeeDto allEmployeeDto) {
	
	   logger.info("infoooo: "+allEmployeeDto);		
	   logger.info("infoooo: ================================================================>"+allEmployeeDto.getAimempid());	
	  
	   Employee employee = new Employee();
	
			
	  if(allEmployeeDto.getId()==null){	
		  
	    logger.info("create employee");
		
		try {
				if(allEmployeeDto.getFileupload().getOriginalFilename()==null){
					
					employee = employeeService.createEmployeeAndReturnId(allEmployeeDto);
					return "redirect:/employee/init/"+employee.getId();

					
					
				}else if(allEmployeeDto.getFileupload().getOriginalFilename()!=null){
					String[] result =  StringUtils.split(allEmployeeDto.getFileupload().getOriginalFilename(),'.');
					logger.info("length: "+result.length);
		
						if(result.length==2){
						
							logger.info("length: "+result.length);
								
							allEmployeeDto.setImage(allEmployeeDto.getEmployeeCode()+"."+result[1]);
							uploadService.uploadImage("EMPLOYEE",allEmployeeDto.getEmployeeCode()+"."+result[1], allEmployeeDto.getFileupload());
							employee = employeeService.createEmployeeAndReturnId(allEmployeeDto);

						}if(result.length==0){
							
							employee = employeeService.createEmployeeAndReturnId(allEmployeeDto);

						}
					

							
							return "redirect:/employee/init/"+employee.getId();
						
				 }
				
			} catch (RuntimeException | IOException e) {
				return "redirect:/employee";
				//e.printStackTrace();
		}catch (Exception e) {
			return "redirect:/employee";
			//e.printStackTrace();
		}
		
	  }else if(allEmployeeDto.getId()>0){
		  
		  /*logger.info("update emp");
		  		  */
		   
		  employee = employeeService.updateEmployeeAndReturnId(allEmployeeDto);	  
		  //employee.setId(allEmployeeDto.getId());
		  
	  }
		
		
		
		
		
		return "redirect:/listemployee";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/employee/deleteemp/{id}", method = RequestMethod.POST )
	public String deleteEmployeeAndRelateTable(@PathVariable("id") Integer id) {
		
		
		Employee employee = new Employee();
		employee =	employeeService.findAndinitializeOfficial(id);
		
		List<Employee> aimList = employeeService.findAimRelateWithEmployee(employee.getId());
		if(aimList!=null||aimList.isEmpty()==false){
			
			for(Employee aim:aimList){

				if(aim.getId()!=null){
					System.out.println("not null aim");
					aim = employeeService.findById(aim.getId());
					aim.setAimempid(null);
					System.out.println("id: "+aim.getId());
					employeeService.update(aim);
					
				}
				
			}
			
		}
		
		employee =	employeeService.findAndinitializeOfficial(id);
		
		if(employee.getImage()!=null){
			   try {
					uploadService .deleteImage("EMPLOYEE", employee.getImage());
				} catch (RuntimeException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		   }
		
		employeeService.deleteEmployeeByHibernate(employee);
		return "redirect:/listemployee";
	
	}
	
	
	
	
	
	
	
	
	
	//Report
	@RequestMapping(value = "/employee/reportPopup", method = { RequestMethod.GET})
	public String reportPopup(@ModelAttribute(value = "employee") ReportEmployeeDto reportEmployeeDto,Locale locale, ModelMap map) {
		return "/employee/reportPopup";
	}
	
	@RequestMapping(value = "/employee/ReportEmpName", method = {RequestMethod.GET, RequestMethod.POST})
	public String modalReport(ModelMap map) {
		return "/report/reportEmpName";
	}
	
	@RequestMapping(value = "/employee/modalReportEmpCode", method = RequestMethod.GET)
	public String modalReportEmpCode(ModelMap map) {
		return "/employee/reportModalEmpCode";
	}
	
	@RequestMapping(value = "/employee/searchReportEmpName", method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView searchEmployeeNameReport(@ModelAttribute(value="employee")  Employee employee, ModelMap map ,HttpSession session,Locale locale){
		//List<ReportEmployeeDto> employeeList = employeeDtoService.reportEmployee(searchText);
		//List<ReportEmployeeDto> employeeList = employeeDtoService.findByName(employee);
		List<ReportEmployeeDto> employeeList;
		String searchText = employee.getNameEng();
		if(searchText.equals("forEmptySearch")){
			employeeList = employeeDtoService.reportEmployee(searchText);
    	}
		else{
			employeeList = employeeDtoService.reportEmployee(searchText);
		}
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		ResourceBundle bundle = ResourceBundle.getBundle("messages",locale);
		parameterMap.put(JRParameter.REPORT_RESOURCE_BUNDLE, bundle);
		ModelAndView mv = reportService.getReport(employeeList, "employeeReport", employee.getReportType(),parameterMap);
        return mv;
    }
	
	@RequestMapping(value = "/employee/searchReportEmpCode", method = {RequestMethod.POST})
    public ModelAndView searchEmployeeCodeReport(@ModelAttribute(value="employee")  Employee employee, ModelMap map ,HttpSession session,Locale locale){
		List<ReportEmployeeDto> employeeList = employeeDtoService.reportEmployee(employee.getNameEng());
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		ResourceBundle bundle = ResourceBundle.getBundle("messages",locale);
		parameterMap.put(JRParameter.REPORT_RESOURCE_BUNDLE, bundle);
		ModelAndView mv = reportService.getReport(employeeList, "employeeCodeReport", employee.getReportType(),parameterMap);
        return mv;
    }
	
	
	@RequestMapping(value = "/employee/findRunningNo/{code}", method = RequestMethod.POST)
	public @ResponseBody EmployeeCodeDto findRunningNo(@PathVariable("code") String code) {
		EmployeeCodeDto empCodeDto = new EmployeeCodeDto();
		try{
		 empCodeDto = employeeCodeDtoService.serchRunningNo(code);
		}catch(IndexOutOfBoundsException e){
		 empCodeDto.setRungingNumber(0);
		}
		return empCodeDto;
	}
	
	
	
	
	
	
	
//	//Report
//		@RequestMapping(value = "/employee/reportPopup", method = { RequestMethod.GET})
//		public String reportPopup(@ModelAttribute(value = "employee") ReportStatusEmployeeDto reportStatusEmployeeDto,Locale locale, ModelMap map) {
//			return "/employee/reportPopup";
//		}
	
	@RequestMapping(value = "/employee/ReportStatusEmp", method =  RequestMethod.GET)
	public String ReportStatusEmp(ModelMap map) {
		return "/employee/reportStatusEmp";
	}
	
	
	@RequestMapping(value = "/employee/searchReportEmpStatus", method = {RequestMethod.POST})
    public ModelAndView searchReportEmpStatus(@ModelAttribute(value="employee")  Employee employee, ModelMap map ,HttpSession session,Locale locale){
		List<ReportStatusEmployeeDto> employeeList = employeeDtoService.reportStatusEmployee();
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		ResourceBundle bundle = ResourceBundle.getBundle("messages",locale);
		parameterMap.put(JRParameter.REPORT_RESOURCE_BUNDLE, bundle);
		ModelAndView mv = reportService.getReport(employeeList, "reportStatusEmp", employee.getReportType(),parameterMap);
       System.out.println("AAA");
		return mv;
    }
	
	

	//------------------------------listReportEmpstatus--------------------------
	
	@RequestMapping(value = "/employee/searchEmpStatusforlist", method = {RequestMethod.GET,RequestMethod.POST})
    public @ResponseBody List<ReportStatusEmployeeDto> searchEmpStatusforlist(){
		return employeeDtoService.reportStatusEmployee();
    }
	
	//------------------------------FindByNameEmpstatus EmpReport--------------------------
	
 	@RequestMapping(value = "/employee/searchStatusEmployeeNameReport", method = {RequestMethod.POST})
    public ModelAndView searchStatusEmployeeNameReport(@ModelAttribute(value="employee")  Employee employee, ModelMap map ,HttpSession session,Locale locale){

		List<ReportCriStatusEmpDto> employeeList = employeeDtoService.findStatusByName(employee);
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		ResourceBundle bundle = ResourceBundle.getBundle("messages",locale);
		parameterMap.put(JRParameter.REPORT_RESOURCE_BUNDLE, bundle);
		ModelAndView mv = reportService.getReport(employeeList, "reportStatusEmp", employee.getReportType(),parameterMap);
        return mv;
	
 	}
	


	
	
	@RequestMapping(value = "/employee/modalReportLeave", method = RequestMethod.GET)
	public String modalReportLeave(ModelMap map) {
		return "/employee/reportModalEmpLeave";
	}
	
	
	@RequestMapping(value = "/employee/searchReportEmpLeave", method = {RequestMethod.POST})
    public ModelAndView searchLeaveReport(@ModelAttribute(value="leave")  Leave leave, ModelMap map ,HttpSession session,Locale locale){
		List<ReportLeaveDto> leaveList = employeeDtoService.reportLeave();
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		ResourceBundle bundle = ResourceBundle.getBundle("messages",locale);
		parameterMap.put(JRParameter.REPORT_RESOURCE_BUNDLE, bundle);
		ModelAndView mv = reportService.getReport(leaveList, "leaveReport1", leave.getReportType(),parameterMap);
        return mv;
    }
	
	@RequestMapping(value = "/employee/searchName/{searchText}", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<ReportEmployeeDto> searchName(@PathVariable("searchText") String searchText, @ModelAttribute(value="employee")  Employee employee, ModelMap map ,HttpSession session,Locale locale) {
		List<ReportEmployeeDto> employeeList;
		if(searchText.equals("forEmptySearch")){
			employeeList = employeeDtoService.reportEmployee("");
		}
		else{
			employeeList = employeeDtoService.reportEmployee(searchText);
		}
		//System.out.print("============================================================== "+searchText);
		return employeeList;
	}
	
	
	@ModelAttribute("employee")
	Employee setupForm() {
		return new Employee();
	}
	
}
