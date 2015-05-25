package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasSkillLanguageDao;
import com.aug.hr.entity.MasSkillLanguage;
import com.aug.hr.services.MasSkillLanguageService;


@Service
@Transactional
public class MasSkillLanguageServiceImpl implements MasSkillLanguageService{
	
	@Autowired
	private MasSkillLanguageDao masSkillLanguageDao;

	@Override
	public void create(MasSkillLanguage masSkillLanguage) {
		// TODO Auto-generated method stub
		masSkillLanguageDao.create(masSkillLanguage);
	}

	@Override
	public void update(MasSkillLanguage masSkillLanguage) {
		// TODO Auto-generated method stub
		masSkillLanguageDao.update(masSkillLanguage);
	}

	@Override
	public void delete(MasSkillLanguage masSkillLanguage) {
		// TODO Auto-generated method stub
		masSkillLanguageDao.delete(masSkillLanguage);
	}

	@Override
	public MasSkillLanguage find(Integer id) {
		// TODO Auto-generated method stub
		MasSkillLanguage masSkillLanguage = masSkillLanguageDao.find(id);		
		return masSkillLanguage;
	}

	@Override
	public List<MasSkillLanguage> findAll() {
		// TODO Auto-generated method stub
		List<MasSkillLanguage> masSkillLanguageList = masSkillLanguageDao.findAll();
		return masSkillLanguageList;
	}

}
