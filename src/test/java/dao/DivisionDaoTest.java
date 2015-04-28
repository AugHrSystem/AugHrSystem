/**
 *
 * @author Preeyaporn
 * @date 27 เม.ย. 2558
 */
package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.DivisionDao;
import com.aug.hr.entity.Division;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@Transactional
public class DivisionDaoTest {

	@Autowired
	private DivisionDao divisionDao;

	@Test
	public void create() {

		Division division = new Division();
		division.setName("CEO");
		division.setIsActive(true);
		division.setCode("01");

		divisionDao.getCurrentSession().save(division);

	}

	@Test
	public void update() {

		Division division = (Division) divisionDao.getCurrentSession().get(
				Division.class, 1);
		division.setName("IT");

		divisionDao.getCurrentSession().update(division);
	}

	@Test
	public void Delete() {

		Division division = (Division) divisionDao.getCurrentSession().get(
				Division.class, 1);

		divisionDao.getCurrentSession().delete(division);
	}

	@SuppressWarnings("unchecked")
	@Test
	public void list() {

		Criteria c = divisionDao.getCurrentSession().createCriteria(
				Division.class);
		List<Division> divisions = c.list();
		Assert.assertEquals(7, divisions.size());

	}
}
