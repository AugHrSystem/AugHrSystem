package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.aug.hr.dao.TechnologyEmployeeDao;
import com.aug.hr.entity.TechnologyEmployee;
import com.aug.hr.services.TechnologyEmployeeService;

public class TechnologyEmployeeServiceImpl implements TechnologyEmployeeService{
	
	@Autowired
	private TechnologyEmployeeDao techEmpDao;

	@Override
	public void create(TechnologyEmployee techEmp) {
		// TODO Auto-generated method stub
		techEmpDao.create(techEmp);
	}

	@Override
	public void update(TechnologyEmployee techEmp) {
		// TODO Auto-generated method stub
		techEmpDao.update(techEmp);
	}

	@Override
	public void delete(TechnologyEmployee techEmp) {
		// TODO Auto-generated method stub
		techEmpDao.delete(techEmp);
	}

	@Override
	public TechnologyEmployee find(Integer Id) {
		// TODO Auto-generated method stub
		TechnologyEmployee techEmp = techEmpDao.find(Id);
		return techEmp;
	}

	@Override
	public List<TechnologyEmployee> findAll() {
		// TODO Auto-generated method stub
		List<TechnologyEmployee> techEmpList = techEmpDao.findAll();
		return techEmpList;
	}

}
