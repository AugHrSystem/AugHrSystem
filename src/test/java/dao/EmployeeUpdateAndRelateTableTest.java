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

import com.aug.hr.dao.AddressDao;
import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.dao.OfficialDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.dto.AllEmployeeDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@Transactional
public class EmployeeUpdateAndRelateTableTest {

	@Autowired
	private EmployeeDao empDao;
	@Autowired
	private AddressDao addressDao;
	@Autowired
	private OfficialDao officialDao;

	/*@Test
	@Rollback(false)
	public void updateEmployee() {

		AllEmployeeDto allEmployeeDto = new AllEmployeeDto();
		allEmployeeDto.setId(2);
		allEmployeeDto.setEmployeeCode("TH00910");
		allEmployeeDto.setNameThai("test");
		allEmployeeDto.setSurnameThai("aaaa");

		allEmployeeDto.setNicknameThai("a");
		allEmployeeDto.setNameEng("bb");
		allEmployeeDto.setSurnameEng("bb");

		allEmployeeDto.setNicknameEng("vv");
		allEmployeeDto.setEmail("a@gmail.com");
		allEmployeeDto.setTelHome(02335555);

		allEmployeeDto.setTelMobile(282552);
		allEmployeeDto.setTelFax(02333);
		allEmployeeDto.setCongenitalDisease("aa");

		allEmployeeDto.setHospital("ooo");
		allEmployeeDto.setEmergencyContact("fff");
		allEmployeeDto.setRelationshipWithEmergencyContact("aaa");

		allEmployeeDto.setEmergencyContactAddress("ddd");
		allEmployeeDto.setEmergencyContactPhoneNumber("023333");
		allEmployeeDto.setDateOfBirth(Calendar.getInstance().getTime());

		allEmployeeDto.setPlaceOfBirth("jjjj");
		allEmployeeDto.setAge(35);
		allEmployeeDto.setReligion("ttt");

		allEmployeeDto.setIdCard(12000);
		allEmployeeDto.setIssuedOffice("ggg");
		allEmployeeDto.setExpiryDate(Calendar.getInstance().getTime());

		allEmployeeDto.setHeight(200);
		allEmployeeDto.setWeigth(60);
		allEmployeeDto.setSex("female");

		allEmployeeDto.setMaritalStatus("Single");
		allEmployeeDto.setNumberOfChildren("3");
		allEmployeeDto.setSpouseName("fff");

		allEmployeeDto.setMarriageCertificateNo("2");
		allEmployeeDto.setIssuedOffice2("aa");
		allEmployeeDto.setAddress("eee");

		allEmployeeDto.setOccupation("jjj");
		allEmployeeDto.setKnowAugNewspaper("dddd");
		allEmployeeDto.setDescriptionNewspaper("aaaa");

		allEmployeeDto.setKnowAugMagazine("uuuu");
		allEmployeeDto.setDescriptionMagazine("ppp");
		allEmployeeDto.setKnowAugWebsite("rrrr");

		allEmployeeDto.setDescriptionWebsite("dddd");
		allEmployeeDto.setKnowAugFriend("www");
		allEmployeeDto.setDescriptionFriend("000");

		allEmployeeDto.setKnowAugOther("jjj");
		allEmployeeDto.setDescriptionOther("jjj");
		allEmployeeDto.setKnowEmployedYes("jj");

		allEmployeeDto.setDescriptionYes("jjj");
		allEmployeeDto.setKnowEmployerNo("hh");
		allEmployeeDto.setMilitaryServiceYes("fff");

		allEmployeeDto.setFromYear(Calendar.getInstance().getTime());
		allEmployeeDto.setToYear(Calendar.getInstance().getTime());
		allEmployeeDto.setBranchOfService("jj");

		allEmployeeDto.setServiceNo("ss");
		allEmployeeDto.setMilitaryServiceNo("2");
		allEmployeeDto.setReasonsNo("aaa");

		allEmployeeDto.setDateToBeDrafted(Calendar.getInstance().getTime());
		allEmployeeDto.setPreviousEmployerYes("vvv");
		allEmployeeDto.setPreviousEmployerNo("bb");

		allEmployeeDto.setPreviousEmpreasonsNo("jj");
		allEmployeeDto.setImage("jjj.jpg");
		allEmployeeDto.setStatusemp("ss");

		allEmployeeDto.setMasDivision(1);
		allEmployeeDto.setMasDivision(2);
		allEmployeeDto.setMasEmployment(1);
		allEmployeeDto.setTechnology(1);
		allEmployeeDto.setMasCoreSkill(2);
		allEmployeeDto.setMasStaffType(1);
		allEmployeeDto.setMasLocationId(1);
		allEmployeeDto.setOfficialId(1);
		allEmployeeDto.setIsManager(1);
		allEmployeeDto.setAimempid(1);

		empDao.updateByNameQuery(allEmployeeDto);

	}*/

	@Test
	public void  showData(){
		Employee emp = empDao.find(6);
		System.out.println(emp.getAddresses().get(0).getAddressType().getId());
	}
}
