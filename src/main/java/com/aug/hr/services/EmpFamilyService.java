package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.EmpFamily;



public interface EmpFamilyService {
	
	public void create(EmpFamily empFamily);
	public void update(EmpFamily empFamily);
	public void delete(EmpFamily empFamily);
	public EmpFamily find(Integer Id);
	public List<EmpFamily> findAll();

}
