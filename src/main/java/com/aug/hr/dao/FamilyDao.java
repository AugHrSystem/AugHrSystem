package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;

public interface FamilyDao extends GenericDao<Family, Integer> {

	 public List<Family> findAllEmpAndEmp();
	 public List<Family> findByEmployee(Long Id);
	 public Employee findEmployeeById(Long Id);
	 public Family findLastEmpFamily(Integer Id);
}
