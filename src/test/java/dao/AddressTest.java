/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package dao;

import java.util.List;

import junit.framework.Assert;

import org.hibernate.Criteria;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AddressDao;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class AddressTest {
	
	@Autowired
	private AddressDao addressDao;
	private Employee emp = new Employee();
	
	@Test
	public void insertDataAddress(){
		
		Address address = new Address();
		address.setAddress1("200 moo.3 sukhumvit rd.");
		address.setAddress2("Bangkok");
		address.setZipcode("10270");
		//emp.setId(2L);
		address.setEmployee(emp);
		addressDao.getCurrentSession().save(address);
	}

	@Test
	public void updateDataAddress(){
		
		Address address = (Address) addressDao.getCurrentSession().get(Address.class, 1);
		address.setAddress1("350 moo.4 jatujak rd.");
		addressDao.update(address);
		
	}
	
	@Test
	public void deleteDataAddress(){
		
		Address address = (Address) addressDao.getCurrentSession().get(Address.class, 1);
		addressDao.delete(address);
	}

	@Test
	public void findAllDataAddress(){
		
		Criteria cri = addressDao.getCurrentSession().createCriteria(Address.class);
		List<Address> addressesList = cri.list();
		Assert.assertEquals(1, addressesList.size());
	}
	
	@Test
	public void findDataByIdAddress(){
		
		Address address = (Address) addressDao.getCurrentSession().get(Address.class, 2);
		int id = address.getId();
		Assert.assertEquals(2, id);
	}
	
	}

	
