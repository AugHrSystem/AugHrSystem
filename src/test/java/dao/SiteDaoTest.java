package dao;


import java.util.Calendar;
import java.util.Date;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.dao.SiteDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Site;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class SiteDaoTest {
	
	@Autowired
	private SiteDao siteDao;
	@Autowired
	private EmployeeDao empDao;
	
	@Test
	@Rollback(false)
	public void Create(){
		
		Employee emp = empDao.find(new Integer(1));
		Site site = new Site();
		site.setProjectName("Aug Project");
		site.setProjectOwner("Augmentis");
		site.setProjectOwnerContact("Manager");
		Date dateFrom = new Date("10/09/2014");
		Date dateTo = new Date("10/11/2014");
		site.setStartDate(dateTo);
		site.setEndDate(dateTo);
		site.setEmployee(emp);
		site.setAuditFlag("C");
		site.setCreatedBy(emp.getId());
		site.setCreatedTimeStamp(Calendar.getInstance().getTime());
		siteDao.create(site);
		
		
		Site site1 = new Site();
		site1.setProjectName("Aug Project1");
		site1.setProjectOwner("Augmentis");
		site1.setProjectOwnerContact("Manager1");
		Date dateFrom1 = new Date("10/09/2014");
		Date dateTo1 = new Date("10/11/2014");
		site1.setStartDate(dateTo1);
		site1.setEndDate(dateTo1);
		site1.setEmployee(emp);
		site1.setAuditFlag("C");
		site1.setCreatedBy(emp.getId());
		site1.setCreatedTimeStamp(Calendar.getInstance().getTime());
		siteDao.create(site1);
		
	}
	
	
	
	@Test
	@Rollback(false)
	public void Update(){
		
		Site siteUpdate = siteDao.find(1);
		Site site = new Site();
		site = siteUpdate;
		site.setProjectName("Augmentis Project");
		site.setAuditFlag("U");
		site.setUpdatedBy(siteUpdate.getEmployee().getId());
		site.setUpdatedTimeStamp(Calendar.getInstance().getTime());
		siteDao.update(site);
		
	}
	

	
	
	@Test
	@Rollback(false)
	public void Delete(){
		
		Site site = siteDao.find(2);
		siteDao.delete(site);
		
	}
	
	
	
	@Test
	public void findAll(){
		
		Assert.assertEquals(1,siteDao.findAll().size());
		
	}
	
	

	@Test
	public void findById(){
		
		Assert.assertNotNull(siteDao.find(1));
		
	}


}
