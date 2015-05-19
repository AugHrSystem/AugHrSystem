package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aug.hr.dao.SkillLanguageDao;
import com.aug.hr.entity.SkillLanguage;
import com.aug.hr.services.SkillLanguageService;


@Service
public class SkillLanguageServiceImpl implements SkillLanguageService{

	@Autowired
	private SkillLanguageDao skillLanguageDao;
	
	
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


}
