package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.aug.hr.dao.TechnologyEmpDao;
import com.aug.hr.entity.TechnologyEmp;
import com.aug.hr.services.TechnologyEmpService;

public class TechnologyEmpServiceImpl implements TechnologyEmpService{
	
	@Autowired
	private TechnologyEmpDao techEmpDao;

	@Override
	public void create(TechnologyEmp techEmp) {
		// TODO Auto-generated method stub
		techEmpDao.create(techEmp);
	}

	@Override
	public void update(TechnologyEmp techEmp) {
		// TODO Auto-generated method stub
		techEmpDao.update(techEmp);
	}

	@Override
	public void delete(TechnologyEmp techEmp) {
		// TODO Auto-generated method stub
		techEmpDao.delete(techEmp);
	}

	@Override
	public TechnologyEmp find(Integer Id) {
		// TODO Auto-generated method stub
		TechnologyEmp techEmp = techEmpDao.find(Id);
		return techEmp;
	}

	@Override
	public List<TechnologyEmp> findAll() {
		// TODO Auto-generated method stub
		List<TechnologyEmp> techEmpList = techEmpDao.findAll();
		return techEmpList;
	}

}
