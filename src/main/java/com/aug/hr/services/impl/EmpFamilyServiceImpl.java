package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmpFamilyDao;
import com.aug.hr.entity.EmpFamily;
import com.aug.hr.services.EmpFamilyService;

@Service
@Transactional
public class EmpFamilyServiceImpl implements EmpFamilyService{
	
	@Autowired
	private EmpFamilyDao empFamilyDao;

	@Override
	public void create(EmpFamily empFamily) {
		// TODO Auto-generated method stub
		empFamilyDao.create(empFamily);
	}

	@Override
	public void update(EmpFamily empFamily) {
		// TODO Auto-generated method stub
		empFamilyDao.update(empFamily);
	}

	@Override
	public void delete(EmpFamily empFamily) {
		// TODO Auto-generated method stub
		empFamilyDao.delete(empFamily);
	}

	@Override
	public EmpFamily find(Integer Id) {
		// TODO Auto-generated method stub
		EmpFamily empFamily = empFamilyDao.find(Id);
		return empFamily;
	}

	@Override
	public List<EmpFamily> findAll() {
		// TODO Auto-generated method stub
		List<EmpFamily> empFamilyList = empFamilyDao.findAll();
		return empFamilyList;
	}
	
}
