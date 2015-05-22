package services;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.aug.hr.dto.services.ReferenceDtoService;
import com.aug.hr.entity.dto.ReferenceDto;
import org.springframework.util.Assert;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class ReferenceDtoServiceTest {
	
	
	@Autowired 
	private ReferenceDtoService referenceDtoService;
	
	@Test
	public void searchReference(){
		List<ReferenceDto> referenceDtos = referenceDtoService.searchReference(2);
		
		Assert.notEmpty(referenceDtos);
		
	}

}
