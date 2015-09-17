package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Education;
import com.aug.hr.entity.MasSpecialty;



public interface MasSpecialtyDao extends GenericDao<MasSpecialty, Integer>{
	
	
	public List<MasSpecialty> findByCriteria(MasSpecialty specialty);
	
	public MasSpecialty deleteById(Integer id);
	

}
