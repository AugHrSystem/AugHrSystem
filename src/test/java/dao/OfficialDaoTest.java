package dao;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AddressDao;
import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.dao.MasAddressTypeDao;
import com.aug.hr.dao.MasProvinceDao;
import com.aug.hr.dao.OfficialDao;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasAddressType;
import com.aug.hr.entity.MasDivision;
import com.aug.hr.entity.MasProvince;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.AddressDto;
import com.aug.hr.entity.dto.AllEmployeeDto;
import com.aug.hr.entity.dto.EmployeeDto;
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
	@Autowired
	private MasAddressTypeDao masAddressTypeDao;
	@Autowired
	private MasProvinceDao masProviceDao;
	@Autowired
	private AddressDao addressDao;
	
	@Test
	@Rollback(false)
	public void createOfficial(){
		OfficialDto offi = new OfficialDto();
		//Date dateOffi = new Date("12/05/2015");
		Calendar cal = Calendar.getInstance();
		offi.setOfficialDate(cal.getTime());
		offi.setStartWorkDate(cal.getTime());
		offi.setEndWorkDate(cal.getTime());
		offi.setPositionAppliedFor("Developer");
		offi.setSalaryExpected(20000.00);
		offi.setProbationDate(cal.getTime());
		//offi.setEmployeeId(1);
		
		officialDao.saveOfficialByNameQuery(offi);
	}
	
	@Test
	@Rollback(false)
	public void searchEmpIdToOfficial(){
		
	
		//System.out.println(offi.getId());
		
		
		AllEmployeeDto allEmp = new AllEmployeeDto();
		allEmp.setOfficialDate(Calendar.getInstance().getTime());
		allEmp.setStartWorkDate(Calendar.getInstance().getTime());
		allEmp.setEndWorkDate(Calendar.getInstance().getTime());
		allEmp.setPositionAppliedFor("testtt");
		allEmp.setSalaryExpected(1240D);
		allEmp.setProbationDate(Calendar.getInstance().getTime());
		OfficialDto officialDto = new OfficialDto();
		//Date dateOffi = new Date("12/05/2015");
		Calendar cal = Calendar.getInstance();
		officialDto.setOfficialDate(allEmp.getOfficialDate());
		officialDto.setStartWorkDate(allEmp.getStartWorkDate());
		officialDto.setEndWorkDate(allEmp.getEndWorkDate());
		officialDto.setPositionAppliedFor(allEmp.getPositionAppliedFor());
		officialDto.setSalaryExpected(allEmp.getSalaryExpected());
		officialDto.setProbationDate(allEmp.getProbationDate());
	
		officialDao.saveOfficialByNameQuery(officialDto);		
		
		Official official1 = officialDao.searhEmpIdtoOfficial();
		System.out.println(official1.getId());
		
		allEmp.setEmployeeCode("aaaa");
		allEmp.setNameEng("test");
		allEmp.setNameThai("test");
		allEmp.setEmail("a@hotmail.com");
		allEmp.setEmergencyContact("bbbbbbb");
		allEmp.setEmergencyContactPhoneNumber("0895555");
		allEmp.setDateOfBirth(Calendar.getInstance().getTime());
		allEmp.setTelHome(022222);
		allEmp.setTelMobile(02);
		allEmp.setTelFax(11);
		allEmp.setAge(21);
		allEmp.setIdCard(111);
		allEmp.setHeight(21);
		allEmp.setWeigth(119);
		allEmp.setMasLocation("1");
		allEmp.setMasJoblevel(1);
		allEmp.setMasEmployment(2);
		allEmp.setMasStaffType(1);
		allEmp.setMasCoreSkill(2);
		allEmp.setTechnology(3);
		
		
		allEmp.setMasDivision(new Integer(2));
		

		allEmp.setOfficialId(official1.getId());
		
		
		
		
		
		employeeDao.saveByNameQuery(allEmp);
		
		
		
		
		Employee emp = employeeDao.searhEmpIdtoAddress();
		
		
		AddressDto addressDtoSaveList = new AddressDto();
		addressDtoSaveList.setAddress1("aaaa");
		addressDtoSaveList.setAddress2("sss");
		addressDtoSaveList.setAddressTypeId(1);
		addressDtoSaveList.setMasprovinceId(1);
		addressDtoSaveList.setZipcode(1243);
		addressDtoSaveList.setEmployeeId(emp.getId());		
		
		List<AddressDto> addreessDtoList = new ArrayList<AddressDto>();
		addreessDtoList.add(addressDtoSaveList);
		
		allEmp.setAddressList(addreessDtoList);
		
	
		for(AddressDto addressDto:allEmp.getAddressList()){
			Address address = new Address();
			address.setAddress1(addressDto.getAddress1());
			address.setAddress2(addressDto.getAddress2());
			address.setZipcode(addressDto.getZipcode());
			MasAddressType masAddressType = new MasAddressType();
			masAddressType = masAddressTypeDao.find(addressDto.getAddressTypeId());
			address.setAddressType(masAddressType);
			MasProvince provice = new MasProvince();
			provice = masProviceDao.find(addressDto.getMasprovinceId());
			address.setProvince(provice);
			addressDao.saveAddressByNameQuery(addressDto);
			
		}
		
	}
}
