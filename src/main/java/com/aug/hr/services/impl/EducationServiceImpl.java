/**
 *
 * @author Preeyaporn
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EducationDao;
import com.aug.hr.entity.Education;
import com.aug.hr.services.EducationService;

@Service("EducationService")
@Transactional
public class EducationServiceImpl implements EducationService{

	@Autowired
	private EducationDao educationDao;
	
	@Override
	public List<Education> findAll() {
		return educationDao.findAll();
	}

	@Override
	public void create(Education education) {
		educationDao.create(education);
	}

	@Override
	public void update(Education education) {
		educationDao.update(education);
	}

	@Override
	public void delete(Education education) {
		educationDao.delete(education);
	}

	@Override
	public Education findById(Integer id) {
		return educationDao.find(id);
	}

	@Override
	public List<Education> findByCriteria(Education education) {
		return educationDao.findByCriteria(education);
	}

	@Override
	public Education deleteById(Integer id) {
		return educationDao.deleteById(id);
	}
	
	

}
