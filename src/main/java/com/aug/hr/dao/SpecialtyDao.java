package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Education;
import com.aug.hr.entity.Specialty;
import com.aug.hr.services.ReferenceService;



public interface SpecialtyDao extends GenericDao<Specialty, Integer>{
	
	
	public List<Specialty> findByCriteria(Specialty specialty);
	
	public Specialty deleteById(Integer id);
	

}
