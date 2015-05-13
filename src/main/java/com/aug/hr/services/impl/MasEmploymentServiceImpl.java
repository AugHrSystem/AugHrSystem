/**
 *
 * @author natechanok
 * @date Apr 29, 2015
 */

package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasEmploymentDao;
import com.aug.hr.entity.MasEmployment;
import com.aug.hr.services.MasEmploymentService;


@Service("masEmploymentService")
@Transactional
public class MasEmploymentServiceImpl implements MasEmploymentService{

	@Autowired
	private MasEmploymentDao masEmploymentDao;
	
	@Override
	public void create(MasEmployment masEmployment) {
		masEmploymentDao.create(masEmployment);
		
	}

	@Override
	public void update(MasEmployment masEmployment) {
		masEmploymentDao.update(masEmployment);
		
	}

	@Override
	public void delete(MasEmployment masEmployment) {
		masEmploymentDao.delete(masEmployment);
		
	}

	@Override
	public List<MasEmployment> findAll() {
		return masEmploymentDao.findAll();
	}

	@Override
	public MasEmployment findById(Integer Id) {
		return masEmploymentDao.find(Id);
	}

	@Override
	public List<MasEmployment> findByCriteria(MasEmployment masEmployment) {
		return masEmploymentDao.findByCriteria(masEmployment);
	}

	@Override
	public MasEmployment deleteById(Integer id) {
		return masEmploymentDao.deleteById(id);
	}
	
	

}
