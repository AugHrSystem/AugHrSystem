package com.aug.hr.services;

import java.sql.SQLException;
import java.util.List;

import javax.validation.ConstraintViolationException;

import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.Family2Dto;



public interface FamilyService {
	
	public void create(Family empFamily);
	public void update(Family empFamily);
	public void delete(Family empFamily);
	public Family find(Integer Id);
	public List<Family> findAll();
	
	public List<Family> findFamilyByEmployeeId(Integer Id);
	
	
    public Employee findEmployeeById(Integer Id);
    public Family findLastFamily(Integer Id);
    public void saveByNameQuery(Family2Dto family);
    public void updateByNameQuery(Family2Dto family);
    public void deleteByNameQuery(Family2Dto family);
    public void createFindMasRelationAndEmployee(Family2Dto familyDto);
    public Family2Dto findForInitEdit(Family2Dto family);
    public void updateFindMasRelationAndEmployee(Family2Dto familyDto);


}
