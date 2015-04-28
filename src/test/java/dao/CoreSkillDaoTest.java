package dao;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.CoreSkillDao;
import com.aug.hr.entity.CoreSkill;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class CoreSkillDaoTest {
	
	@Autowired
	private CoreSkillDao coreSkillDao;
	
	@Test
	public void createCoreSkill(){
		Calendar calendar = Calendar.getInstance();
		CoreSkill coreSkill = new CoreSkill();
		coreSkill.setAuditFlag("C");
		coreSkill.setCode("PR");
		coreSkill.setCreatedBy(001);
		coreSkill.setCreatedTimeStamp(calendar.getTime());
		coreSkill.setId(1);
		coreSkill.setIsActive(true);
		coreSkill.setName("Programmer");
		coreSkillDao.getCurrentSession().save(coreSkill);		
	}
	
//	@Test
//	public void updateCoreSkill(){
//		CoreSkill coreSkill = (CoreSkill) coreSkillDao.getCurrentSession().get(CoreSkill.class, 1);
//		coreSkill.setIsActive(false);
//		coreSkillDao.getCurrentSession().update(coreSkill);
//	}
//	
//	@Test
//	public void deleteCoreSkill(){
//		CoreSkill coreSkill = (CoreSkill) coreSkillDao.getCurrentSession().get(CoreSkill.class, 1);
//		coreSkillDao.getCurrentSession().delete(coreSkill);
//	}
//	
//	@Test
//	public void findCoreSkill(){
//		CoreSkill coreSkill = (CoreSkill) coreSkillDao.getCurrentSession().get(CoreSkill.class, 1);
//		int id = coreSkill.getId();
//		Assert.assertEquals(1, id);
//	}
//	
//	@Test
//	public void findAllCoreSkill(){
//		Criteria c = coreSkillDao.getCurrentSession().createCriteria(CoreSkill.class);
//		List<CoreSkill> coreSkills = c.list();
//		Assert.assertEquals(19, coreSkills.size());
//	}

}
