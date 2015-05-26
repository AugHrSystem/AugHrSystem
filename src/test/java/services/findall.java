/**
 *
 * @author natechanok
 * @date May 22, 2015
 */

package services;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dto.services.AimEmployeeDtoService;
import com.aug.hr.dto.services.EmployeeDtoService;
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


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class findall {

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
	
	
	@Test
	public void Test(){
		
		masSpecialtyService.findAll();
		Assert.assertNotNull(masSpecialtyService.findAll());
		System.out.println(" "+masSpecialtyService.findAll());
		
		
		masAddressTypeService.findAll();
		Assert.assertNotNull(masAddressTypeService.findAll());
		System.out.println(" "+masAddressTypeService.findAll());
	
		
		masAddressTypeService.findAll();
		Assert.assertNotNull(masAddressTypeService.findAll());
		System.out.println(" "+masAddressTypeService.findAll());
		
		masProvinceService.findAll();
		Assert.assertNotNull(masProvinceService.findAll());
		System.out.println(" "+masProvinceService.findAll());
		
		
		masEmploymentService.findAll();
		Assert.assertNotNull(masEmploymentService.findAll());
		System.out.println(" "+masEmploymentService.findAll());
		
		
		masDivisionService.findAll();
		Assert.assertNotNull(masDivisionService.findAll());
		System.out.println(" "+masDivisionService.findAll());
		
		
	    masTechnologyService.findAll();
		Assert.assertNotNull(masTechnologyService.findAll());
		System.out.println(" "+masTechnologyService.findAll());
		
		
		masCoreSkillService.findAll();
		Assert.assertNotNull(masCoreSkillService.findAll());
		System.out.println(" "+masCoreSkillService.findAll());
		
		joblevelService.findAll();
		Assert.assertNotNull(joblevelService.findAll());
		System.out.println(" "+joblevelService.findAll());
		
		
		Assert.assertNotNull(masLocationService.findAll());
		System.out.println(" "+masLocationService.findAll());
		
		Assert.assertNotNull(masStaffTypeService.findAll());
		System.out.println(" "+masStaffTypeService.findAll());
		
		
		Assert.assertNotNull(aimEmployeeDtoService.listEmployeeAim());
		System.out.println(" "+aimEmployeeDtoService.listEmployeeAim());
		
	}
	
	
	

}
