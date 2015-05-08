package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Official;



public interface FamilyService {
	
	public void create(Family empFamily);
	public void update(Family empFamily);
	public void delete(Family empFamily);
	public Family find(Integer Id);
	public List<Family> findAll();
	
	public List<Family> findFamilyByEmployeeId(Integer Id);
	
	
    public Employee findEmployeeById(Integer Id);
    public Family findLastFamily(Integer Id);


}
