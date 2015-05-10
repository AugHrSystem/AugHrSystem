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

import com.aug.hr.dao.FamilyDao;
import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasRelationType;
import com.aug.hr.entity.Official;
import com.aug.hr.services.MasRelationTypeService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class FamilyDaoTest {
	
	@Autowired
	private FamilyDao familyDao;
	private Employee employee = new Employee();
	@Autowired
	private MasRelationTypeService masRelationService;
	private MasRelationType masRelationType; 
	
	
	@Test
	@Rollback(false)
	public void insertDataEmpFamily(){
		
		Family family = new Family();
		family.setFirstName("apiva");
		family.setLastName("kimkatanom");
		family.setMobile("0890851022");
		family.setGender("Female");
		family.setAddress("7/7 m.8 nongsamwong nongsua pathumtani");
		masRelationType = masRelationService.find(1);
		family.setMasRelation(masRelationType);
		family.setAge(24);
		Calendar cal = Calendar.getInstance();
		family.setCreatedTimeStamp(cal.getTime());
		family.setCreatedBy(0);
		family.setAuditFlag("C");
		employee.setId(1);
		family.setEmployee(employee);
		familyDao.getCurrentSession().save(family);
		
		
		
		

		Family family1 = new Family();
		family1.setFirstName("augmentis");
		family1.setLastName("admin");
		family1.setMobile("0890851022");
		family1.setGender("Female");
		family1.setAddress("7/7 m.8 nongsamwong nongsua pathumtani");
		masRelationType = masRelationService.find(1);
		family1.setMasRelation(masRelationType);
		family1.setAge(24);
		Calendar cal1 = Calendar.getInstance();
		family1.setCreatedTimeStamp(cal1.getTime());
		family1.setCreatedBy(0);
		family1.setAuditFlag("C");
		employee.setId(2);
		family1.setEmployee(employee);
		familyDao.getCurrentSession().save(family1);
	}
	
	@Test
	@Rollback(false)
	public void updateDataEmpFamily(){
		
		Family empFamily = (Family) familyDao.getCurrentSession().get(Family.class,5);
		empFamily.setFirstName("aug");
		familyDao.update(empFamily);
	}
	
	
	
	@Test
	@Rollback(false)
	public void deleteDataEmpFamily(){
		
		Family empFamily = (Family) familyDao.getCurrentSession().get(Family.class,5);
		familyDao.delete(empFamily);
	}
	
	

	@Test
	public void findAllDataEmpFamily(){
		
		Criteria c = familyDao.getCurrentSession().createCriteria(Family.class);
		List<Family> empFamilyList = c.list();
		Assert.assertEquals(2, empFamilyList.size());
		
		
	}
	
	

	@Test
	public void findDataByIdEmpFamily(){
		
		Family empFamily = (Family) familyDao.getCurrentSession().get(Family.class,6);	
		int id = empFamily.getId();
		Assert.assertEquals(1,id);
		
		
	}

}
