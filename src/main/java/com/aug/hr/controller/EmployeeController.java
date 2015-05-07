package com.aug.hr.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

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





import com.aug.hr.entity.Address;
import com.aug.hr.entity.Employee;
import com.aug.hr.services.AddressService;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.MasSpecialtyService;

@Controller
public class EmployeeController {
	@Autowired private EmployeeService employeeService;
	@Autowired private MasSpecialtyService masSpecialtyService;
	@Autowired private AddressService addressService;
	
	
	//@Autowired private TechnologyEmpService technologyEmpService;
	/*@RequestMapping(value = "/employee", method =  RequestMethod.GET)
    public String init(ModelMap model) {		
		return "employee/employee";
	}*/
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy",Locale.ENGLISH);
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        binder.registerCustomEditor(Date.class, editor);
    }	
	
	@RequestMapping(value="/employee",method={RequestMethod.GET,
			RequestMethod.POST})
	public String listAll(HttpSession session,Locale locale, ModelMap model){
		model.addAttribute("masspecialtyList",masSpecialtyService.findAll());
		//model.addAttribute("technologyList",technologyEmpService.findAll());
		return "/employee/employee";
	}
	
//	@RequestMapping(value ="/employee/listAll", method = {RequestMethod.GET, RequestMethod.POST})
//	public @ResponseBody List<Employee> listAll(){
//		Employee emp = new Employee();
//		emp.setAge(null);
//		return employeeService.findByCriteria(emp);
//	}
	
	//Add	
	@RequestMapping(value = "/employee/add", method = RequestMethod.POST )
	public @ResponseBody Employee Add(@RequestBody Employee employee) {
		employeeService.create(employee);
		return employee;
	}
	
	
	//Add Address
		@RequestMapping(value = "/employee/addAddress", method = RequestMethod.POST )
		public @ResponseBody Address AddAddress(@RequestBody Address address) {
			addressService.create(address);
			return address;
		}
	
	//InitEdit
	@RequestMapping(value = "/employee/initEdit/{empId}", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Employee initEditEmployee(@PathVariable("empId") Integer empId) {	
		return employeeService.findById(empId);
	}
	
	//edit
	@RequestMapping(value = "/employee/edit", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Employee editEmployee(@RequestBody Employee emp) {
		employeeService.update(emp);
		return emp;
	}
	
	//delete
//	@RequestMapping(value = "/employee/delete/{empId}", method = RequestMethod.POST )
//	public String deleteEmployee(@PathVariable("empId") Integer empId) {
//		employeeService.deleteById(empId);
//		return "redirect:/employee";
//	}
	
	@ModelAttribute("employee")
	Employee setupForm() {
		return new Employee();
	}
}
