/**
 *
 * @author Pranrajit
 * @date 21 พ.ค. 2558
 */
package services;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import com.aug.hr.dto.services.EducationDtoService;
import com.aug.hr.entity.dto.EducationDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})

public class EducationDtoServiceTest {

	@Autowired private EducationDtoService educationDtoService;
	
	@Test	
	public void searchEducation(){
		List<EducationDto> educationDto=educationDtoService.searchEducation(2);
//		int id =abilityDto.getId();
		//Assert.assertEquals(2, id);
		Assert.notEmpty(educationDto);
	}
	
}
