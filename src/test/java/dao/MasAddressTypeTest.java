/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasAddressTypeDao;
import com.aug.hr.dao.MasEmploymentDao;
import com.aug.hr.entity.MasAddressType;
import com.aug.hr.entity.MasEmployment;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class MasAddressTypeTest {

	@Autowired
	private MasAddressTypeDao masAddressTypeDao;
	
	@Test
	public void createMasAddressType(){
		
		MasAddressType masAddressType = new MasAddressType();
		masAddressType.setName("Present Address");
		masAddressType.setCode("A01");
		masAddressType.setIsactive("1");
		
		masAddressTypeDao.getCurrentSession().save(masAddressType);
		
	}
	
	@Test
	public void updateMasAddressType(){
		
		MasAddressType masAddressType = (MasAddressType) masAddressTypeDao.getCurrentSession().get(MasAddressType.class, 1);
			masAddressType.setName("Office");
			masAddressTypeDao.getCurrentSession().update(masAddressType);
	}
	
	@Test
	public void deleteMasAddressType(){
		MasAddressType masAddressType = (MasAddressType) masAddressTypeDao.getCurrentSession().get(MasAddressType.class, 2);
		masAddressTypeDao.getCurrentSession().delete(masAddressType);;
	}
	}
