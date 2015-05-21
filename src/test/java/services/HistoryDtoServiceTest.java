/**
 *
 * @author Preeyaporn
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

import com.aug.hr.dto.services.HistoryDtoService;
import com.aug.hr.entity.dto.HistoryDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class HistoryDtoServiceTest {

	@Autowired
	private HistoryDtoService historyDtoService;
	
	@Test
	public void searchHistory(){
		
		List<HistoryDto> historyDtos= historyDtoService.searchHistory(2);
		
		Assert.notEmpty(historyDtos);
	}
	
	
}
