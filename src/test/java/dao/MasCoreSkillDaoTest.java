package dao;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.test.annotation.Rollback;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasCoreSkillDao;
import com.aug.hr.entity.MasCoreSkill;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class MasCoreSkillDaoTest {
	
	@Autowired
	private MasCoreSkillDao masCoreSkillDao;
	
	@Test
	public void createCoreSkill(){
		Calendar calendar = Calendar.getInstance();
		MasCoreSkill masCoreSkill = new MasCoreSkill();
		masCoreSkill.setAuditFlag("C");
		masCoreSkill.setCode("PR");
		masCoreSkill.setCreatedBy(001);
		masCoreSkill.setCreatedTimeStamp(calendar.getTime());
		masCoreSkill.setId(1);
		masCoreSkill.setIsActive(true);
		masCoreSkill.setName("Programmer");
		masCoreSkillDao.getCurrentSession().save(masCoreSkill);		
	}
	
	@Test
	public void updateCoreSkill(){
		MasCoreSkill masCoreSkill = (MasCoreSkill) masCoreSkillDao.getCurrentSession().get(MasCoreSkill.class, 1);
		masCoreSkill.setIsActive(false);
		masCoreSkillDao.getCurrentSession().update(masCoreSkill);
	}
	
	@Test
	public void deleteCoreSkill(){
		MasCoreSkill masCoreSkill = (MasCoreSkill) masCoreSkillDao.getCurrentSession().get(MasCoreSkill.class, 1);
		masCoreSkillDao.getCurrentSession().delete(masCoreSkill);
	}
	
	@Test
	public void findCoreSkill(){
		MasCoreSkill masCoreSkill = (MasCoreSkill) masCoreSkillDao.getCurrentSession().get(MasCoreSkill.class, 1);
		int id = masCoreSkill.getId();
		Assert.assertEquals(1, id);
	}
	
	@Test
	public void findAllCoreSkill(){
		Criteria c = masCoreSkillDao.getCurrentSession().createCriteria(MasCoreSkill.class);
		List<MasCoreSkill> masCoreSkills = c.list();
		Assert.assertEquals(19, masCoreSkills.size());
	}


}
