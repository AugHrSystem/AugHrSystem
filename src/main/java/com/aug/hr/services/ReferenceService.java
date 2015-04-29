package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Reference;

public interface ReferenceService {

	public void create(Reference reference);
	public void update(Reference reference);
	public void delete(Reference reference);
	public Reference find(Integer Id);
	public List<Reference> findAll();
	public List<Reference> findByCriteria(Reference reference);
	public void deleteById(Integer id);
	
}
