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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.aug.hr.dto.services.LeaveDtoService;
import com.aug.hr.entity.dto.LeaveDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class LeaveDtoServiceTest {

@Autowired private LeaveDtoService leaveDtoService;
	
	@Test	
	public void searchLeave(){
		List<LeaveDto> leaveDto=leaveDtoService.searchLeave(2);
			
		Assert.notEmpty(leaveDto);
	}
	
}
