package dao;

import java.util.Calendar;
import java.util.List;

import junit.framework.Assert;

import org.hibernate.Criteria;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasTechnologyDao;
import com.aug.hr.entity.MasTechnology;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class MastechnologyDaoTest {
	
	@Autowired
	private MasTechnologyDao masTechnologyDao;
	
	@Test
	@Rollback(false)
	public void createMasTechnology(){
		
		
		MasTechnology masTech = new MasTechnology();
		masTech.setName("java");
		masTech.setAuditFlag("C");
		masTech.setCode("001A");
		masTech.setCreatedBy(1);
		masTech.setIsActive(true);
		Calendar calendar = Calendar.getInstance();
		masTech.setCreatedTimeStamp(calendar.getTime());
		masTechnologyDao.getCurrentSession().save(masTech);
		
		
		
		MasTechnology masTech1 = new MasTechnology();
		masTech1.setName(".NET");
		masTech1.setAuditFlag("C");
		masTech1.setCode("002A");
		masTech1.setCreatedBy(1);
		masTech1.setIsActive(true);
		Calendar calendar1 = Calendar.getInstance();
		masTech1.setCreatedTimeStamp(calendar1.getTime());
		masTechnologyDao.getCurrentSession().save(masTech1);
		
		
		MasTechnology masTech2 = new MasTechnology();
		masTech2.setName("PHP");
		masTech2.setAuditFlag("C");
		masTech2.setCode("003A");
		masTech2.setCreatedBy(1);
		masTech2.setIsActive(true);
		Calendar calendar2 = Calendar.getInstance();
		masTech2.setCreatedTimeStamp(calendar2.getTime());
		masTechnologyDao.getCurrentSession().save(masTech2);
	}
	
	
	@Test
	@Rollback(false)
	public void updateMasTechnology(){
		
		MasTechnology masTech = (MasTechnology) masTechnologyDao.getCurrentSession().get(MasTechnology.class, 1);
		masTech.setName("SAP");
		masTechnologyDao.getCurrentSession().update(masTech);
		
	}
	
	
	@Test
	@Rollback(false)
	public void deleteMasTechnology(){
		
		MasTechnology masTech = (MasTechnology) masTechnologyDao.getCurrentSession().get(MasTechnology.class, 3);
		masTechnologyDao.getCurrentSession().delete(masTech);;
		
	}
	
	
	@Test
	public void listMasTechnology(){
		
		Criteria c = masTechnologyDao.getCurrentSession().createCriteria(MasTechnology.class);
		List<MasTechnology> masTechnologyList = c.list();
		Assert.assertEquals(2, masTechnologyList.size());
		
	}
	
	
	@Test
	public void findByIdMasTechnology(){
		
		MasTechnology masTechnology = (MasTechnology) masTechnologyDao.getCurrentSession().get(MasTechnology.class, 1);		
		int id = masTechnology.getId();
		Assert.assertEquals(1, id);
		
	}
	

}
