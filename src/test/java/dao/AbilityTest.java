/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
 */
package dao;

import java.util.List;

import junit.framework.Assert;

import org.hibernate.Criteria;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AbilityDao;
import com.aug.hr.entity.Ability;







@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class AbilityTest {

	@Autowired
	private AbilityDao abilityDao;
	
	@Test
	public void createAbility(){
		Ability ability=new Ability();
		ability.setEmployee(null);
		ability.setRank(9);
		ability.setMasspecialty(null);
		abilityDao.getCurrentSession().save(ability);
		
		Ability ability1 =new Ability();
		ability1.setEmployee(null);
		ability1.setRank(5);
		ability1.setMasspecialty(null);
		abilityDao.getCurrentSession().save(ability);
		
	}
	
	
	@Test
	public void updateAbility(){
		
		Ability ability=(Ability)abilityDao.find(1);
		ability.setRank(1);
		abilityDao.update(ability);
		
		
	}
	
	@Test
	public void deleteAbility(){
		
		Ability ability = (Ability) abilityDao.getCurrentSession().get(Ability.class,1);
		abilityDao.getCurrentSession().delete(ability);
	}
	
	
	@Test
	public void listAbility(){
		
		Criteria c = abilityDao.getCurrentSession().createCriteria(Ability.class);
		List<Ability> AbilityList = c.list();
		Assert.assertEquals(2, AbilityList.size());
		
	}
	
	@Test
public void findByIdAbility(){
		
		Ability ability = (Ability) abilityDao.getCurrentSession().get(Ability.class, 1);		
		int id = ability.getId();
		Assert.assertEquals(1, id);
		
	}
	
	
	
}



