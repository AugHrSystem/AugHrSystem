package services;


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
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.SiteService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class SiteServiceTest {
	
	@Autowired
	private SiteService siteService;
	@Autowired
	private EmployeeService empService;
	
	@Test
	@Rollback(false)
	public void Create(){
		
		Employee emp = empService.findById(new Integer(1));
		Site site = new Site();
		site.setProjectName("Aug Project...");
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
		siteService.create(site);
		
		
		Site site1 = new Site();
		site1.setProjectName("Aug Project3");
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
		siteService.create(site1);
		
	}
	
	
	
	@Test
	@Rollback(false)
	public void Update(){
		
		Site siteUpdate = siteService.find(3);
		Site site = new Site();
		site = siteUpdate;
		site.setProjectName("Augmentis Project2");
		site.setAuditFlag("U");
		site.setUpdatedBy(siteUpdate.getEmployee().getId());
		site.setUpdatedTimeStamp(Calendar.getInstance().getTime());
		siteService.update(site);
		
	}
	

	
	
	@Test
	@Rollback(false)
	public void Delete(){
		
		Site site = siteService.find(4);
		siteService.delete(site);
		
	}
	
	
	
	@Test
	public void findAll(){
		
		Assert.assertEquals(2,siteService.findAll().size());
		
	}
	
	

	@Test
	public void findById(){
		
		Assert.assertNotNull(siteService.find(3));
		
	}


}
