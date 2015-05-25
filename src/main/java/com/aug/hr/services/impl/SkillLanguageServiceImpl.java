package com.aug.hr.services.impl;

import java.util.Calendar;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.SkillLanguageDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasSkillLanguage;
import com.aug.hr.entity.SkillLanguage;
import com.aug.hr.entity.dto.SkillLanguageDto;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.MasSkillLanguageService;
import com.aug.hr.services.SkillLanguageService;


@Service
@Transactional
public class SkillLanguageServiceImpl implements SkillLanguageService{

	@Autowired
	private SkillLanguageDao skillLanguageDao;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private MasSkillLanguageService masSkillLanguageService;
	private final static Logger logger = Logger
			.getLogger(SkillLanguage.class);
	
	
	@Override
	public void create(SkillLanguage skillLanguage) {
		// TODO Auto-generated method stub
		skillLanguageDao.create(skillLanguage);
	}

	@Override
	public void update(SkillLanguage skillLanguage) {
		// TODO Auto-generated method stub
		skillLanguageDao.update(skillLanguage);
	}

	@Override
	public void delete(SkillLanguage skillLanguage) {
		// TODO Auto-generated method stub
		skillLanguageDao.delete(skillLanguage);
	}

	@Override
	public SkillLanguage find(Integer Id) {
		// TODO Auto-generated method stub
		SkillLanguage skillLanguage = skillLanguageDao.find(Id);
		return skillLanguage;
	}

	@Override
	public List<SkillLanguage> findAll() {
		// TODO Auto-generated method stub
		List<SkillLanguage> skillLanguageList = skillLanguageDao.findAll();
		return skillLanguageList;
	}

	@Override
	public List<SkillLanguage> findAllByEmployee(Integer IdEmployee) {
		// TODO Auto-generated method stub
		List<SkillLanguage> skillLanguageList = skillLanguageDao.findAllByEmployee(IdEmployee);
		return skillLanguageList;
	}

	@Override
	@Transactional
	public void saveByFindEmployee(Integer employeeId,
			SkillLanguage skillLanguage) {
		// TODO Auto-generated method stub
		try{
			
			Employee employee = employeeService.findById(employeeId);
    		MasSkillLanguage masSkillLanguage = masSkillLanguageService.find(skillLanguage.getMasSkillLanguage().getId());
    		Hibernate.initialize(skillLanguage.getMasSkillLanguage());
    		Hibernate.initialize(skillLanguage.getEmployee());
    		Hibernate.initialize(employee.getTechnology());
			logger.info("employeeservice: "+employee.getId());
     		logger.info("masSkillLanguageservice: "+masSkillLanguage.getId());
			skillLanguage.setMasSkillLanguage(skillLanguage.getMasSkillLanguage());
			skillLanguage.setEmployee(employee);
			skillLanguage.setCreatedBy(employee.getId());
			Calendar cal = Calendar.getInstance();
			skillLanguage.setCreatedTimeStamp(cal.getTime());
			skillLanguage.setAuditFlag("C");
			logger.info(skillLanguage.toString());
			skillLanguageDao.create(skillLanguage);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	@Override
	@Transactional
	public SkillLanguage findSkillLanguageById(Integer id) {
		// TODO Auto-generated method stub
		SkillLanguage skilllanguage = skillLanguageDao.findIdJoinEmployee(id);
		Hibernate.initialize(skilllanguage.getMasSkillLanguage());
		Hibernate.initialize(skilllanguage.getMasSkillLanguage().getSkillLanguage());
		logger.info("emp: "+skilllanguage.getEmployee().toString());
		logger.info("masskilllanguage: "+skilllanguage.getMasSkillLanguage().toString());
		//logger.info("skilllanguage list: "+skilllanguage.getMasSkillLanguage().getSkillLanguage());
		return skilllanguage;
	}

	@Override
	public void updateSetSkillLanguage(SkillLanguage skillLanguage) {
		// TODO Auto-generated method stub
		SkillLanguage skillLanguageUpdate = skillLanguageDao.find(skillLanguage.getId());
		skillLanguageUpdate.setMasSkillLanguage(skillLanguage.getMasSkillLanguage());
		skillLanguageUpdate.setAuditFlag("U");
		skillLanguageUpdate.setUpdatedTimeStamp(Calendar.getInstance().getTime());
		skillLanguageUpdate.setUpdatedBy(skillLanguageUpdate.getEmployee().getId());
		skillLanguageUpdate.setAbilityReading(skillLanguage.getAbilityReading());
		skillLanguageUpdate.setAbilitySpeaking(skillLanguage.getAbilitySpeaking());
		skillLanguageUpdate.setAbilityUnderstanding(skillLanguage.getAbilityUnderstanding());
		skillLanguageUpdate.setAbilityWriting(skillLanguage.getAbilityWriting());
		skillLanguageDao.update(skillLanguageUpdate);
	}

	
}
