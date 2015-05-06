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

import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;
import com.aug.hr.services.FamilyService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class FamilyServiceTest {
	
	@Autowired
	private FamilyService empFamilyService;
	private Employee emp = new Employee();
	
	
	@Test
	@Rollback(false)
	public void createDataEmpFamily(){
		
		Family empFamily = new Family();
		empFamily.setFirstName("augmentis");
		empFamily.setLastName("admin servicetest");
		empFamily.setMobile("0890851022");
		empFamily.setGender("Female");
		empFamily.setAddress("7/7 m.8 nongsamwong nongsua pathumtani");
		empFamily.setRelation("daughter");
		empFamily.setAge(24);
		Calendar cal = Calendar.getInstance();
		empFamily.setCreatedTimeStamp(cal.getTime());
		empFamily.setCreatedBy(0);
		empFamily.setAuditFlag("C");
		emp.setId(7L);
		empFamily.setEmployee(emp);
		empFamilyService.create(empFamily);
		
		

		Family empFamily1 = new Family();
		empFamily1.setFirstName("apiva kim");
		empFamily1.setLastName("test");
		empFamily1.setMobile("0890851022");
		empFamily1.setGender("Female");
		empFamily1.setAddress("7/7 m.8 nongsamwong nongsua pathumtani");
		empFamily1.setRelation("son");
		empFamily1.setAge(24);
		Calendar cal1 = Calendar.getInstance();
		empFamily1.setCreatedTimeStamp(cal1.getTime());
		empFamily1.setCreatedBy(0);
		empFamily1.setAuditFlag("C");
		emp.setId(7L);
		empFamily1.setEmployee(emp);
		empFamilyService.create(empFamily1);
		
		
	}
	
	
	
	@Test
	@Rollback(false)
	public void updateDataEmpFamily(){
		
		Family empFamily = (Family)empFamilyService.find(5);
		empFamily.setFirstName("apiva va");
		empFamilyService.update(empFamily);
	}

	
	
	@Test
	@Rollback(false)
	public void deleteDataEmpFamily(){
		
		Family empFamily = (Family)empFamilyService.find(6);
		empFamilyService.delete(empFamily);
	}
	
	

	@Test
	public void findAllDataEmpFamily(){
		
		List<Family> empFamilyList = empFamilyService.findAll();
		Assert.assertEquals(2, empFamilyList.size());
		
		
	}
	
	

	@Test
	public void findDataByIdEmpFamily(){
		
		Family empFamily = (Family)empFamilyService.find(5);	
		int id = empFamily.getId();
		Assert.assertEquals(5,id);
		
		
	}

}
