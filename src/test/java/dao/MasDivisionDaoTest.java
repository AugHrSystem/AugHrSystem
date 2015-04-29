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

import com.aug.hr.dao.MasDivisionDao;
import com.aug.hr.entity.MasDivision;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@Transactional
public class MasDivisionDaoTest {

	@Autowired
	private MasDivisionDao masDivisionDao;

	@Test
	public void create() {

		MasDivision masDivision = new MasDivision();
		masDivision.setName("CEO");
		masDivision.setIsActive(true);
		masDivision.setCode("01");

		masDivisionDao.getCurrentSession().save(masDivision);

	}

	@Test
	public void update() {

		MasDivision masDivision = (MasDivision) masDivisionDao.getCurrentSession().get(
				MasDivision.class, 1);
		masDivision.setName("IT");

		masDivisionDao.getCurrentSession().update(masDivision);
	}

	@Test
	public void Delete() {

		MasDivision masDivision = (MasDivision) masDivisionDao.getCurrentSession().get(
				MasDivision.class, 1);

		masDivisionDao.getCurrentSession().delete(masDivision);
	}

	@SuppressWarnings("unchecked")
	@Test
	public void list() {

		Criteria c = masDivisionDao.getCurrentSession().createCriteria(
				MasDivision.class);
		List<MasDivision> masDivisions = c.list();
		Assert.assertEquals(7, masDivisions.size());

	}
}
