package com.aug.hr.services.impl;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.FamilyDao;
import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasRelationType;
import com.aug.hr.entity.dto.FamilyDto;
import com.aug.hr.entity.dto.Family2Dto;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.FamilyService;
import com.aug.hr.services.MasRelationTypeService;

@Service
@Transactional
public class FamilyServiceImpl implements FamilyService{
	
	@Autowired
	private FamilyDao empFamilyDao;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private MasRelationTypeService masRelationService;

	@Override
	public void create(Family empFamily) {
		// TODO Auto-generated method stub
		empFamilyDao.create(empFamily);
	}

	@Override
	public void update(Family empFamily) {
		// TODO Auto-generated method stub
		empFamilyDao.update(empFamily);
	}

	@Override
	public void delete(Family empFamily) {
		// TODO Auto-generated method stub
		empFamilyDao.delete(empFamily);
	}

	@Override
	public Family find(Integer Id) {
		// TODO Auto-generated method stub
		Family empFamily = empFamilyDao.find(Id);
		return empFamily;
	}

	@Override
	public List<Family> findAll() {
		// TODO Auto-generated method stub
		List<Family> empFamilyList = empFamilyDao.findAll();
		return empFamilyList;
	}


	@Override
	public List<Family> findFamilyByEmployeeId(Integer Id) {
		// TODO Auto-generated method stub
		List<Family> empFamilyList = empFamilyDao.findFamilyByEmployeeId(Id);
		return empFamilyList;
	}

	@Override
	public Employee findEmployeeById(Integer Id) {
		// TODO Auto-generated method stub
		Employee employee = empFamilyDao.findEmployeeById(Id);
		return employee;
	}

	@Override
	public Family findLastFamily(Integer Id) {
		// TODO Auto-generated method stub
		Family empfamily = empFamilyDao.findLastFamily(Id);
		return empfamily;
	}

	@Override
	public void saveByNameQuery(Family2Dto family) {
		// TODO Auto-generated method stub
		empFamilyDao.saveByNameQuery(family);
	}

	@Override
	public void updateByNameQuery(Family2Dto family) {
		// TODO Auto-generated method stub
		empFamilyDao.updateByNameQuery(family);
	}

	@Override
	public void deleteByNameQuery(Family2Dto family) {
		// TODO Auto-generated method stub
		empFamilyDao.deleteByNameQuery(family);
	}

	@Override
	public void createFindMasRelationAndEmployee(Family2Dto familyDto) {
		// TODO Auto-generated method stub

		Family family = new Family();

		MasRelationType masRelationType = new MasRelationType();
		masRelationType = masRelationService.find(familyDto.getMasRelationTypeId());
		family.setMasRelation(masRelationType);		
		
		family.setAuditFlag("C");
		family.setCreatedBy(0);
		Calendar cal = Calendar.getInstance();
		family.setCreatedTimeStamp(cal.getTime());
		
		
		Employee employee = new Employee();
		employee = empFamilyDao.findEmployeeById(familyDto.getEmployeeId());		
		family.setEmployee(employee);
		family.setFirstName(familyDto.getFirstName());
		family.setLastName(familyDto.getLastName());
		family.setAge(familyDto.getAge());
		family.setAddress(familyDto.getAddress());
		family.setOccupation(familyDto.getOccupation());
		family.setGender(familyDto.getGender());
		family.setMobile(familyDto.getMobile());
		family.setPosition(familyDto.getPosition());
		family.setGender(familyDto.getGender());
		empFamilyDao.create(family);
		
	}

	@Override
	public Family2Dto findForInitEdit(Family2Dto family) {
		// TODO Auto-generated method stub

        Family familyEdit = empFamilyDao.findLastFamily(new Integer(family.getId()));
        Hibernate.initialize(familyEdit);
       
        Family2Dto familyDto = new Family2Dto();
        familyDto.setId(familyEdit.getId());
        familyDto.setFirstName(familyEdit.getFirstName());
        familyDto.setLastName(familyEdit.getLastName());
       //familyDto.setName(familyEdit.getFirstName()+" "+familyEdit.getLastName());
        familyDto.setAge(familyEdit.getAge());
        familyDto.setAddress(familyEdit.getAddress());
        familyDto.setGender(familyEdit.getGender());
        familyDto.setMobile(familyEdit.getMobile());
        familyDto.setOccupation(familyEdit.getOccupation());
        familyDto.setPosition(familyEdit.getPosition());
        familyDto.setMasRelationTypeId(familyEdit.getMasRelation().getId());
        familyDto.setMasRelationTypeName(familyEdit.getMasRelation().getRelationType());
		return familyDto;
	}

	@Override
	public void updateFindMasRelationAndEmployee(Family2Dto familyDto) {
		// TODO Auto-generated method stub
		
		MasRelationType masRelationType = new MasRelationType();
		masRelationType = masRelationService.find(familyDto.getMasRelationTypeId());
		
		
		Family familyObj = new Family();
		familyObj = empFamilyDao.findLastFamily(familyDto.getId());	
		familyObj.setFirstName(familyDto.getFirstName());
		familyObj.setLastName(familyDto.getLastName());
		familyObj.setGender(familyDto.getGender());
		familyObj.setAge(familyDto.getAge());
		familyObj.setAddress(familyDto.getAddress());
		familyObj.setMobile(familyDto.getMobile());
		familyObj.setOccupation(familyDto.getOccupation());
		familyObj.setPosition(familyDto.getPosition());
		familyObj.setMasRelation(masRelationType);
		Calendar cal = Calendar.getInstance();
		familyObj.setUpdatedTimeStamp(cal.getTime());
		familyObj.setAuditFlag("U");
		familyObj.setUpdatedBy(familyDto.getEmployeeId());
		
		empFamilyDao.update(familyObj);
		
	}

	
	
}
