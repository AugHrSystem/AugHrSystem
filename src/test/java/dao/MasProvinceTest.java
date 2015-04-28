/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
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

import com.aug.hr.dao.MasProvinceDao;
import com.aug.hr.entity.MasDegreetype;
import com.aug.hr.entity.MasProvince;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class MasProvinceTest {
	
	@Autowired
	private MasProvinceDao masProvinceDao;
	
	@Test
	public void createMasProvincew(){
		
		MasProvince masProvince=new MasProvince();
		masProvince.setName("bangkok");
		masProvince.setCode("P01");
		masProvince.setIsActive(true);
		masProvinceDao.getCurrentSession().save(masProvince);
		
		MasProvince masProvince1=new MasProvince();
		masProvince1.setName("chaingmai");
		masProvince1.setCode("P02");
		masProvince1.setIsActive(true);
		masProvinceDao.getCurrentSession().save(masProvince);
		
		MasProvince masProvince2=new MasProvince();
		masProvince1.setName("nan");
		masProvince1.setCode("P03");
		masProvince1.setIsActive(true);
		masProvinceDao.getCurrentSession().save(masProvince);
	}

	
	@Test
	public void updateMasProvince(){
		
		MasProvince masProvince=(MasProvince)masProvinceDao.getCurrentSession().get(MasProvince.class,1);
		masProvince.setName("Master2");
		masProvinceDao.getCurrentSession().update(masProvince);
		
		
	}
	
	@Test
	public void deleteMasProvince(){
		
		MasProvince masProvince = (MasProvince) masProvinceDao.getCurrentSession().get(MasProvince.class,1);
		masProvinceDao.getCurrentSession().delete(masProvince);
	}
	
	
	
	@Test
	public void listMasProvince(){
		
		Criteria c = masProvinceDao.getCurrentSession().createCriteria(MasProvince.class);
		List<MasProvince> masProvinceList = c.list();
		Assert.assertEquals(77, masProvinceList.size());
		
	}
	
	@Test
public void findByIdMasProvince(){
		
		MasProvince  masProvince = (MasProvince) masProvinceDao.getCurrentSession().get(MasProvince.class, 1);		
		int id = masProvince.getId();
		Assert.assertEquals(1, id);
		
	}
	
	
	
}
