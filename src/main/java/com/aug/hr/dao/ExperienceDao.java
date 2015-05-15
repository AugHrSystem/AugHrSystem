package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Experience;
import com.aug.hr.entity.dto.ExperienceDto;

public interface ExperienceDao extends GenericDao<Experience, Integer>{
	
	public List<Experience> findByCriteria(Experience experience);

	public void deleteById(Integer id);

	public List<ExperienceDto> searchExperience();
}
