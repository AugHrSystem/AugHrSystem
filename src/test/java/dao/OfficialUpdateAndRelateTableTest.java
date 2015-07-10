/**
 *
 * @author natechanok
 * @date Jun 10, 2015
 */

package dao;

import java.util.Calendar;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.OfficialDao;
import com.aug.hr.entity.dto.OfficialDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class OfficialUpdateAndRelateTableTest {
	
	@Autowired OfficialDao officialDao;
	
	@Test
	@Rollback(false)
	public void updateOfficial(){
		
		OfficialDto officialDto = new OfficialDto();
		officialDto.setId(1);
		officialDto.setOfficialDate(Calendar.getInstance().getTime());
		officialDto.setStartWorkDate(Calendar.getInstance().getTime());
		officialDto.setEndWorkDate(Calendar.getInstance().getTime());
		officialDto.setPositionAppliedFor("Senior");
		officialDto.setSalaryExpected("50000000");
		officialDto.setProbationDate(Calendar.getInstance().getTime());
		officialDto.setEmployeeId(2);
		officialDao.updateOfficialByNameQuery(officialDto);
	}

}
