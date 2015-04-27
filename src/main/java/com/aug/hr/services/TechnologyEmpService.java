package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.TechnologyEmp;


public interface TechnologyEmpService {
	
	public void create(TechnologyEmp techEmp);
	public void update(TechnologyEmp techEmp);
	public void delete(TechnologyEmp techEmp);
	public TechnologyEmp find(Integer Id);
	public List<TechnologyEmp> findAll();

}
