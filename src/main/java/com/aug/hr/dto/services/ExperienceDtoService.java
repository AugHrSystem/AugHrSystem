package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.ExperienceDao;
import com.aug.hr.entity.dto.ExperienceDto;


@Service("experienceDtoService")
@Transactional
public class ExperienceDtoService {

	@Autowired private ExperienceDao experienceDao;
	
	public List<ExperienceDto> searchExperience(Integer id){
		return experienceDao.searchExperience(id);
	}
}
