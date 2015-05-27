package services;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dto.services.SiteDtoService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class SiteDtoServiceTest {
	
	@Autowired 
	private SiteDtoService siteDtoService;
	
	
	@SuppressWarnings("deprecation")
	@Test
	public void testListSite(){
		Assert.assertEquals(2, siteDtoService.listByNameNativeQuery(1).size());
	}
	

}
