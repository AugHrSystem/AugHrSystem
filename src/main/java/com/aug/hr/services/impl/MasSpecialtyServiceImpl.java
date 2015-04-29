package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasSpecialtyDao;
import com.aug.hr.entity.Education;
import com.aug.hr.entity.MasSpecialty;


@Service
@Transactional
public class MasSpecialtyServiceImpl {
	
	@Autowired
	private MasSpecialtyDao specialtyDao;
	
	
	public List<MasSpecialty> findAll(){
		return specialtyDao.findAll();
	}
	
    public void create(MasSpecialty specialty){
    	specialtyDao.create(specialty);
    }
    
    public void update(MasSpecialty specialty){
    	specialtyDao.update(specialty);
    }
    
    public void delete(MasSpecialty specialty){
    	specialtyDao.delete(specialty);
    }

	public MasSpecialty findById(Integer id) {
		return specialtyDao.find(id);
	}

	public List<MasSpecialty> findByCriteria(MasSpecialty  specialty){
		return specialtyDao.findByCriteria(specialty);
	}

	public MasSpecialty deleteById(Integer id){
		return specialtyDao.deleteById(id);
	}

}
