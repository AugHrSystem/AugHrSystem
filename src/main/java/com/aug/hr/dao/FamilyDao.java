package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Official;

public interface FamilyDao extends GenericDao<Family, Integer> {

	 public List<Family> findFamilyByEmployeeId(Integer Id);
	 public Employee findEmployeeById(Integer Id);
	 public Family findLastFamily(Integer Id);
}

