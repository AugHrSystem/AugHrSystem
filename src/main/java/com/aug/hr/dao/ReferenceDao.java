package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Reference;
import com.aug.hr.services.ReferenceService;

public interface ReferenceDao extends GenericDao<Reference, Integer>{

	public List<Reference> findByCriteria(Reference reference);
	public Reference deleteById(Integer id);
	
	

}
