package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.HealthDao;
import com.aug.hr.entity.dto.HealthDto;

@Service
@Transactional
public class HealthDtoService {
	
	@Autowired
	private HealthDao healthDao;
	
	
	public  List<HealthDto> listHealth(Integer id){
		return healthDao.listHealth(id);
		
	}
	

}
