package services;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.aug.hr.dto.services.AimEmployeeDtoService;
import com.aug.hr.entity.dto.AimEmployeeDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class AimDtoServiceTest {

	
	@Autowired
	private AimEmployeeDtoService aimEmployeeDtoService;
	
	@Test
	public void listEmployeeAim(){
		List<AimEmployeeDto> aimEmployeeDtos=aimEmployeeDtoService.listEmployeeAim();
		Assert.notNull(aimEmployeeDtos);	
	}
	
	
	
	
}
