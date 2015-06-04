/**
 *
 * @author Preeyaporn
 * @date 4 มิ.ย. 2558
 */
package services;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import com.aug.hr.dto.services.AllowancesDtoService;
import com.aug.hr.entity.dto.AllowancesDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})

public class AllowancesDtoServiceTest {

	@Autowired private AllowancesDtoService allowancesDtoService;
	
	@Test
	public void searchAllowances(){
		List<AllowancesDto> allowancesDto = allowancesDtoService.searchAllowances(2);
		
		Assert.notEmpty(allowancesDto);
	}
}
