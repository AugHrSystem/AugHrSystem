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


@Service
@Transactional
public class MasEmploymentServiceImpl implements MasEmploymentService{

	@Autowired
	private MasEmploymentDao masEmploymentDao;
	
	@Override
	public void create(MasEmployment masEmployment) {
		// TODO Auto-generated method stub
		masEmploymentDao.create(masEmployment);
		
	}

	@Override
	public void update(MasEmployment masEmployment) {
		// TODO Auto-generated method stub
		masEmploymentDao.update(masEmployment);
		
	}

	@Override
	public void delete(MasEmployment masEmployment) {
		// TODO Auto-generated method stub
		masEmploymentDao.delete(masEmployment);
		
	}

	@Override
	public MasEmployment find(Integer Id) {
		// TODO Auto-generated method stub
		MasEmployment masEmployment = masEmploymentDao.find(Id);
		return masEmployment;
	}

	@Override
	public List<MasEmployment> findAll() {
		// TODO Auto-generated method stub
		List<MasEmployment> masEmployment = masEmploymentDao.findAll();
		return masEmployment;
	}
	
	

}
