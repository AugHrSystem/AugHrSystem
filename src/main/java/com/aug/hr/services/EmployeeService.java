/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.services;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import org.hibernate.JDBCException;
import org.springframework.dao.DataIntegrityViolationException;

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
	public AllEmployeeDto findEmployeeByEmployeeIdWithSetToDto(Integer id); 
	public Employee createEmployeeAndReturnId(AllEmployeeDto allEmployeeDto,String employeeCode) throws JDBCException;
	public Employee updateEmployeeAndReturnId(AllEmployeeDto allEmployeeDto,String employeeCode) throws DataIntegrityViolationException;
	public void deleteEmployeeByHibernate(Employee employee);
	public Employee findAndinitializeOfficial(Integer id);
	public List<Employee> findAimRelateWithEmployee(Integer id);
	public Employee findOfficial(Integer id);
	public Employee findEmployeeCode(Integer locationId);
	public String generateEmployeeCode(AllEmployeeDto allEmployeeDto);
}
