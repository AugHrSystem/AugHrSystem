package com.aug.hr.dto.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.dto.EmployeeIdDto;

@Service
@Transactional
public class EmployeeIdDtoService {
	
	@Autowired
	private EmployeeDao employeeDao;
	
	public EmployeeIdDto findCurrentId(){
		return employeeDao.findCurrentId();		
	}

}
