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

import com.aug.hr.entity.EmpFamily;
import com.aug.hr.entity.Employee;
import com.aug.hr.services.EmpFamilyService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class EmpFamilyServiceTest {
	
	@Autowired
	private EmpFamilyService empFamilyService;
	private Employee emp = new Employee();
	
	
	@Test
	@Rollback(false)
	public void createDataEmpFamily(){
		
		EmpFamily empFamily = new EmpFamily();
		empFamily.setEmpFamilyFirstName("augmentis");
		empFamily.setEmpFamilyLastName("admin servicetest");
		empFamily.setEmpFamilyMobile("0890851022");
		empFamily.setEmpFamilyGender("Female");
		empFamily.setEmpFamilyAddress("7/7 m.8 nongsamwong nongsua pathumtani");
		empFamily.setEmpFamilyRelation("daughter");
		empFamily.setEmpFamilyAge(24);
		Calendar cal = Calendar.getInstance();
		empFamily.setCreatedTimeStamp(cal.getTime());
		empFamily.setCreatedBy(0);
		empFamily.setAuditFlag("C");
		emp.setId(1L);
		empFamily.setEmployee(emp);
		empFamilyService.create(empFamily);
		
		

		EmpFamily empFamily1 = new EmpFamily();
		empFamily1.setEmpFamilyFirstName("apiva kim");
		empFamily1.setEmpFamilyLastName("test");
		empFamily1.setEmpFamilyMobile("0890851022");
		empFamily1.setEmpFamilyGender("Female");
		empFamily1.setEmpFamilyAddress("7/7 m.8 nongsamwong nongsua pathumtani");
		empFamily1.setEmpFamilyRelation("son");
		empFamily1.setEmpFamilyAge(24);
		Calendar cal1 = Calendar.getInstance();
		empFamily1.setCreatedTimeStamp(cal1.getTime());
		empFamily1.setCreatedBy(0);
		empFamily1.setAuditFlag("C");
		emp.setId(2L);
		empFamily1.setEmployee(emp);
		empFamilyService.create(empFamily1);
		
		
	}
	
	
	
	@Test
	@Rollback(false)
	public void updateDataEmpFamily(){
		
		EmpFamily empFamily = (EmpFamily)empFamilyService.find(5);
		empFamily.setEmpFamilyFirstName("apiva va");
		empFamilyService.update(empFamily);
	}

	
	
	@Test
	@Rollback(false)
	public void deleteDataEmpFamily(){
		
		EmpFamily empFamily = (EmpFamily)empFamilyService.find(6);
		empFamilyService.delete(empFamily);
	}
	
	

	@Test
	public void findAllDataEmpFamily(){
		
		List<EmpFamily> empFamilyList = empFamilyService.findAll();
		Assert.assertEquals(2, empFamilyList.size());
		
		
	}
	
	

	@Test
	public void findDataByIdEmpFamily(){
		
		EmpFamily empFamily = (EmpFamily)empFamilyService.find(5);	
		int id = empFamily.getEmpFamilyId();
		Assert.assertEquals(5,id);
		
		
	}

}
