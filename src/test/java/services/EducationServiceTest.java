/**
 *
 * @author Preeyaporn
 * @date 27 เม.ย. 2558
 */
package services;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.entity.Education;
import com.aug.hr.services.EducationService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@Transactional
public class EducationServiceTest {

	@Autowired
	private EducationService educationService;

	@Test
	public void create() {

		Education education = new Education();
		education.setUniversity("Silpakorn");
		education.setFaculty("Science");
		education.setGpa(4.00);
		education.setMajor("Com");
		education.setEmployee(null);
		education.setDegreetype(null);

		educationService.create(education);

	}

	@Test
	public void update() {

		Education education = (Education)educationService.findById(1);
		education.setMajor("IT");

		educationService.update(education);
	}

	@Test
	public void Delete() {

		Education education = (Education)educationService.findById(1);

		educationService.delete(education);
	}

	@Test
	public void findAll(){
		
		List<Education> educations = educationService.findAll();
		Assert.assertEquals(1, educations.size());
		
	}
}
