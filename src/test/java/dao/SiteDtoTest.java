package dao;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.SiteDao;
import com.aug.hr.entity.dto.SiteDto;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class SiteDtoTest {
	
	@Autowired
	private SiteDao siteDao;
	
	@Test
	public void testListSite(){
		//siteDao.listByNameNativeQuery(1);
		Assert.assertEquals(2, siteDao.listByNameNativeQuery(1).size());
	}
	

}
