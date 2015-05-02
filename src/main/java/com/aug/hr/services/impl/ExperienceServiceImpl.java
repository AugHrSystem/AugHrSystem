package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.ExperienceDao;
import com.aug.hr.entity.Experience;
import com.aug.hr.services.ExperienceService;

@Service("ExperienceService")
@Transactional
public class ExperienceServiceImpl implements ExperienceService{
	@Autowired
	private ExperienceDao experienceDao;
	@Override
	public List<Experience> findAll() throws DataAccessException {
		return experienceDao.findAll();
	}

	@Override
	public Experience find(Integer id) {
		return experienceDao.find(id);
	}

	@Override
	public void create(Experience experience) {
		experienceDao.create(experience);
		
	}

	@Override
	public void update(Experience experience) {
		experienceDao.update(experience);
		
	}

	@Override
	public void delete(Experience experience) {
		experienceDao.delete(experience);
		
	}

	@Override
	public List<Experience> findByCriteria(Experience experience) {
		return experienceDao.findByCriteria(experience);
	}

	@Override
	public Experience deleteById(Integer id) {
		return experienceDao.deleteById(id);
	}

}
