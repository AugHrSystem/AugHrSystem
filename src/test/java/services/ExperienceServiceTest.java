package services;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.entity.Experience;
import com.aug.hr.services.ExperienceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class ExperienceServiceTest {
	
	@Autowired
	private ExperienceService experienceService;
		
	@Test
	public void createExp(){
		
		Experience exp = new Experience();
		exp.setOfficial(null);
		experienceService.create(exp);
		
	}
	
	
	@Test
	public void updateExp(){
		
		Experience exp = (Experience)experienceService.find(7);
		exp.setAddress("NY");
		experienceService.update(exp);
	}

	
	@Test
	public void deleteExp(){	
		Experience exp = (Experience)experienceService.find(8);
		experienceService.delete(exp);
	}
	
	

	@Test
	public void findAllExp(){	
		List<Experience> exps = experienceService.findAll();
		Assert.assertEquals(3, exps.size());
		
		
	}
	
	@Test
	public void findByIdExp(){
		
		Experience exp = (Experience)experienceService.find(3);	
		int id = exp.getId();
		Assert.assertEquals(3,id);
		
		
	}
}
