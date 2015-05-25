package dao;


import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.PunishDao;
import com.aug.hr.entity.Punish;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class PunishTest {

	
	@Autowired
	private PunishDao punishdao;
	
	@Test
	public void test() {
		Calendar calendar = Calendar.getInstance();
		Punish punish = new Punish();
		Date date = new Date("10/09/2014");
		
		punish.setDescription("reason");
		
		punishdao.getCurrentSession().save(punish);
	}

}
