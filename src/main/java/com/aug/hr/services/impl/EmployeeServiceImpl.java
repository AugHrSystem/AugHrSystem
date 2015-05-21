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

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.services.EmployeeService;

@Service("employeeService")
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;
	
	@Override
	public void create(Employee employee) {
		employeeDao.create(employee);
		
	}

	@Override
	public void update(Employee employee) {
		employeeDao.update(employee);
		
	}

	@Override
	public void delete(Employee employee) {
		employeeDao.delete(employee);
		
	}


	@Override
	public List<Employee> findAll() {
		return employeeDao.findAll();
	}

	

	@Override
	public Employee findById(Integer Id) {
		return employeeDao.find(Id);
	}

	@Override
	public Employee deleteById(Integer id) {
		return employeeDao.deleteById(id);
	}

	@Override
	public List<Employee> findByCriteria(Employee employee) {
		return employeeDao.findByCriteria(employee);
	}

	

}
