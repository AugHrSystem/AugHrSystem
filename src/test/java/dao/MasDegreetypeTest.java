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
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasDegreetypeDao;
import com.aug.hr.entity.MasDegreetype;
import com.aug.hr.entity.MasTechnology;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class MasDegreetypeTest {
	
	@Autowired
	private MasDegreetypeDao masDegreetypeDao;
	
	@Test
	public void createMasDegree(){
		
		MasDegreetype masDegree= new MasDegreetype();
		masDegree.setName("bachelor");
		masDegree.setCode("01");
		masDegree.setIsactive("1");
		masDegreetypeDao.getCurrentSession().save(masDegree);

		MasDegreetype masDegree1= new MasDegreetype();
		masDegree1.setName("Master");
		masDegree1.setCode("02");
		masDegree1.setIsactive("1");
		masDegreetypeDao.getCurrentSession().save(masDegree);
		
		
		MasDegreetype masDegree2= new MasDegreetype();
		masDegree2.setName("Ph.D.");
		masDegree2.setCode("03");
		masDegree2.setIsactive("1");
		masDegreetypeDao.getCurrentSession().save(masDegree);
		
		
	}
	
	/*@Test
	public void updateMasDegreetype(){
		
		MasDegreetype masDegree=(MasDegreetype)masDegreetypeDao.getCurrentSession().get(MasDegreetype.class,1);
		masDegree.setName("Master2");
		masDegreetypeDao.getCurrentSession().update(masDegree);
		
		
	}
	
	@Test
	public void deleteMasDegreetype(){
		
		MasDegreetype masDegree = (MasDegreetype) masDegreetypeDao.getCurrentSession().get(MasDegreetype.class,1);
		masDegreetypeDao.getCurrentSession().delete(masDegree);
	}
	
	
	@Test
	public void listMasDegreetype(){
		
		Criteria c = masDegreetypeDao.getCurrentSession().createCriteria(MasDegreetype.class);
		List<MasDegreetype> masDegreetypeList = c.list();
		Assert.assertEquals(3, masDegreetypeList.size());
		
	}
	
	@Test
public void findByIdMasDegreetype(){
		
		MasDegreetype  masDegree = (MasDegreetype) masDegreetypeDao.getCurrentSession().get(MasDegreetype.class, 1);		
		int id = masDegree.getId();
		Assert.assertEquals(1, id);
		
	}*/
	
	

}
