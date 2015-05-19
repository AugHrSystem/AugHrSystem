package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.SkillLanguage;

public interface SkillLanguageDao extends GenericDao<SkillLanguage,Integer>{
	
	public List<SkillLanguage> findAllByEmployee(Integer IdEmployee);
}
