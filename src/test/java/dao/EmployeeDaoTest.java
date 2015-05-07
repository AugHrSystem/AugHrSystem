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
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
		employee.setTelMobile(1234567890);
		employee.setAge(12);
		employee.setReligion("eiei");
		employee.setPlaceOfBirth("eiei");
		employee.setIdCard(1234567890);
		employee.setHeight(180);
		employee.setWeigth(90);
		employee.setSex("F");
		employee.setMaritalStatus("eiei");
		employee.setMilitaryServiceYes("eiei");
		employee.setOccupation("eiei");
		employee.setEmployeeCode("01");


		String dateString = "06/27/2007";
		DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
		try {
			Date dateDob = df.parse(dateString);
			employee.setDateOfBirth(dateDob);
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
}
