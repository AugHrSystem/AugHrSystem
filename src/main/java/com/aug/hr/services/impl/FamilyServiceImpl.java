package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.FamilyDao;
import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;
import com.aug.hr.services.FamilyService;

@Service
@Transactional
public class FamilyServiceImpl implements FamilyService{
	
	@Autowired
	private FamilyDao empFamilyDao;

	@Override
	public void create(Family empFamily) {
		// TODO Auto-generated method stub
		empFamilyDao.create(empFamily);
	}

	@Override
	public void update(Family empFamily) {
		// TODO Auto-generated method stub
		empFamilyDao.update(empFamily);
	}

	@Override
	public void delete(Family empFamily) {
		// TODO Auto-generated method stub
		empFamilyDao.delete(empFamily);
	}

	@Override
	public Family find(Integer Id) {
		// TODO Auto-generated method stub
		Family empFamily = empFamilyDao.find(Id);
		return empFamily;
	}

	@Override
	public List<Family> findAll() {
		// TODO Auto-generated method stub
		List<Family> empFamilyList = empFamilyDao.findAll();
		return empFamilyList;
	}

	@Override
	public List<Family> findAllEmpAndEmp() {
		// TODO Auto-generated method stub
		List<Family> empFamilyList = empFamilyDao.findAllEmpAndEmp();
		return empFamilyList;
	}

	@Override
	public List<Family> findByEmployeeId(Long Id) {
		// TODO Auto-generated method stub
		List<Family> empFamilyList = empFamilyDao.findByEmployee(Id);
		return empFamilyList;
	}

	@Override
	public Employee findEmployeeById(Long Id) {
		// TODO Auto-generated method stub
		Employee emp = empFamilyDao.findEmployeeById(Id);
		return emp;
	}

	@Override
	public Family findLastEmpFamily(Integer Id) {
		// TODO Auto-generated method stub
		Family empfamily = empFamilyDao.findLastEmpFamily(Id);
		return empfamily;
	}

	
	
}
