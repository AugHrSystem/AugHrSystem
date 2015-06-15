/**
 *
 * @author natechanok
 * @date May 27, 2015
 */

package dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AddressDao;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.dto.AddressDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@Transactional
public class AddressDaoTest {
	
	@Autowired
	private AddressDao addressDao;
	
	@Test
	@Rollback(false)
	public void createAddress(){
		AddressDto addre = new AddressDto();
		addre.setAddress1("123 m.2");
		addre.setAddress2("Bangkok");
		addre.setZipcode(10235);
		addre.setEmployeeId(1);
		addre.setAddressTypeId(1);
		addre.setMasprovinceId(18);
		
		addressDao.saveAddressByNameQuery(addre);
	}

	
	@Test
	public void findByEmpId(){
	
		List<Address> addressList = addressDao.findAddressByEmployeeId(1);
		System.out.println("size: "+addressList.size());
		for(Address address:addressList){
			System.out.println(address);
		}
		
	}
	
	

	@Test
	public void findAddressbyNameQuery(){
	
		List<AddressDto> addressList = addressDao.searchAddress(5);
		System.out.println("size: "+addressList.size());
		for(AddressDto address:addressList){
			System.out.println(address);
		}
		
	}

}
