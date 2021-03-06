package com.aug.hr.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javassist.NotFoundException;
import javassist.tools.web.BadHttpRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolationException;

import net.sf.jasperreports.engine.JRParameter;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpException;
import org.apache.log4j.Logger;
import org.hibernate.JDBCException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aug.exception.CustomException;


import com.aug.hr.entity.editor.AddressEditor;
import com.aug.hrdb.services.MasJoblevelService;
import com.aug.hr.services.ReportService;
import com.aug.hr.services.utils.UploadService;
import com.aug.hrdb.services.EmployeeDtoService;
import com.aug.hrdb.services.AimEmployeeDtoService;
import com.aug.hrdb.services.EmployeeCodeDtoService;
import com.aug.hrdb.services.EmployeeIdDtoService;
import com.aug.hrdb.services.LeaveDtoService;


import com.aug.hrdb.dto.AddressDto;

import com.aug.hrdb.dto.EmployeeCodeDto;
import com.aug.hrdb.dto.EmployeeDto;
import com.aug.hrdb.dto.ReportEmployeeDto;
import com.aug.hrdb.dto.ReportLeaveDto;
import com.aug.hrdb.dto.ReportStatusEmployeeDto;
import com.aug.hrdb.entities.Address;
import com.aug.hrdb.entities.Employee;
import com.aug.hrdb.entities.Leave;
import com.aug.hrdb.services.AddressService;
import com.aug.hrdb.services.EmployeeService;
import com.aug.hrdb.services.MasAddressTypeService;
import com.aug.hrdb.services.MasCoreSkillService;
import com.aug.hrdb.services.MasDivisionService;
import com.aug.hrdb.services.MasEmploymentService;
import com.aug.hrdb.services.MasJoblevelService;
import com.aug.hrdb.services.MasLocationService;
import com.aug.hrdb.services.MasProvinceService;
import com.aug.hrdb.services.MasSpecialtyService;
import com.aug.hrdb.services.MasStaffTypeService;
import com.aug.hrdb.services.MasTechnologyService;


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
	@Autowired private MasTechnologyService masTechnologyService;
	@Autowired private MasCoreSkillService masCoreSkillService;
	@Autowired private MasJoblevelService joblevelService;
	@Autowired private MasLocationService masLocationService;
	@Autowired private MasStaffTypeService masStaffTypeService;
	@Autowired private AddressEditor addressEditor;
	@Autowired private EmployeeDtoService employeeDtoService;
	@Autowired private AimEmployeeDtoService aimEmployeeDtoService;
	@Autowired private UploadService uploadService;
	@Autowired private EmployeeCodeDtoService employeeCodeDtoService;
	@Autowired private ReportService reportService;
	@Autowired private EmployeeIdDtoService employeeIdService;
	@Autowired private LeaveDtoService leaveDtoService;

	
	
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
	
	
	
	

	@RequestMapping(value="/employee",method={RequestMethod.GET,RequestMethod.POST})
	//@Transactional
	public String listAll(@ModelAttribute EmployeeDto employeeDto,
						  HttpSession session,
						  Locale locale,
						  ModelMap model
						  //@RequestBody String aa,
						  //@PathVariable("id") Integer id
						  ) {
	
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
		
		
		
		//employeeDto.setId(id);
		//model.addAttribute("id",employeeDto.getId());
		//model.addAttribute("employeeCodeDto",employeeCodeDtoService.serchRunningNo(1));


		//return "/employee/employee";
		 return "/employee/employeetest";
		
		
		 //return "/aa";
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
			@ModelAttribute("employeeDto") EmployeeDto employeeDto,
			ModelMap model) {
			//model.addAttribute("masAddressTypeList",masAddressTypeService.findAll());
			//model.addAttribute("provinceList",masProvinceService.findAll());
		
			return addressService.findAddressByApplicantId(addressDto.getApplicantId());
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
				 @ModelAttribute("employeeDto") EmployeeDto employeeDto,
				 Model model) {	
	   
	   			model.addAttribute("myDate", new Date());
		     
	   			System.out.println("date: "+employeeDto.getDateOfBirth());
	   
	   			employeeDto = employeeService.findEmployeeByEmployeeIdWithSetToDto(empId);
	   			
	   			
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
				model.addAttribute("employeeDto", employeeDto);
				
				new SimpleDateFormat("dd-MMM-yyyy").format(employeeDto.getDateOfBirth());
				System.out.println("date: "+employeeDto.getDateOfBirth());


				
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
	public String manageSubmit(@ModelAttribute EmployeeDto employeeDto,
			Model model,
			final RedirectAttributes redirectAttributes,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException,Exception{
	
	   logger.info("infoooo: "+employeeDto);		
	   logger.info("infoooo: ================================================================>"+employeeDto.getAimempid());
	  
	   
	   
	   //throw new HttpException("error");
	   
    
	   //throw new CustomException("E999","err");
	   
	   Employee employee = new Employee();
	   String   employeeCode = null;

	   
	   
	   System.out.println("locations: "+ employeeDto.getMasLocation());
	   //System.out.println("locations: "+ masLocationService.findByLocationCode(employeeDto.getMasLocation()));
	  
		  
	    if(employeeDto.getId()==null){	
		  
	    logger.info("create employee");
		
		try {
				if(employeeDto.getFileupload().getOriginalFilename()==null||employeeDto.getFileupload().getOriginalFilename().isEmpty()==true){
					
					try{
						employeeCode = employeeService.generateEmployeeCode(employeeDto);
						employee = employeeService.createEmployeeAndReturnId(employeeDto,employeeCode);
					}catch(JDBCException je){
						
						System.out.println("jdbce "+je.getErrorCode());
						try{
							employeeCode=employeeService.generateEmployeeCode(employeeDto);
							employee = employeeService.createEmployeeAndReturnId(employeeDto,employeeCode);
						}catch(JDBCException jdbce){
							
							redirectAttributes.addFlashAttribute("msgerror", "dupicate employeecode");
							//redirectAttributes.addFlashAttribute("employeeDto", employeeDto);

							return "redirect:/employee";

						
						}
						
					}
					
					return "redirect:/employee/init/"+employee.getId();

					
					
				}else if(employeeDto.getFileupload().getOriginalFilename()!=null||employeeDto.getFileupload().getOriginalFilename().isEmpty()==false){
					String[] result =  StringUtils.split(employeeDto.getFileupload().getOriginalFilename(),'.');
					logger.info("length: "+result.length);
		
						if(result.length==2){
						
							logger.info("length: "+result.length);

						
							
							try{
								employeeCode=employeeService.generateEmployeeCode(employeeDto);
								employeeDto.setImage(employeeCode+"."+result[1]);
								employee = employeeService.createEmployeeAndReturnId(employeeDto,employeeCode);
							}catch(JDBCException jdbce){
								
								try{
									employeeCode=employeeService.generateEmployeeCode(employeeDto);
									employeeDto.setImage(employeeCode+"."+result[1]);
									employee = employeeService.createEmployeeAndReturnId(employeeDto,employeeCode);
								}catch(JDBCException je){
									
									redirectAttributes.addFlashAttribute("msgerror", "dupicate employeecode");
									//redirectAttributes.addFlashAttribute("employeeDto", employeeDto);

									return "redirect:/employee";

									
								}

							}
							
							if(employee.getId()!=null){
								
							
									uploadService.uploadImage("EMPLOYEE",employeeCode+"."+result[1], employeeDto.getFileupload());
							
							}

						}if(result.length==0){
							
							try{
								employeeCode=employeeService.generateEmployeeCode(employeeDto);
								employee = employeeService.createEmployeeAndReturnId(employeeDto,employeeCode);
								
							}catch(JDBCException jdbce){
								try{
									employeeCode=employeeService.generateEmployeeCode(employeeDto);
									employee = employeeService.createEmployeeAndReturnId(employeeDto,employeeCode);
								}catch(JDBCException je){
									
									redirectAttributes.addFlashAttribute("msgerror", "dupicate employeecode");
									//redirectAttributes.addFlashAttribute("employeeDto", employeeDto);

									return "redirect:/employee";

								}

							}
							
						}
					

							
							return "redirect:/employee/init/"+employee.getId();
	
						
				 }
				
			} catch (IOException e) {
				//redirectAttributes.addFlashAttribute("msgerror", "upload file error, please try again");
				//return "redirect:/employee";
				
				throw new IOException();
				
				
		}catch (Exception e) {
			//return "redirect:/employee";
			throw new Exception();
		}
		
		
		
	  }else if(employeeDto.getId()>0){
		  

		  //logger.info("update emp");
		  		  
		  try{
			 
			  System.out.println("empcode: "+employeeDto.getEmployeeCode());
			  if(employeeDto.getEmployeeCode()==null||employeeDto.getEmployeeCode().isEmpty()==true){
				  employeeCode=employeeService.generateEmployeeCode(employeeDto);
				  employee = employeeService.updateEmployeeAndReturnId(employeeDto,employeeCode);				 
			  }else if(employeeDto.getEmployeeCode()!=null||employeeDto.getEmployeeCode().isEmpty()==false){
				  
				  employeeCode = employeeDto.getEmployeeCode();
				  employee = employeeService.updateEmployeeAndReturnId(employeeDto,employeeCode);
			  }
			  //employee.setId(employeeDto.getId());
			  
		  }catch(DataIntegrityViolationException jdbce){
			  try{
				  if(employeeDto.getEmployeeCode()==null||employeeDto.getEmployeeCode().isEmpty()==true){
					  employeeCode=employeeService.generateEmployeeCode(employeeDto);
					  employee = employeeService.updateEmployeeAndReturnId(employeeDto,employeeCode);				 
				  }else if(employeeDto.getEmployeeCode()!=null||employeeDto.getEmployeeCode().isEmpty()==false){
					  
					  employeeCode = employeeDto.getEmployeeCode();
					  employee = employeeService.updateEmployeeAndReturnId(employeeDto,employeeCode);
				  }
			  }catch(DataIntegrityViolationException je){
					redirectAttributes.addFlashAttribute("msgerror", "dupicate employeecode");
					//redirectAttributes.addFlashAttribute("employeeDto", employeeDto);

					return "redirect:/listemployee";

			  }
			  
		  }
		  
	  }
		
		
		
		
		
		 return "redirect:/listemployee";
	}
	
	
	
	
	@RequestMapping(value = "/employee/deleteemp/{id}", method = RequestMethod.POST )
	public String deleteEmployeeAndRelateTable(@PathVariable("id") Integer id) throws Exception {
		
		
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
				} catch (Exception e) {
					// TODO Auto-generated catch block
					throw new Exception();
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
	
	@RequestMapping(value = "/employee/reportEmpName", method = {RequestMethod.GET, RequestMethod.POST})
	public String reportEmpName(ModelMap map) {
		return "/report/reportEmpName";
	}
	
	@RequestMapping(value = "/employee/reportEmpCode", method = {RequestMethod.GET, RequestMethod.POST})
	public String modalReportEmpCode(ModelMap map) {
		return "/report/reportEmpCode";
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
	
	@RequestMapping(value = "/employee/searchReportEmpCode", method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView searchEmployeeCodeReport(@ModelAttribute(value="employee")  Employee employee, ModelMap map ,HttpSession session,Locale locale){
		List<ReportEmployeeDto> employeeList;
		String searchText = employee.getEmployeeCode();
		if(searchText.equals("forEmptySearch")){
			employeeList = employeeDtoService.reportEmployeeCode(searchText);
    	}
		else{
			employeeList = employeeDtoService.reportEmployeeCode(searchText);
		}
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		ResourceBundle bundle = ResourceBundle.getBundle("messages",locale);
		parameterMap.put(JRParameter.REPORT_RESOURCE_BUNDLE, bundle);
		ModelAndView mv = reportService.getReport(employeeList, "employeeCodeReport", employee.getReportType(),parameterMap);
        return mv;
    }
	
	@RequestMapping(value = "/employee/searchNameCode/{searchText}", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<ReportEmployeeDto> searchNameCode(@PathVariable("searchText") String searchText, @ModelAttribute(value="employee")  Employee employee, ModelMap map ,HttpSession session,Locale locale) {
		List<ReportEmployeeDto> employeeList;
		if(searchText.equals("forEmptySearch")){
			employeeList = employeeDtoService.reportEmployee("");
		}
		else{
			employeeList = employeeDtoService.reportEmployee(searchText);
		}
		return employeeList;
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
	
	
	
	//----------------------------------------EMP STATUS----------------------------------------------------------------

	
	@RequestMapping(value = "/employee/ReportStatusEmp", method =  RequestMethod.GET)
	public String ReportStatusEmp(ModelMap map) {
		return "/report/reportStatusEmp";
	}
	
	
	@RequestMapping(value = "/employee/searchEmpStatusReport", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchEmpStatusReport(@ModelAttribute(value="employee")  Employee employee, ModelMap map ,HttpSession session,Locale locale){
		List<ReportStatusEmployeeDto> employeeList;
		String searchText = employee.getMasStaffType().getName();
		if(searchText.equals("forEmptySearch")){
			employeeList = employeeDtoService.reportStatusEmployee(searchText);
    	} 
		else{
			employeeList = employeeDtoService.reportStatusEmployee(searchText);
		}
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		ResourceBundle bundle = ResourceBundle.getBundle("messages",locale);
		parameterMap.put(JRParameter.REPORT_RESOURCE_BUNDLE, bundle);
		ModelAndView mv = reportService.getReport(employeeList, "reportStatusEmp", employee.getReportType(),parameterMap);
        return mv;
        
    }
		

	@RequestMapping(value = "/employee/searchEmpStatusByStatus/{searchText}", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<ReportStatusEmployeeDto> searchNameStatusEmp(@PathVariable("searchText") String searchText, @ModelAttribute(value="employee")  Employee employee, ModelMap map ,HttpSession session,Locale locale) {
		List<ReportStatusEmployeeDto> employeeList;
		if(searchText.equals("forEmptySearch")){
			employeeList = employeeDtoService.reportStatusEmployee("");
		}
		else{
			employeeList = employeeDtoService.reportStatusEmployee(searchText);
		}
		//System.out.print("============================================================== "+searchText);
		return employeeList;
	}
//------------------------------------------------------------------------------------------------------------------------------------	
	
	
	
	

	
	@RequestMapping(value = "/employee/ReportLeave", method ={RequestMethod.GET, RequestMethod.POST})
	public String modalReportLeave(ModelMap map) {
		return "/report/reportEmpLeave";
	}
	
	
	@RequestMapping(value = "/employee/searchReportEmpLeave", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchLeaveReport(@ModelAttribute(value="employee")  Employee employee, ModelMap map ,HttpSession session,Locale locale){
		//List<ReportLeaveDto> leaveList = employeeDtoService.reportLeave();
		List<ReportLeaveDto> employeeList;
		String searchText = employee.getNameEng();
		if(searchText.equals("forEmptySearch")){
			employeeList = leaveDtoService.reportLeave(searchText);
    	}
		else{
			employeeList = leaveDtoService.reportLeave(searchText);
		}
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		ResourceBundle bundle = ResourceBundle.getBundle("messages",locale);
		parameterMap.put(JRParameter.REPORT_RESOURCE_BUNDLE, bundle);
		ModelAndView mv = reportService.getReport(employeeList, "leaveReport1", employee.getReportType(),parameterMap);
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
	
	@RequestMapping(value = "/employee/searchCode/{searchText}", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<ReportEmployeeDto> searchCode(@PathVariable("searchText") String searchText, @ModelAttribute(value="employee")  Employee employee, ModelMap map ,HttpSession session,Locale locale) {
		List<ReportEmployeeDto> employeeList;
		if(searchText.equals("forEmptySearch")){
			employeeList = employeeDtoService.reportEmployeeCode("");
		}
		else{
			employeeList = employeeDtoService.reportEmployeeCode(searchText);
		}
		return employeeList;
	}
	
	
	
	
	@RequestMapping(value = "/employee/searchNameLeave/{searchText}", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<ReportLeaveDto> searchNameLeave(@PathVariable("searchText") String searchText, @ModelAttribute(value="leave")  Leave leave, ModelMap map ,HttpSession session,Locale locale) {
		List<ReportLeaveDto> employeeLeaveList;
		if(searchText.equals("forEmptySearch")){
			employeeLeaveList = leaveDtoService.reportLeave("");
		}
		else{
			employeeLeaveList = leaveDtoService.reportLeave(searchText);
		}
		//System.out.print("============================================================== "+searchText);
		return employeeLeaveList;
	}
	
	
	@ModelAttribute("employee")
	Employee setupForm() {
		return new Employee();
	}
	
}
