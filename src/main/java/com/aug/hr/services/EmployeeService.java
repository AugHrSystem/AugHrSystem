/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.services;

import java.util.List;



import com.aug.hr.entity.Employee;

public interface EmployeeService {
	
	public void create(Employee employee);
	public void update(Employee employee);
	public void delete(Employee employee);
	public Employee find(Integer Id);
	public List<Employee> findAll();
	public List<Employee> findByCriteria(String employee);

	
}
