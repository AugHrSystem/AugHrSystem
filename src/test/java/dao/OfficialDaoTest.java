package dao;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.dao.OfficialDao;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.AddressDto;
import com.aug.hr.entity.dto.AllEmployeeDto;
import com.aug.hr.entity.dto.OfficialDto;

/**
 *
 * @author natechanok
 * @date May 29, 2015
 */


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@Transactional
public class OfficialDaoTest {

	@Autowired
	private OfficialDao officialDao;
	@Autowired
	private EmployeeDao employeeDao;
	
	@Test
	@Rollback(false)
	public void createOfficial(){
		OfficialDto offi = new OfficialDto();
		//Date dateOffi = new Date("12/05/2015");
		Calendar cal = Calendar.getInstance();
		offi.setStartDate(cal.getTime());
		offi.setPositionAppliedFor("Developer");
		offi.setSalaryExpected(20000.00);
		offi.setEmployeeId(1);
		
		officialDao.saveOfficialByNameQuery(offi);
	}
	
	@Test
	//@Rollback(false)
	public void searchEmpIdToOfficial(){
		
		Official offi = officialDao.searhEmpIdtoOfficial();
		System.out.println(offi.getId());
		AllEmployeeDto allEmp=new AllEmployeeDto();
		allEmp.setStartDate(offi.getStartDate());
		allEmp.setPositionAppliedFor(offi.getPositionAppliedFor());
		allEmp.setSalaryExpected(offi.getSalaryExpected());
		//allEmp.setOfficialId(offi.getOfficialId());
		
		employeeDao.searhEmpIdtoAddress();
		for(AddressDto address:allEmp.getAddressList()){
			
		}
		
	}
}
