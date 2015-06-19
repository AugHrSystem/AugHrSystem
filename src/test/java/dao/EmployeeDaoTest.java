/**
 *
 * @author Preeyaporn
 * @date 28 เม.ย. 2558
 */
package dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@Transactional
public class EmployeeDaoTest {

	@Autowired
	private EmployeeDao employeeDao;

	@Test
	public void create() {

		Employee employee = new Employee();
		employee.setName("Name");

		/*employee.setTel("1234567890");
		employee.setSalary(3000F);
		employee.setAge(12);
		employee.setReligion("eiei");
		employee.setPlaceOfBirth("eiei");
		employee.setIdCard(1234567890);
		employee.setHeight(180);
		employee.setWeigth(90);
		employee.setGender("F");
		employee.setStatus("eiei");
		employee.setMilitary("eiei");
		employee.setQualification("eiei");
		employee.setCode("01");
		employee.setEmployment(null);
		employee.setDivision(null);
		employee.setJoblevel(null);
		employee.setTechnology(null);*/

		String dateString = "06/27/2007";
		DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
		try {
			Date dateDob = df.parse(dateString);
			//employee.setDob(dateDob);

		} catch (ParseException e) {
		
			e.printStackTrace();
		}
		
		employeeDao.getCurrentSession().save(employee);

	}

	@Test
	public void update() {

		Employee employee = (Employee) employeeDao.getCurrentSession().get(Employee.class, 2);
		employee.setName("Name3");

		employeeDao.update(employee);
	}

	/*@Test
	public void Delete() {

		Employee employee = (Employee) employeeDao.getCurrentSession().get(
				Employee.class, 1);

		employeeDao.delete(employee);
	}

	@SuppressWarnings("unchecked")
	@Test
	public void list() {

		Criteria c = employeeDao.getCurrentSession().createCriteria(
				Employee.class);
		List<Employee> employees = c.list();
		Assert.assertEquals(1, employees.size());

	}*/
	
	
	@Test
	public void find() {
		
		Employee employee = employeeDao.find(1);
		Hibernate.initialize(employee.getOfficial());
		System.out.println(employee.getOfficial().getId());
		
	}
	
	
	@Test
	@Rollback(false)
	public void deleteByHibernate(){
		
		Employee employee = employeeDao.find(1);
		employeeDao.delete(employee);
		
	}
	
	
	
	@Test
	public void findAimByEmployee(){
		List<Employee> employee = employeeDao.findAimRelateWithEmployee(4);
		for(Employee emp:employee){
			System.out.println(emp.getId());
		}
	}
}
