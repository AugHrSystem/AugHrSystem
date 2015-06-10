package services;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dto.services.EmployeeCodeDtoService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class EmployeeCodeDtoServiceTest {
	
	@Autowired
	private EmployeeCodeDtoService employeeCodeDtoService;
	
	@Test
	public void showRunningNoTest(){
		
		Assert.assertNotNull(employeeCodeDtoService.serchRunningNo("1"));
		
	}

}
