package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Experience;

public interface ExperienceDao extends GenericDao<Experience, Integer>{
	
	public List<Experience> findByCriteria(Experience experience);

	public Experience deleteById(Integer id);

}
