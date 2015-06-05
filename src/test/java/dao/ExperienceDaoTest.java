package dao;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.dao.ExperienceDao;
import com.aug.hr.entity.MasCoreSkill;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Experience;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class ExperienceDaoTest {
	
	@Autowired
	private ExperienceDao experienceDao;
	@Autowired
	private EmployeeDao employeeDao;
	
	@Test
	public void createExperience(){
		Calendar calendar = Calendar.getInstance();
		Experience experience = new Experience();
		Date dateFrom = new Date("10/09/2014");
		Date dateTo = new Date("10/11/2014");
		experience.setAddress("22/224 Bangkok, Thailand");
		experience.setAuditFlag("C");
		experience.setBusinessType("IT");
		experience.setCompanyName("LogicSpace co.,th");
		experience.setCreatedTimeStamp(calendar.getTime());
		experience.setDateFrom(dateFrom);
		experience.setDateTo(dateTo);
		experience.setPosition("JAVA Consultant");
		experience.setId(1);
		experience.setReference("Natechanok K.");
		experience.setSalary(18000);
		experience.setReason("Boring");
		Employee employee = employeeDao.find(1);
		experience.setEmployee(employee);
		experienceDao.getCurrentSession().save(experience);
	}
	
	@Test
	public void updateExperience(){
		Experience experience = (Experience) experienceDao.getCurrentSession().get(Experience.class, 1);
		experience.setBusinessType("SAP");
		experienceDao.getCurrentSession().update(experience);
	}
	
	@Test
	public void deleteExperience(){
		Experience experience = (Experience) experienceDao.getCurrentSession().get(Experience.class, 1);
		experienceDao.getCurrentSession().delete(experience);
	}
	
	@Test
	public void findExperience(){
		Experience experience = (Experience) experienceDao.getCurrentSession().get(Experience.class, 1);
		int id = experience.getId();
		Assert.assertEquals(1, id);
	}
	
	@Test
	public void findAllExperience(){
		Criteria c = experienceDao.getCurrentSession().createCriteria(Experience.class);
		List<Experience> experiences = c.list();
		Assert.assertEquals(1, experiences.size());
	}
}
