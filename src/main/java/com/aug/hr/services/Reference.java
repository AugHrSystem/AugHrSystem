package com.aug.hr.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import com.aug.hr.dao.ReferenceDao;

@Service
@Transactional
public class Reference {
	
	@Autowired private ReferenceDao referenceDao;
	

	public List<Reference> findByCriteria(Reference reference) {
		
		return referenceDao.findByCriteria(reference);
	}

	public void create(Reference reference) {
		referenceDao.create(reference);
	}
	
	public void update(Reference reference) {
		referenceDao.update(reference);
	}
	
	public Reference deleteById(Integer id) {
	  return referenceDao.delete(id);
		
	}
	/*public List<Product> findByselectId(Integer id) {
		
		return productDao.findByselectId(id);
	}*/

	public Reference find(Integer id) {
		return referenceDao.find(id);
	}

}
