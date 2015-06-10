package dao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AddressDao;
import com.aug.hr.entity.dto.AddressDto;

/**
 *
 * @author natechanok
 * @date Jun 10, 2015
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class AddressUpdateAndRelateTableTest {
	
	@Autowired
	private AddressDao addressDao;
	
	@Test
	@Rollback(false)
	public void updateAddress(){
		
		AddressDto addressDto = new AddressDto();
		addressDto.setAddress1("aa");
		addressDto.setAddress2("bb");
		addressDto.setZipcode(10230);
		addressDto.setEmployeeId(2);
		addressDto.setAddressTypeId(1);
		addressDto.setMasprovinceId(15);
		addressDto.setId(1);
		//ddressDto.setEmployeeId(1);
		addressDao.updateAddressByNameQuery(addressDto);
		
	}
	

}
