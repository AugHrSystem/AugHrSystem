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
import com.aug.hr.entity.dto.EmployeeIdDto;
import com.aug.hr.entity.dto.ReportEmployeeDto;
import com.aug.hr.entity.dto.ReportLeaveDto;
import com.aug.hr.entity.dto.ReportStatusEmployeeDto;

public interface EmployeeDao extends GenericDao<Employee, Integer>{
	
	public List<Employee> findByCriteria(Employee employee);

	public Employee deleteById(Integer id);

	public List<EmployeeDto> searchEmployee();
	
	public List<AimEmployeeDto> listEmployeeAim();
	public void saveEmployee();
	public void saveByNameQuery(AllEmployeeDto allEmployeeDto);
	public Employee searhEmpIdtoAddress();
	public List<ReportEmployeeDto> reportEmployee(String nameEng);
	public List<ReportStatusEmployeeDto> reportStatusEmployee(String statusStaff);
	public EmployeeCodeDto serchRunningNo(String code);
	public List<ReportLeaveDto> reportLeave(String nameEng);
	public void updateByNameQuery(AllEmployeeDto allEmployeeDto);
	public EmployeeIdDto findCurrentId();
	public Employee findEmployeeAndOfficial(Integer id);
	public void deleteEmployeeByNameQuery(Employee employee);
	public List<Employee> findAimRelateWithEmployee(Integer id);
	public Employee findOfficial(Integer id);
	public List<ReportEmployeeDto> findByName(Employee employee);
	public List<ReportStatusEmployeeDto> findByNameStatus(Employee employee);
	public List<ReportEmployeeDto> reportEmployeeCode(String code);
	public Employee findEmployeeCode(Integer locationId);

	
}
