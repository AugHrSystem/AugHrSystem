/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Employee;
import com.aug.hr.entity.dto.AimEmployeeDto;
import com.aug.hr.entity.dto.AllEmployeeDto;
import com.aug.hr.entity.dto.EmployeeCodeDto;
import com.aug.hr.entity.dto.EmployeeDto;
import com.aug.hr.entity.dto.ReportEmployeeDto;
import com.aug.hr.entity.dto.ReportStatusEmployeeDto;

public interface EmployeeDao extends GenericDao<Employee, Integer>{
	
	public List<Employee> findByCriteria(Employee employee);

	public Employee deleteById(Integer id);

	public List<EmployeeDto> searchEmployee();
	
	public List<AimEmployeeDto> listEmployeeAim();
	public void saveEmployee();
	public void saveByNameQuery(AllEmployeeDto allEmployeeDto);
	public Employee searhEmpIdtoAddress();
	public List<ReportEmployeeDto> reportEmployee();
	public List<ReportStatusEmployeeDto> reportStatusEmployee();
	public EmployeeCodeDto serchRunningNo(String code);

	
}
