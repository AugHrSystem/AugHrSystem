package services;

import java.util.Calendar;
import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.aug.hr.entity.MasTechnology;
import com.aug.hr.services.masTechnologyService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MasTechnologyServicesTest {
	
	@Autowired
	private masTechnologyService masTechService;
	
	@Test
	@Rollback(false)
	public void createDataMasTechnology(){

		MasTechnology masTech = new MasTechnology();
		masTech.setMasTechnologyName("PHP");
		masTech.setAuditFlag("C");
		masTech.setCode("004A");
		masTech.setCreatedBy(1);
		masTech.setIsActive(true);
		Calendar calendar2 = Calendar.getInstance();
		masTech.setCreatedTimeStamp(calendar2.getTime());
		masTechService.create(masTech);
	}
	
	@Test
	@Rollback(false)
	public void updateDataMasTechnology(){

		MasTechnology masTech = masTechService.find(2);
		masTech.setMasTechnologyName("JAVA");
		masTechService.update(masTech);
		
	}
	
	@Test
	@Rollback(false)
	public void deleteDataMasTechnology(){

		MasTechnology masTech = masTechService.find(4);
		masTechService.delete(masTech);
		
	}
	
	
	@Test
	public void findAllDataMasTechnology(){

		List<MasTechnology> masTech = masTechService.findAll();
		Assert.assertEquals(2, masTech.size());
	}
	
	
	@Test
	public void findDatabyIdMasTechnology(){

		MasTechnology  masTech = masTechService.find(2);
		Assert.assertEquals("JAVA",masTech.getMasTechnologyName());
		
		
	}

}
