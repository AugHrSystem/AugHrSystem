package dao;

import java.util.Calendar;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.dao.HealthDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Health;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class HealthDaoTest {
	
	
	@Autowired
	private HealthDao healthDao;
	@Autowired
	private EmployeeDao employeeDao;
	
	
	@Test
	@Rollback(false)
	//@Ignore
	public void create(){
		
		Employee employee = new Employee();
		employee = employeeDao.find(new Integer(1));
		
		Employee employee2 = new Employee();
		employee2 = employeeDao.find(new Integer(2));
		
		Health health = new Health();
		health.setCongenitalDisease("Yes");
		health.setCongenitalDiseaseExplain("Asthma");
		health.setCongenitalDiseaseExplain2("Heart Disease");
		health.setCongenitalDiseaseExplain3("Hypertension");
		health.setGeneticDisease("Yes");
		health.setGeneticDiseaseExplain("Asthma");
		health.setGeneticDiseaseExplain2("Heart Disease");
		health.setGeneticDiseaseExplain3("Hypertension");
		health.setTakeMedicine("Yes");
		health.setTakeMedicineExplain("parasettamon");
		health.setIntolerance("Yes");
		health.setIntoleranceExplain("rama");
		health.setEmployee(employee);
		health.setAuditFlag("C");
		health.setCreatedBy(employee.getId());
		health.setCreatedTimeStamp(Calendar.getInstance().getTime());
		
		healthDao.create(health);
		
		Health health1 = new Health();
		health1.setCongenitalDisease("Yes");
		health1.setCongenitalDiseaseExplain("Asthma");
		health1.setGeneticDisease("Yes");
		health1.setGeneticDiseaseExplain("Asthma");
		health1.setGeneticDiseaseExplain2("Heart Disease");
		health1.setGeneticDiseaseExplain3("Hypertension");
		health1.setTakeMedicine("Yes");
		health1.setTakeMedicineExplain("parasettamon");
		health1.setIntolerance("Yes");
		health1.setIntoleranceExplain("rama");
		health1.setEmployee(employee2);
		health1.setAuditFlag("C");
		health1.setCreatedBy(employee2.getId());
		health1.setCreatedTimeStamp(Calendar.getInstance().getTime());
		
		healthDao.create(health1);
	
	}
	
	
	@Test
	@Rollback(false)
	public void update(){

		Health health = new Health();
		health = healthDao.find(4);
		health.setCongenitalDiseaseExplain("Hypertension");
		health.setUpdatedBy(health.getEmployee().getId());
		health.setUpdatedTimeStamp(Calendar.getInstance().getTime());
		health.setAuditFlag("U");
		healthDao.update(health);
	}
	
	

	@Test
	@Rollback(false)
	public void delete(){
		
		Health health = new Health();
		health = healthDao.find(4);
		healthDao.delete(health);
	}

}
