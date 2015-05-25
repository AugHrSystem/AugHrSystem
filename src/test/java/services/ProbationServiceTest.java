package services;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Probation;
import com.aug.hr.services.ProbationService;
;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class ProbationServiceTest {
	
	@Autowired
	private ProbationService probationService;
		
	@Test
	public void create(){
		Employee emp = new Employee();
		emp.setId(2);
		Probation pro = new Probation();
		pro.setStatus("Extend");
		pro.setEmployee(emp);
		probationService.create(pro);
		
	}
	
	
	@Test
	public void update(){
		
		Probation pro= (Probation)probationService.find(1);
		pro.setStatus("Pass");
		probationService.update(pro);
	}

	
	@Test
	public void delete(){	
		Probation pro = (Probation)probationService.find(1);
		probationService.delete(pro);
	}
	
	

	@Test
	public void findAll(){	
		List<Probation> pros = probationService.findAll();
		Assert.assertEquals(1, pros.size());
		
		
	}
	
	@Test
	public void findById(){
		
		Probation pro = (Probation)probationService.find(1);	
		int id = pro.getId();
		Assert.assertEquals(1,id);
		
		
	}
}
