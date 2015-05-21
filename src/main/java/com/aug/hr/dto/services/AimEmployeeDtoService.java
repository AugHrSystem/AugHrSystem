/**
 *
 * @author natechanok
 * @date May 20, 2015
 */

package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.dto.AimEmployeeDto;


@Service("aimEmployeeDtoService")
@Transactional
public class AimEmployeeDtoService {
	
	@Autowired private EmployeeDao employeeDao;
	
	public List<AimEmployeeDto> listEmployeeAim(){
		return employeeDao.listEmployeeAim();

	}
}
