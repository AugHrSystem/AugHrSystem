package com.aug.hr.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
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

import com.aug.hr.dto.services.EmployeeDtoService;
import com.aug.hr.entity.Ability;
import com.aug.hr.dto.services.AimEmployeeDtoService;
import com.aug.hr.dto.services.EmployeeCodeDtoService;
import com.aug.hr.dto.services.EmployeeDtoService;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasAddressType;
import com.aug.hr.entity.MasProvince;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.AddressDto;
import com.aug.hr.entity.dto.AllEmployeeDto;
import com.aug.hr.entity.dto.EmployeeDto;
import com.aug.hr.entity.dto.OfficialDto;
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
	
	
	private static final Logger logger = Logger.getLogger(Employee.class);
	
	
	@RequestMapping(value = "/listemployee", method =  {RequestMethod.GET,RequestMethod.POST})
    public String init(ModelMap model) {		
		return "/employee/listemployee";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy",Locale.ENGLISH);
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        binder.registerCustomEditor(Date.class, editor);
        binder.registerCustomEditor(Address.class, addressEditor);
    }	
	
	
	
	@RequestMapping(value="/employee",method=RequestMethod.GET)
	//@Transactional
	public String listAll(@ModelAttribute AllEmployeeDto allEmployeeDto,
						  HttpSession session,
						  Locale locale,
						  ModelMap model){
	
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
		model.addAttribute("employeeCodeDto",employeeCodeDtoService.serchRunningNo(1));


		  return "/employee/employee";
		 //return "/employee/employeetest";
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
	
	
	//Add Address
		@RequestMapping(value = "/employee/addAddress", method = { RequestMethod.GET, RequestMethod.POST })
		public @ResponseBody Address AddAddress(@RequestBody Address address) {
			addressService.create(address);
			return address;
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
	
    @Transactional
	@RequestMapping(value = "/employee/{empId}",method =  RequestMethod.GET )
	public String initEditEmployee(@PathVariable Integer empId, Model model) {	
		Employee employee=employeeService.findById(empId);
		model.addAttribute("employee", employee);
		return "/employee/employee";
	}
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
	public String deleteEmployee(@PathVariable("empId") Integer empId) {
		employeeService.deleteById(empId);
		return "redirect:/listemployee";
	}
	
	
	
	@RequestMapping(value = "/employee/submit", method = RequestMethod.POST )
	public String manageSubmit(@ModelAttribute AllEmployeeDto employee
			/*@RequestParam("fileupload") MultipartFile file*/) {
	   
		

		
		
		
		logger.info("infoooo: "+employee);	

		logger.info("infoooo: ================================================================>"+employee.getAimempid());	

		logger.info("infoooo: "+employee.getAddressList());
		logger.info("file: "+employee.getFileupload().getOriginalFilename());
		try {
			uploadService.uploadImage("EMPLOYEE",employee.getEmployeeCode()+employee.getFileupload().getOriginalFilename(), employee.getFileupload());
		} catch (RuntimeException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		employee.setImage(employee.getEmployeeCode()+employee.getFileupload().getOriginalFilename());
		
		employeeService.saveEmpAndWithRelateTable(employee);
	
		
		

		return null;
	}
	
	
	@ModelAttribute("employee")
	Employee setupForm() {
		return new Employee();
	}
}
