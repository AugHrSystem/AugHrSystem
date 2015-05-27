/**
 *
 * @author natechanok
 * @date May 26, 2015
 */

package dao;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.MasDivision;
import com.aug.hr.entity.dto.AllEmployeeDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@Transactional
public class AllEmployeeDaoTest {
	
	@Autowired
	private EmployeeDao empDao;
	
	@Test
	//@Rollback(false)
	public void create(){
		AllEmployeeDto allemp = new AllEmployeeDto();
		allemp.setEmployeeCode("aaaa");
		allemp.setNameEng("test");
		allemp.setNameThai("test");
		allemp.setEmail("a@hotmail.com");
		allemp.setEmergencyContact("bbbbbbb");
		allemp.setEmergencyContactPhoneNumber("0895555");
		Date dateFrom = new Date("10/09/2014");
		allemp.setDateOfBirth(dateFrom);
		allemp.setTelHome(022222);
		allemp.setTelMobile(02);
		allemp.setTelFax(11);
		allemp.setAge(21);
		allemp.setIdCard(111);
		allemp.setHeight(21);
		allemp.setWeigth(119);
		allemp.setMasDivision(1);
		//allemp.setMasDivision(new Integer(2));
		//MasDivision masDivision = new MasDivision();
		//masDivision.setName("test");
		allemp.setMasLocation(1);
		allemp.setMasJoblevel(1);
		allemp.setMasEmployment(2);
		allemp.setMasStaffType(1);
		allemp.setMasCoreSkill(2);
		allemp.setTechnology(3);
		
		empDao.saveByNameQuery(allemp);
	}

}
