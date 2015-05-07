package dao;

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
public class TechnologyEmployeeDaoTest {
	
	@Autowired
	private TechnologyEmployeeDao techEmpDao;
	private MasTechnology masTechnology ;
	private Employee emp;
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
		emp = new Employee();
		emp.setId(1);
		emp.setTelMobile(890851022);
		emp.setAge(24);
		emp.setReligion("thai");
		emp.setIdCard(new Integer(11531090));
		emp.setHeight(142);
		emp.setWeigth(32);
		emp.setSex("Female");
		emp.setMaritalStatus("No");
		emp.setMilitaryServiceYes("Yes");
		emp.setOccupation("ITS");
		emp.setEmployeeCode("001");
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
		
		official = new Official();
		official.setEmpOfficial(emp);
		masTechnology.setMasTechnologyId(1);
	}
	
	
	@Test
	@Rollback(false)
	public void insertDataTechnologyEmp(){

		getCurrentSessionEmp().save(emp);
		
		Employee employee = (Employee) getCurrentSessionEmp().get(Employee.class,1L);
		
		
		TechnologyEmployee techEmp = new TechnologyEmployee();
		techEmp.setOfficial(official);
  	    masTechnology.setMasTechnologyId(1);
		techEmp.setMasTech(masTechnology);
		techEmp.setAuditFlag("C");
		techEmp.setCreatedBy(0);
		Calendar cal = Calendar.getInstance();
		techEmp.setCreatedTimeStamp(cal.getTime());
		techEmpDao.getCurrentSession().save(techEmp);
		
	}
	
	
	@Test
	@Rollback(false)
	public void updateDataTechnologyEmp(){
		
		TechnologyEmployee techEmp = (TechnologyEmployee) techEmpDao.getCurrentSession().get(TechnologyEmployee.class, 7);
		masTechnology.setMasTechnologyId(2);
		techEmp.setMasTech(masTechnology);
		techEmpDao.getCurrentSession().update(techEmp);
		
	}
	
	

	@Test
	public void findAllDataTechnologyEmp(){
		
		 Criteria c =  techEmpDao.getCurrentSession().createCriteria(TechnologyEmployee.class);
		 List<TechnologyEmployee> techEmpList = c.list();
		 Assert.assertEquals(1, techEmpList.size());
		
	}
	
	
	@Test
	public void findDataByIdTechnologyEmp(){
		
		TechnologyEmployee technologyEmp =  (TechnologyEmployee) techEmpDao.getCurrentSession().get(TechnologyEmployee.class,7);
		Assert.assertEquals(new Integer(7), technologyEmp.getTechnologyEmpId());
		
	}
	
	
	@Test
	@Rollback(false)
	public void deleteDataTechnologyEmp(){
		
		TechnologyEmployee techEmp = (TechnologyEmployee) techEmpDao.getCurrentSession().get(TechnologyEmployee.class, 7);
		techEmpDao.getCurrentSession().delete(techEmp);
		
	}
	
	
	
	

}
