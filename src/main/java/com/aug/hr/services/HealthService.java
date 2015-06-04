package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Health;
import com.aug.hr.entity.dto.HealthDto;


public interface HealthService {

	public void create(Health health);
	public void update(Health health);
	public void delete(Health health);
	public Health find(Integer Id);
	public List<Health> findAll();
	public void createSetDtoToEnity(HealthDto healthDto);
	public HealthDto findByIdReturnToDto(Integer id);
	public void updateSetDtoToEntity(HealthDto healthDto);
	
}
