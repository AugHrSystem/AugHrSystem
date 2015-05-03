package com.aug.hr.services;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.aug.hr.entity.Experience;

public interface ExperienceService {
	public List<Experience> findAll() throws DataAccessException;

	public Experience find(Integer id);

	public abstract void create(Experience experience);

	public abstract void update(Experience experience);

	public abstract void delete(Experience experience);
	
	public List<Experience> findByCriteria(Experience experience);
	
	public void deleteById(Integer id);
	
}
