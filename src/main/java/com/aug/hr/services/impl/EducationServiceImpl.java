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

@Service
@Transactional
public class EducationServiceImpl {
	
	@Autowired
	private EducationDao educationDao;
	
	public List<Education> findAll(){
		return educationDao.findAll();
	}
	
    public void create(Education education){
    	educationDao.create(education);
    }
    
    public void update(Education education){
    	educationDao.update(education);
    }
    
    public void delete(Education education){
    	educationDao.delete(education);
    }

	public Education findById(Integer id) {
		return educationDao.find(id);
	}

	public List<Education> findByCriteria(Education education){
		return educationDao.findByCriteria(education);
	}

	public Education deleteById(Integer id){
		return educationDao.deleteById(id);
	}

}
