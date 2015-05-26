package dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.FamilyDao;
import com.aug.hr.entity.dto.FamilyDto;
import com.aug.hr.entity.dto.Family2Dto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@Transactional
public class Family2DtoTest {
	
	@Autowired
	private FamilyDao familyDao;
	
	@Test
	@Rollback(false)
	public void TestCreateNameQuery(){
		
		Family2Dto familyDto = new Family2Dto();
		familyDto.setAge(24);
		familyDto.setFirstName("aaa");
		familyDto.setLastName("kkk");
		familyDto.setMobile("0890851022");
		familyDto.setOccupation("aaaaaaaaaaaaaaaaaaa");
		familyDto.setMasRelationTypeId(1);
		familyDto.setEmployeeId(1);
		familyDto.setGender("Female");
		familyDto.setAddress("1/1");
		familyDao.saveByNameQuery(familyDto);
		
	}
	
	
	@Test
	@Rollback(false)
	public void TestUpdateNameQuery(){
		
		Family2Dto familyDto = new Family2Dto();
		familyDto.setId(4);
		familyDto.setAge(24);
		familyDto.setFirstName("aaa");
		familyDto.setLastName("kkk");
		familyDto.setMobile("0890851022");
		familyDto.setOccupation("aaaaaaaaaaaaaaaaaaa");
		familyDto.setMasRelationTypeId(1);
		familyDto.setEmployeeId(1);
		familyDto.setGender("Female");
		familyDto.setAddress("1/1");
		familyDao.updateByNameQuery(familyDto);
		
	}

}
