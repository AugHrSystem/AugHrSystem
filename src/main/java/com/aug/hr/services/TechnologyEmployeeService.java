package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.TechnologyEmployee;


public interface TechnologyEmployeeService {
	
	public void create(TechnologyEmployee techEmp);
	public void update(TechnologyEmployee techEmp);
	public void delete(TechnologyEmployee techEmp);
	public TechnologyEmployee find(Integer Id);
	public List<TechnologyEmployee> findAll();

}
