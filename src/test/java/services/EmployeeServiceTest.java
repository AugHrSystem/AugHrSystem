package services;

import java.util.List;

import org.hibernate.Hibernate;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.dto.AddressDto;
import com.aug.hr.entity.dto.AllEmployeeDto;
import com.aug.hr.services.EmployeeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class EmployeeServiceTest {
	
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private EmployeeDao employeeDao;
	
	/*@Test
	public void listAddressByEmployeeId(){
		List<AddressDto> addressDto = employeeService.findAddressByEmployeeIdAndSetToAddressDto(1);
		System.out.println("address: "+addressDto.size());
	}*/
	
	
	@Test
	public void listEmployeeById(){
		AllEmployeeDto allemp = employeeService.findEmployeeByEmployeeIdWithSetToDto(3);
		System.out.println(allemp);
	}
	
	
	@Test
	public void listEmployeeAndRelateIt(){
		
		Employee employee = employeeService.findById(1);
		Hibernate.initialize(employee.getOfficial());
		//Hibernate.initialize(employee.getAddresses());
		
		System.out.println("official id:"+employee.getOfficial().getId());
		
		for(int i=0;i<employee.getAddresses().size();i++){
			System.out.println(employee.getAddresses().get(i).getId());
		}
		
	}
	
	
	@Test
	@Rollback(false)
	public void deleteWithReleaseTable(){
		Employee employee =	employeeService.findAndinitializeOfficial(1);
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
		
		
		employeeService.delete(employee);
		
		
	}
	

}
