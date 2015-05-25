package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.SkillLanguage;
import com.aug.hr.entity.dto.SkillLanguageDto;

public interface SkillLanguageDao extends GenericDao<SkillLanguage,Integer>{
	
	public List<SkillLanguage> findAllByEmployee(Integer IdEmployee);
	public List<SkillLanguageDto> listSkillLanguageByEmployee(Integer id);
	public SkillLanguage findIdJoinEmployee(Integer id); 

}
