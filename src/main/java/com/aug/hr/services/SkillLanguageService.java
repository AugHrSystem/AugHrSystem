package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.SkillLanguage;

public interface SkillLanguageService {

	public void create(SkillLanguage skillLanguage);
	public void update(SkillLanguage skillLanguage);
	public void delete(SkillLanguage skillLanguage);
	public SkillLanguage find(Integer Id);
	public List<SkillLanguage> findAll();
	
	public List<SkillLanguage> findAllByEmployee(Integer IdEmployee);
}
