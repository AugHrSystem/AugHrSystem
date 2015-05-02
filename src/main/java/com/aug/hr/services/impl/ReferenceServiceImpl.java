package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.ReferenceDao;
import com.aug.hr.entity.Reference;
import com.aug.hr.services.ReferenceService;

@Service("ReferenceService")
@Transactional
public class ReferenceServiceImpl implements ReferenceService {

	@Autowired
	private ReferenceDao referenceDao;

	@Override
	public void create(Reference reference) {
		referenceDao.create(reference);

	}

	@Override
	public void update(Reference reference) {
		referenceDao.update(reference);

	}

	@Override
	public void delete(Reference reference) {
		referenceDao.delete(reference);

	}

	@Override
	public Reference findById(Integer id) {
		return referenceDao.find(id);
	}

	@Override
	public List<Reference> findAll() {
		return referenceDao.findAll();
	}

	@Override
	public List<Reference> findByCriteria(Reference reference) {
		return referenceDao.findByCriteria(reference);
	}

	@Override
	public Reference deleteById(Integer id) {
		return referenceDao.deleteById(id);

	}

}
