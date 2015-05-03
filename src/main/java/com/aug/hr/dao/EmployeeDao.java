/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Employee;

public interface EmployeeDao extends GenericDao<Employee, Integer>{
	
	public List<Employee> findByCriteria(Employee employee);

	public Employee deleteById(Integer id);

}
