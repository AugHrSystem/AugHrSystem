package com.aug.hr.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.ReferenceDao;
import com.aug.hr.entity.Reference;

@Service
@Transactional
public class ReferenceService {

	@Autowired
	private ReferenceDao referenceDao;
	
	

	public void create(Reference reference) {
		referenceDao.create(reference);
	}

	public void update(Reference reference) {
		referenceDao.update(reference);
	}

	public void delete(Reference reference) {
		referenceDao.delete(reference);

	}
		
	public List<Reference> findAll() {
		return referenceDao.findAll();
	}


	
	public Reference findByID(int id) {
		return referenceDao.find(id);
	}

	public List<Reference> findByCriteria(Reference reference) {

		return referenceDao.findByCriteria(reference);
	}
}
