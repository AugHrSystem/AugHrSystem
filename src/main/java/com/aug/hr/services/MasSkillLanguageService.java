package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasSkillLanguage;



public interface MasSkillLanguageService {
		
	public void create(MasSkillLanguage masSkillLanguage);
	public void update(MasSkillLanguage masSkillLanguage);
	public void delete(MasSkillLanguage masSkillLanguage);
	public MasSkillLanguage find(Integer id);
	public List<MasSkillLanguage> findAll();

}
