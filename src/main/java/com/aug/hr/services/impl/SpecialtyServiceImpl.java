package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.SpecialtyDao;
import com.aug.hr.entity.Education;
import com.aug.hr.entity.Specialty;


@Service
@Transactional
public class SpecialtyServiceImpl {
	
	@Autowired
	private SpecialtyDao specialtyDao;
	
	
	public List<Specialty> findAll(){
		return specialtyDao.findAll();
	}
	
    public void create(Specialty specialty){
    	specialtyDao.create(specialty);
    }
    
    public void update(Specialty specialty){
    	specialtyDao.update(specialty);
    }
    
    public void delete(Specialty specialty){
    	specialtyDao.delete(specialty);
    }

	public Specialty findById(Integer id) {
		return specialtyDao.find(id);
	}

	public List<Specialty> findByCriteria(Specialty  specialty){
		return specialtyDao.findByCriteria(specialty);
	}

	public Specialty deleteById(Integer id){
		return specialtyDao.deleteById(id);
	}

}
