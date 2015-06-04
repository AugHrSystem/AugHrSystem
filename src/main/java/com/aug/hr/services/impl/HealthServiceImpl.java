package com.aug.hr.services.impl;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.HealthDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Health;
import com.aug.hr.entity.dto.HealthDto;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.HealthService;

@Service
@Transactional
public class HealthServiceImpl implements HealthService{

	
	@Autowired
	private HealthDao healthDao;
	@Autowired
	private EmployeeService employeeService;
	
	
	@Override
	public void create(Health health) {
		// TODO Auto-generated method stub
		try{
			healthDao.create(health);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Health health) {
		// TODO Auto-generated method stub
		try{
			healthDao.update(health);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Health health) {
		// TODO Auto-generated method stub
		try{
			healthDao.delete(health);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public Health find(Integer Id) {
		// TODO Auto-generated method stub
		Health health = healthDao.find(Id);
		return health;
	}

	@Override
	public List<Health> findAll() {
		// TODO Auto-generated method stub
		return healthDao.findAll();
	}

	@Override
	public void createSetDtoToEnity(HealthDto healthDto) {
		// TODO Auto-generated method stub
		
		Employee employee = new Employee();
		employee = employeeService.findById(healthDto.getEmployeeId());
		
		Health health = new Health();
		health.setAuditFlag("C");
		health.setCreatedBy(healthDto.getEmployeeId());
		health.setCreatedTimeStamp(Calendar.getInstance().getTime());
		health.setEmployee(employee);
		health.setCongenitalDisease(healthDto.getCongenitalDisease());
		health.setCongenitalDiseaseExplain(healthDto.getCongenitalDiseaseExplain());
		health.setCongenitalDiseaseExplain2(healthDto.getCongenitalDiseaseExplain2());
		health.setCongenitalDiseaseExplain3(healthDto.getCongenitalDiseaseExplain3());
		health.setGeneticDisease(healthDto.getGeneticDisease());
		health.setGeneticDiseaseExplain(healthDto.getGeneticDiseaseExplain());
		health.setGeneticDiseaseExplain2(healthDto.getGeneticDiseaseExplain2());
		health.setGeneticDiseaseExplain3(healthDto.getGeneticDiseaseExplain3());
		health.setTakeMedicine(healthDto.getTakeMedicine());
		health.setTakeMedicineExplain(healthDto.getTakeMedicineExplain());
		health.setIntolerance(healthDto.getIntolerance());
		health.setIntoleranceExplain(healthDto.getIntoleranceExplain());
		healthDao.create(health);
		
	}

	@Override
	public HealthDto findByIdReturnToDto(Integer id) {
		// TODO Auto-generated method stub
		
		Health health = new Health();
		health = healthDao.find(id);
		HealthDto healthDto = new HealthDto();
		healthDto.setId(health.getId());
		healthDto.setCongenitalDisease(health.getCongenitalDisease());
		healthDto.setCongenitalDiseaseExplain(health.getCongenitalDiseaseExplain());
		healthDto.setCongenitalDiseaseExplain2(health.getCongenitalDiseaseExplain2());
		healthDto.setCongenitalDiseaseExplain3(health.getCongenitalDiseaseExplain3());
		healthDto.setGeneticDisease(health.getGeneticDisease());
		healthDto.setGeneticDiseaseExplain(health.getGeneticDiseaseExplain());
		healthDto.setGeneticDiseaseExplain2(health.getGeneticDiseaseExplain2());
		healthDto.setGeneticDiseaseExplain3(health.getGeneticDiseaseExplain3());
		healthDto.setTakeMedicine(health.getTakeMedicine());
		healthDto.setTakeMedicineExplain(health.getTakeMedicineExplain());
		healthDto.setIntolerance(health.getIntolerance());
		healthDto.setIntoleranceExplain(health.getIntoleranceExplain());
		healthDto.setEmployeeId(health.getEmployee().getId());
		healthDto.setEmployeeCode(health.getEmployee().getEmployeeCode());
		
		return healthDto;
	}

	@Override
	public void updateSetDtoToEntity(HealthDto healthDto) {
		// TODO Auto-generated method stub
		
		try{
			Health health = new Health();
			health = healthDao.find(healthDto.getId());
			health.setAuditFlag("U");
			health.setUpdatedBy(healthDto.getEmployeeId());
			health.setUpdatedTimeStamp(Calendar.getInstance().getTime());
			health.setCongenitalDisease(healthDto.getCongenitalDisease());
			health.setCongenitalDiseaseExplain(healthDto.getCongenitalDiseaseExplain());
			health.setCongenitalDiseaseExplain2(healthDto.getCongenitalDiseaseExplain2());
			health.setCongenitalDiseaseExplain3(healthDto.getCongenitalDiseaseExplain3());
			health.setGeneticDisease(healthDto.getGeneticDisease());
			health.setGeneticDiseaseExplain(healthDto.getGeneticDiseaseExplain());
			health.setGeneticDiseaseExplain2(healthDto.getGeneticDiseaseExplain2());
			health.setGeneticDiseaseExplain3(healthDto.getGeneticDiseaseExplain3());
			health.setTakeMedicine(healthDto.getTakeMedicine());
			health.setTakeMedicineExplain(healthDto.getTakeMedicineExplain());
			health.setIntolerance(healthDto.getIntolerance());
			health.setIntoleranceExplain(healthDto.getIntoleranceExplain());
			healthDao.update(health);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
