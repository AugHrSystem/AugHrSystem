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
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.entity.Education;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasDegreetype;
import com.aug.hr.services.MasDegreetypeService;
import com.aug.hr.services.impl.EducationServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@Transactional
public class EducationServiceTest {

	@Autowired
	private EducationServiceImpl educationServiceImpl;

	@Autowired
	private MasDegreetypeService masDegreetypeService;
	
	private MasDegreetype masdegreetype = new MasDegreetype();
	
	private Employee employee = new Employee();
	
	@Test
	public void create() {

		Education education = new Education();
		education.setUniversity("Silpakorn");
		education.setFaculty("Science");
		education.setGpa(4.00);
		education.setMajor("Com");
		masdegreetype = masDegreetypeService.find(1);
		education.setMasdegreetype(masdegreetype);
		education.setCertificate("Java");
		education.setDescription("Java");
		
		employee.setId(2);

		educationServiceImpl.create(education);

	}

	@Test
	public void update() {

		Education education = (Education)educationServiceImpl.findById(1);
		education.setMajor("IT");

		educationServiceImpl.update(education);
	}

	@Test
	public void Delete() {

		Education education = (Education)educationServiceImpl.findById(1);

		educationServiceImpl.delete(education);
	}

	@Test
	public void findAll(){
		
		List<Education> educations = educationServiceImpl.findAll();
		Assert.assertEquals(1, educations.size());
		
	}
}
