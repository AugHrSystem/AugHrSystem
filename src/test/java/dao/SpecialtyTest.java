package dao;

import java.util.Calendar;
import java.util.List;

import junit.framework.Assert;

import org.hibernate.Criteria;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.SpecialtyDao;
import com.aug.hr.entity.MasTechnology;
import com.aug.hr.entity.MasSpecialty;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class SpecialtyTest {
	
	@Autowired
	private SpecialtyDao specialtyDao;
	
//	@Test
//	@Rollback(false)
//	public void createSpecialty(){
//		
//		
//		Specialty specialty = new Specialty();
//		specialty.setName("Java");
//		specialty.setCode("01");
//		specialty.setIsActive(true);
//		specialty.setAuditFlag("C");
//		specialty.setCreatedBy(1);
//		specialty.setIsActive(true);
//		Calendar calendar = Calendar.getInstance();
//		specialty.setCreatedTimeStamp(calendar.getTime());
//		specialtyDao.getCurrentSession().save(specialty);
//		
//		
//		Specialty specialty2 = new Specialty();
//		specialty2.setName("C#");
//		specialty2.setCode("02");
//		specialty2.setIsActive(true);
//		specialty2.setAuditFlag("C");
//		specialty2.setCreatedBy(1);
//		specialty2.setIsActive(true);
//		Calendar calendar2 = Calendar.getInstance();
//		specialty2.setCreatedTimeStamp(calendar2.getTime());
//		specialtyDao.getCurrentSession().save(specialty2);
//	
//	}
	
//	
//	@Test
//	public void updateSpecialty(){
//		
//		Specialty specialty = (Specialty) specialtyDao.getCurrentSession().get(Specialty.class, 1);
//		specialty.setName("SAP");
//		specialtyDao.getCurrentSession().update(specialty);
//		
//	}
	
//	
//	@Test
//	public void deleteSpecialty(){
//		
//		Specialty specialty = (Specialty) specialtyDao.getCurrentSession().get(Specialty.class, 3);
//		specialtyDao.getCurrentSession().delete(specialty);;
//		
//	}
	

	
	
//	@Test
//	public void findAllSpecialty(){
//		
//		Criteria c = specialtyDao.getCurrentSession().createCriteria(SpecialtyDao.class);
//		List<Specialty> specialties = c.list();
//		Assert.assertEquals(0, specialties.size());
//		
//		
//	}
//	
	
	
	
	
//	@Test
//	public void findByIdSpecialty(){
//		
//		MasTechnology masTechnology = (MasTechnology) specialtyDao.getCurrentSession().get(Specialty.class, 1);		
//		int id = masTechnology.getMasTechnologyId();
//		Assert.assertEquals(1, id);
//		
//	}
	
	
//	@Test
//	public void listSpecialty(){
//		
//		Criteria c = specialtyDao.getCurrentSession().createCriteria(Specialty.class);
//		List<Specialty> specialtyList = c.list();
//		Assert.assertEquals(44, specialtyList.size());
//		
//	}
//	

}
