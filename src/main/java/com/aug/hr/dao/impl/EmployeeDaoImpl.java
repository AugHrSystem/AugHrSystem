/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.Employee;

@Repository
public class EmployeeDaoImpl extends GenericDaoImpl<Employee, Integer> implements EmployeeDao{

	public EmployeeDaoImpl() {
		super(Employee.class);
		// TODO Auto-generated constructor stub
	}

}
