package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.dto.EmployeeDto;
import com.aug.hr.entity.dto.ReportEmployeeDto;

@Service("employeeDtoService")
@Transactional
public class EmployeeDtoService {

	@Autowired private EmployeeDao employeeDao;
	
	public List<EmployeeDto> searchEmployee(){
		return employeeDao.searchEmployee();
	}
	
	public List<ReportEmployeeDto> reportEmployee(){
		return employeeDao.reportEmployee();
	}
}
