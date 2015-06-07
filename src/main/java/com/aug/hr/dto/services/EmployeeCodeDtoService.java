package com.aug.hr.dto.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.dto.EmployeeCodeDto;

@Service
@Transactional
public class EmployeeCodeDtoService {
	
	@Autowired
	private EmployeeDao employeeDao;
	
	
	public EmployeeCodeDto serchRunningNo(Integer id){
		return employeeDao.serchRunningNo(id);		
	}

}
