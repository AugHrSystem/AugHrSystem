package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;



public interface FamilyService {
	
	public void create(Family empFamily);
	public void update(Family empFamily);
	public void delete(Family empFamily);
	public Family find(Integer Id);
	public List<Family> findAll();
	public List<Family> findAllEmpAndEmp();
	public List<Family> findByEmployeeId(Long Id);
    public Employee findEmployeeById(Long Id);
    public Family findLastEmpFamily(Integer Id);


}
