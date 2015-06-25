/**
 *
 * @author Pranrajit
 * @date 25 มิ.ย. 2558
 */
package dao;

import java.util.List;







import org.junit.Assert;
import org.hibernate.Criteria;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.LeaveDao;
import com.aug.hr.entity.Leave;
import com.aug.hr.services.LeaveService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@Transactional
public class LeaveDaoTest {
	
	@Autowired LeaveDao leaveDao;

	@Autowired LeaveService leaveService;


	@Test
	public void teaa(){
	List<Leave>	typeSum=leaveService.findLeaveType(1,4);
	for(Leave leave:typeSum)
	{
		
	System.out.println(leave.getMasleavetype().getId());
	}
	}
}
