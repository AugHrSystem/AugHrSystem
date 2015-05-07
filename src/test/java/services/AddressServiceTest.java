/**
 *
 * @author natechanok
 * @date Apr 28, 2015
 */

package services;

import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.entity.Address;
import com.aug.hr.entity.Employee;
import com.aug.hr.services.AddressService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class AddressServiceTest {
	
	@Autowired
	private AddressService addressService;
	private Employee emp = new Employee();
	
	@Test
	public void createDataAddress(){
		
	
	Address address = new Address();
	address.setAddress1("2/3 moo.3 sukhumvit rd.");
	address.setAddress2("Bangkok");
	address.setZipcode("10250");
	//emp.setId(3L);
	address.setEmployee(null);
	addressService.create(address);
	
	}
	
	@Test
	public void updateDataAddress(){
		

		/*Address address = (Address)addressService.find(2);
		address.setAddress1("35/0");
		addressService.update(address);*/
		
	}
	
	@Test
	public void deleteDataAddress(){
		

		/*Address address = (Address)addressService.find(2);
		addressService.delete(address);*/

	}
	
	@Test
	public void findAllDataAddress(){
		
		List<Address> addressList = addressService.findAll();
		Assert.assertEquals(2,addressList.size());
	}
	
	@Test
	public void findDataByIdAddress(){
		

		/*Address address = (Address) addressService.find(2);
		int id = address.getId();
		Assert.assertEquals(2, id);*/
	}

}
