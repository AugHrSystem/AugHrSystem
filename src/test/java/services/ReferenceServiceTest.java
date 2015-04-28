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
import org.springframework.transaction.annotation.Transactional;
import com.aug.hr.entity.Reference;
import com.aug.hr.services.ReferenceService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class ReferenceServiceTest {
	
	@Autowired
	private ReferenceService referenceService;
	
	
	
//
//	@Test
//	@Rollback(false)
//	public void createReference(){
//		
//		Reference reference = new Reference();
//		reference.setName("Phicha");
//		reference.setAddress("120/588");
//		reference.setTel("0890851022");
//		reference.setOocupation("SA");
//		
/////		Calendar cal = Calendar.getInstance();
//////		reference.setCreatedTimeStamp(cal.getTime());
//////		reference.setCreatedBy(0);
//////		reference.setAuditFlag("C");
////	
//		referenceService.create(reference);
//	
//	}
	
	
	

//
//	@Test
//	@Rollback(false)
//	public void updateReference(){
//		
//		Reference reference = (Reference)referenceService.find(7);
//		reference.setName("Phiicha");
//		referenceService.update(reference);
//	}

	
	
//	@Test
//	@Rollback(false)
//	public void deleteReference(){
//		
//		Reference reference = (Reference)referenceService.find(7);
//		referenceService.deleteById(reference);
//	}
//	
	

//	@Test
//	public void findAllReference(){
//		
//		List<Reference> references = referenceService.findAll();
//		Assert.assertEquals(18, references.size());
//		
//		
//	}
	
	
//
//	@Test
//	public void findByIdReference(){
//		
//		Reference reference = (Reference)referenceService.find(19);	
//		int id = reference.getId();
//		Assert.assertEquals(19,id);
//		
//		
//	}
	
	
}
