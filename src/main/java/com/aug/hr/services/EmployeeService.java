/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Employee;
import com.aug.hr.entity.dto.AllEmployeeDto;

public interface EmployeeService {
	
	public void create(Employee employee);
	public void update(Employee employee);
	public void delete(Employee employee);
	public Employee findById(Integer Id);
	public List<Employee> findAll();
	public Employee deleteById(Integer id);
	public List<Employee> findByCriteria(Employee employee);
	public void createEmployeeAndAddress(Employee employee);
	public void saveByNameQuery(AllEmployeeDto allEmployeeDto);
	public Employee searhEmpIdtoAddress();
	public void saveEmpAndWithRelateTable(AllEmployeeDto allEmployeeDto);


	
}
