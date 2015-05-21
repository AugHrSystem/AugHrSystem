package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.ProbationDao;
import com.aug.hr.entity.Probation;
import com.aug.hr.services.ProbationService;

@Service("probationService")
@Transactional
public class ProbationServiceImpl implements ProbationService{

	@Autowired private ProbationDao probationDao;
	@Override
	public List<Probation> findAll() throws DataAccessException {
		return probationDao.findAll();
	}

	@Override
	public Probation find(Integer id) {
		return probationDao.find(id);
	}

	@Override
	public void create(Probation probation) {
		probationDao.create(probation);
		
	}

	@Override
	public void update(Probation probation) {
		probationDao.update(probation);
		
	}

	@Override
	public void delete(Probation probation) {
		probationDao.delete(probation);
		
	}

	@Override
	public List<Probation> findByCriteria(Probation probation) {
		return probationDao.findByCriteria(probation);
	}

	@Override
	public void deleteById(Integer id) {
		probationDao.deleteById(id);		
	}

}
