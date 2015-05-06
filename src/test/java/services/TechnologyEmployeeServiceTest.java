package services;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import junit.framework.Assert;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.TechnologyEmployeeDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasTechnology;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.TechnologyEmployee;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class TechnologyEmployeeServiceTest {
	
	
	@Autowired
	private TechnologyEmployeeDao techEmpDao;
	private MasTechnology masTechnology ;
	private Official official;
	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	public Session getCurrentSessionEmp() {
		return sessionFactory.getCurrentSession();
	}


	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	@Before
	public void Setup(){
		masTechnology = new MasTechnology();
		official = new Official();
		official.setId(1);
		official.setSalaryExpected(20000D);
		official.setPositionAppliedFor("Deverloper");
		
		Employee emp = new Employee();
		emp.setId(1);
		emp.setTelMobile(890851022);
		emp.setAge(24);
		emp.setReligion("thai");
		emp.setIdCard(new Integer(11531090));
		emp.setHeight(142);
		emp.setWeigth(32);
		emp.setSex("Female");
		emp.setMilitaryServiceNo("no");
		emp.setPlaceOfBirth("BKK");
		String dateString = "06/27/2007";
		DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
		try {
			Date dateDob = df.parse(dateString);
			emp.setDateOfBirth(dateDob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		official.setEmpOfficial(emp);
		
		
		
	    
		masTechnology.setMasTechnologyId(1);
	}
	
	
	@Test
	@Rollback(false)
	public void createDataTechnologyEmp(){

		getCurrentSessionEmp().save(official);
		
		Official official = (Official) getCurrentSessionEmp().get(Official.class,1);
		
		
		TechnologyEmployee techEmp = new TechnologyEmployee();
		techEmp.setOfficial(official);
  	    masTechnology.setMasTechnologyId(1);
		techEmp.setMasTech(masTechnology);
		techEmp.setAuditFlag("C");
		techEmp.setCreatedBy(0);
		Calendar cal = Calendar.getInstance();
		techEmp.setCreatedTimeStamp(cal.getTime());
		techEmpDao.create(techEmp);
		
	}
	
	
	@Test
	@Rollback(false)
	public void updateDataTechnologyEmp(){
		
		TechnologyEmployee techEmp = (TechnologyEmployee) techEmpDao.getCurrentSession().get(TechnologyEmployee.class, 8);
		masTechnology.setMasTechnologyId(2);
		techEmp.setMasTech(masTechnology);
		techEmpDao.update(techEmp);
		
	}
	
	

	@Test
	public void findAllDataTechnologyEmp(){
		
		 List<TechnologyEmployee> techEmpList = techEmpDao.findAll();
		 Assert.assertEquals(1, techEmpList.size());
		
	}
	
	
	@Test
	public void findDataByIdTechnologyEmp(){
		
		TechnologyEmployee technologyEmp =  (TechnologyEmployee) techEmpDao.find(8);
		Assert.assertEquals(new Integer(8), technologyEmp.getTechnologyEmpId());
		
	}
	
	@Test
	@Rollback(false)
	public void deleteDataTechnologyEmp(){
		
		TechnologyEmployee techEmp = (TechnologyEmployee) techEmpDao.find(8);
		techEmpDao.delete(techEmp);
		
	}
	

}
