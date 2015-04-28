package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.EmpFamily;

public interface EmpFamilyDao extends GenericDao<EmpFamily, Integer> {

	 public List<EmpFamily> findAllEmpAndEmp();
}
