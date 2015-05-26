package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.Family2Dto;

public interface FamilyDao extends GenericDao<Family, Integer> {

	 public List<Family> findFamilyByEmployeeId(Integer Id);
	 public Employee findEmployeeById(Integer Id);
	 public Family findLastFamily(Integer Id);
	 
	 public void saveByNameQuery(Family2Dto family);
	 public void updateByNameQuery(Family2Dto family);
	 public void deleteByNameQuery(Family2Dto family);
	 public List<Family2Dto> findFamilyList(Integer id);
	 

}

