package dao;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.HealthDao;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class HealthDtoTest {
	
	@Autowired
	private HealthDao healthDao;
	
	@Test
	public void testListSite(){
		//siteDao.listByNameNativeQuery(1);
		Assert.assertEquals(1, healthDao.listHealth(1).size());		
		System.out.println("health: "+healthDao.listHealth(1));
	}
	

}
