package services;

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

import com.aug.hr.dao.MasRelationTypeDao;
import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasRelationType;
import com.aug.hr.entity.Official;
import com.aug.hr.services.FamilyService;
import com.aug.hr.services.MasRelationTypeService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class FamilyServiceTest {
	
	@Autowired
	private FamilyService familyService;
	private Employee employee = new Employee();
	private MasRelationType masRelationType = new MasRelationType();
	@Autowired
	private MasRelationTypeService masRelationTypeService;
	
	
	@Test
	@Rollback(false)
	public void createDataEmpFamily(){
		
		Family family = new Family();
		family.setFirstName("augmentis");
		family.setLastName("admin servicetest");
		family.setMobile("0890851022");
		family.setGender("Female");
		family.setAddress("7/7 m.8 nongsamwong nongsua pathumtani");
		masRelationType = masRelationTypeService.find(1);
		family.setMasRelation(masRelationType);
		family.setAge(24);
		Calendar cal = Calendar.getInstance();
		family.setCreatedTimeStamp(cal.getTime());
		family.setCreatedBy(0);
		family.setAuditFlag("C");
		employee.setId(1);
		family.setEmployee(employee);
		familyService.create(family);
		
		

		Family empFamily1 = new Family();
		empFamily1.setFirstName("apiva kim");
		empFamily1.setLastName("test");
		empFamily1.setMobile("0890851022");
		empFamily1.setGender("Female");
		empFamily1.setAddress("7/7 m.8 nongsamwong nongsua pathumtani");
		masRelationType = masRelationTypeService.find(1);
		family.setMasRelation(masRelationType);
		empFamily1.setAge(24);
		Calendar cal1 = Calendar.getInstance();
		empFamily1.setCreatedTimeStamp(cal1.getTime());
		empFamily1.setCreatedBy(0);
		empFamily1.setAuditFlag("C");
		employee.setId(2);
		empFamily1.setEmployee(employee);
		familyService.create(empFamily1);
		
		
	}
	
	
	
	@Test
	@Rollback(false)
	public void updateDataEmpFamily(){
		
		Family empFamily = (Family)familyService.find(5);
		empFamily.setFirstName("apiva va");
		familyService.update(empFamily);
	}

	
	
	@Test
	@Rollback(false)
	public void deleteDataEmpFamily(){
		
		Family empFamily = (Family)familyService.find(6);
		familyService.delete(empFamily);
	}
	
	

	@Test
	public void findAllDataEmpFamily(){
		
		List<Family> empFamilyList = familyService.findAll();
		Assert.assertEquals(2, empFamilyList.size());
		
		
	}
	
	

	@Test
	public void findDataByIdEmpFamily(){
		
		Family empFamily = (Family)familyService.find(5);	
		int id = empFamily.getId();
		Assert.assertEquals(5,id);
		
		
	}

}
