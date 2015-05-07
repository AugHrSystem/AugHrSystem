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

import com.aug.hr.dao.EducationDao;
import com.aug.hr.entity.Education;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@Transactional
public class EducationDaoTest {

	@Autowired
	private EducationDao educationDao;

	@Test
	public void create() {

		Education education = new Education();
		education.setUniversity("Silpakorn");
		education.setFaculty("Science");
		education.setGpa(4.00);
		education.setMajor("Com");
		//education.setEmployee(null);
		education.setMasdegreetype(null);

		educationDao.getCurrentSession().save(education);

	}

	@Test
	public void update() {

		Education education = (Education) educationDao.getCurrentSession().get(
				Education.class, 1);
		education.setGpa(3.50);

		educationDao.update(education);
	}

	@Test
	public void Delete() {

		Education education = (Education) educationDao.getCurrentSession().get(
				Education.class, 1);

		educationDao.delete(education);
	}

	@SuppressWarnings("unchecked")
	@Test
	public void list() {

		Criteria c = educationDao.getCurrentSession().createCriteria(
				Education.class);
		List<Education> educations = c.list();
		Assert.assertEquals(1, educations.size());

	}

}
