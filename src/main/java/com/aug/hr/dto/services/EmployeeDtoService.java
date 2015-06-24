package com.aug.hr.dto.services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.dto.EmployeeDto;
import com.aug.hr.entity.dto.ReportEmployeeDto;


import com.aug.hr.entity.dto.ReportLeaveDto;
import com.aug.hr.entity.dto.ReportStatusEmployeeDto;


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

	
	public List<ReportStatusEmployeeDto> reportStatusEmployee(){
		return employeeDao.reportStatusEmployee();
	}

	
	public List<ReportLeaveDto> reportLeave(){
		return employeeDao.reportLeave();
	}
	
	
	
	
	public Employee findOfficial(Integer id){
		return employeeDao.findOfficial(id);
	}
	
}
