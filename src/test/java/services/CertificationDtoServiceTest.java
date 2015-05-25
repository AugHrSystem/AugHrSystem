/**
 *
 * @author Preeyaporn
 * @date 25 พ.ค. 2558
 */
package services;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import com.aug.hr.dto.services.CertificationDtoService;
import com.aug.hr.entity.dto.CertificationDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class CertificationDtoServiceTest {

	@Autowired private CertificationDtoService certificationDtoService;
	
	@Test	
	public void searchCertification(){
		List<CertificationDto> certificationDto=certificationDtoService.searchCertification(2);
//		int id =abilityDto.getId();
		//Assert.assertEquals(2, id);
		Assert.notEmpty(certificationDto);
	}
	
}
