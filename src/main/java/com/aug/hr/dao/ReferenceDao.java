package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.services.Reference;

public interface ReferenceDao extends GenericDao<Reference, Integer>{

	public List<Reference> findByCriteria(Reference reference);
	public Reference delete(Integer id);
	

}
