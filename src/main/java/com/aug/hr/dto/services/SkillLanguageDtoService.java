package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.SkillLanguageDao;
import com.aug.hr.entity.dto.SkillLanguageDto;


@Service(value="skillLanguageDtoService")
@Transactional
public class SkillLanguageDtoService {

	@Autowired
	private SkillLanguageDao skillLanguageDao;
	
	
	public List<SkillLanguageDto> listSkillLanguage(Integer id){
		return  skillLanguageDao.listSkillLanguageByEmployee(id);
	}
	
}
