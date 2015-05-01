/**
 *
 * @author Pranrajit
 * @date 28 เม.ย. 2558
 */
package services;

import java.util.Calendar;
import java.util.List;




import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.aug.hr.entity.Ability;
import com.aug.hr.services.AbilityService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class AbilityServiceTest {
	
	@Autowired
	private AbilityService abilityService;
	
	
	@Test
	public void createDataAbility(){

		Ability ability =new Ability();
		ability.setEmployee(null);
		ability.setRank(9);
		ability.setSpecialty(null);
		abilityService.create(ability);
	}
	
	
	/*@Test
	public void updateDataAbility(){

		Ability ability= abilityService.find(2);
		ability.setRank(10);
		abilityService.update(ability);
		
	}*/
	
	/*@Test
	public void deleteDataAbility(){
		Ability ability=abilityService.find(1);
		abilityService.delete(ability);
	}*/
	
	/*@Test
	public void findAllDataAbility(){

		List<Ability> ability = abilityService.findAll();
		Assert.assertEquals(1, ability.size());
	}*/
	
	
	@Test
	public void findDatabyIdAbility(){

		Ability ability =(Ability) abilityService.find(2);
		int id = ability.getId();
		Assert.assertEquals(2,id);
		
		
		
	}
	
}
