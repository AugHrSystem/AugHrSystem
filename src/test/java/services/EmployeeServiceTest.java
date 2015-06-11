package services;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.entity.dto.AddressDto;
import com.aug.hr.entity.dto.AllEmployeeDto;
import com.aug.hr.services.EmployeeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class EmployeeServiceTest {
	
	@Autowired
	private EmployeeService employeeService;
	
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
	

}
