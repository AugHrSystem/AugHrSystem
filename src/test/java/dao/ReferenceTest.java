package dao;

import java.util.Calendar;
import java.util.List;

import junit.framework.Assert;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.ReferenceDao;
import com.aug.hr.entity.EmpFamily;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasTechnology;
import com.aug.hr.entity.Reference;
import com.aug.hr.entity.Specialty;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class ReferenceTest {
	
	@Autowired
	private ReferenceDao referenceDao;
	
	
	
	
//	@Test
//	@Rollback(false)
//	public void createReference(){
//		
//		
//		Reference reference = new Reference();
//		reference.setName("Phicha");
//		reference.setAddress("120/588 manayavill 101/1");
//		reference.setTel("0880981494");
//		reference.setOocupation("system analysis");
////			Calendar cal = Calendar.getInstance();
////			reference.setCreatedTimeStamp(cal.getTime());
////			reference.setCreatedBy(0);
////			reference.setAuditFlag("C");
////			reference.setEmployee(null);
//	
//		referenceDao.getCurrentSession().save(reference);
//		
//	}
	
	
	
	
//	@Test
//	public void updateReference(){
//		
//		Reference reference = (Reference) referenceDao.getCurrentSession().get(Reference.class, 3);
//		reference.setName("Phicha");
//		referenceDao.getCurrentSession().update(reference);
//		
//	}
//		
	
	
	
	   
	
//	@Test
//	@Rollback(false)
//	public void deleteReference(){
//		
//		Reference reference = (Reference) referenceDao.getCurrentSession().get(Reference.class,9);
//		referenceDao.getCurrentSession().delete(reference);
//	}
	
	
	
	

//	@Test
//	public void findAllReference(){
//		
//		Criteria c = referenceDao.getCurrentSession().createCriteria(ReferenceDao.class);
//		List<Reference> references = c.list();
//		Assert.assertEquals(0, references.size());
//		
//		
//	}
	
	

//	@Test
//	public void findByIdReference(){
//		
//		Reference reference = (Reference) referenceDao.getCurrentSession().get(Reference.class,6);	
//		int id = reference.getId();
//		Assert.assertEquals(6,id);
//		
//		
//	}

	
	
	
//	@Test
//	public void listReference(){
//		
//		Criteria c = referenceDao.getCurrentSession().createCriteria(Reference.class);
//		List<Reference> references = c.list();
//		Assert.assertEquals(17, references.size());
//		
//	}
//	
	
	
	
}
