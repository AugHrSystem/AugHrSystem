/**
 *
 * @author Pranrajit
 * @date 28 เม.ย. 2558
 */
package com.aug.hr.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.MasSpecialtyService;
import com.aug.hr.entity.Ability;
import com.aug.hr.services.AbilityService;


@Controller
public class AbilityController {
	
	@Autowired private AbilityService abilityService;
	//@Autowired private EmployeeService employeeService;
	@Autowired private MasSpecialtyService masSpecialtyService;
	
	
	@RequestMapping(value = "/ability", method = {RequestMethod.GET,RequestMethod.POST})
    public String listAbility(ModelMap model) {
		model.addAttribute("masspecialList", masSpecialtyService.findAll());
//		model.addAttribute("employeeList", employeeService.findAll());
		return "/ability/ability";
		
	}
	
	/*@RequestMapping(value = "/ability/search", method = {RequestMethod.GET,RequestMethod.POST})
    public String searchProducts(@ModelAttribute(value="ability")  Ability ability, ModelMap map ,HttpSession session)
    {
		session.setAttribute("searchCriteria", ability);
		
		List <Ability> page = abilityService.findByCriteria(ability);
		
	
        map.addAttribute("ability", ability);
        map.addAttribute("employeeList", page);
       
        return "/ability/ability";
    }*/
	
	
	
//	@RequestMapping(value="/ability/searchname",method=RequestMethod.POST)
//	public @ResponseBody List<Employee> searchProductAjax(@RequestParam String employee)
//	{
//		Employee employee2 =new Employee();
//		employee2.setName(employee);
//		
//		return employeeService.findByCriteria(employee);
//	}
	
	
	//Add
	@RequestMapping(value = "/ability/add", method =RequestMethod.POST)
	public @ResponseBody Ability addAbility(@RequestBody Ability ability) {
			abilityService.create(ability);
			System.out.print("*********************************************************************"
					+ "***************************************************************************"
					+ "*******************************************************************************"
					+ "*******************************************hello");
			return ability;
	}
	
	/*@RequestMapping(value="/ability/findById",method=RequestMethod.POST)
	public @ResponseBody Ability findById(@RequestParam Integer id)
	{
		
		
		return abilityService.find(id);
	}
	
	@RequestMapping(value="/ability/update",method={RequestMethod.POST})
	public @ResponseBody Ability updateAbility(@RequestBody Ability ability){
		abilityService.update(ability);
		return ability;
	}
	
	@RequestMapping(value="/ability/delete",method={RequestMethod.POST})
	public @ResponseBody String deleteAbility(@RequestParam Integer id){
		
		abilityService.deleteById(id);
		
		return "{success:true}";
	
	
	}*/
	

	@ModelAttribute("ability")
	Ability setupForm() {
	return new Ability();
	}
	
	
}
