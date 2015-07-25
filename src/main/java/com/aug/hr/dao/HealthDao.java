package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Health;
import com.aug.hr.entity.dto.HealthDto;

public interface HealthDao extends GenericDao<Health,Integer>{
	
	public  List<HealthDto> listHealth(Integer id);
	public Health findByEmployeeId(Integer id);
}
