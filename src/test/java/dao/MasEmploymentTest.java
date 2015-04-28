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

import com.aug.hr.dao.MasEmploymentDao;
import com.aug.hr.entity.MasEmployment;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class MasEmploymentTest {
	
	@Autowired
	private MasEmploymentDao masEmploymentDao;
	
	@Test
	public void createMasEmployment(){
		
		MasEmployment masEmployment = new MasEmployment();
		masEmployment.setName("Permanent");
		masEmployment.setCode("A01");
		masEmployment.setIsActive(true);
		
		
//		MasEmployment masEmployment1 = new MasEmployment();
//		masEmployment1.setName("Contract");
//		masEmployment1.setCode("A02");
//		masEmployment1.setIsActive(true);
		masEmploymentDao.getCurrentSession().save(masEmployment);
		
	}
	
	@Test
	public void updateMasEmployment(){
		
		MasEmployment masEmployment = (MasEmployment) masEmploymentDao.getCurrentSession().get(MasEmployment.class, 1);
			masEmployment.setName("Office");
			masEmploymentDao.getCurrentSession().update(masEmployment);
	}
	
	@Test
	public void deleteMasEmployment(){
		MasEmployment masEmployment = (MasEmployment) masEmploymentDao.getCurrentSession().get(MasEmployment.class, 2);
		masEmploymentDao.getCurrentSession().delete(masEmployment);;
	}
	
	/*@Test
	public void listMasEmployment(){
		Criteria cri= masEmploymentDao.getCurrentSession().createCriteria(MasEmployment.class);
		List<MasEmployment> masEmploymentList = cri.list();
		Assert.assertEquals(1, masEmploymentList.size());
	}
	
	@Test
	public void findByIdMasEmployment(){
		
		MasEmployment masEmployment = (MasEmployment) masEmploymentDao.getCurrentSession().get(MasEmployment.class, 1);		
		int id = masEmployment.getId();
		Assert.assertEquals(1, id);
		
	}*/
}
