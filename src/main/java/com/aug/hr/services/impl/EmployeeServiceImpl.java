/**
 *
 * @author natechanok
 * @date Apr 29, 2015
 */

package com.aug.hr.services.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasAddressType;
import com.aug.hr.entity.MasProvince;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.AddressDto;
import com.aug.hr.entity.dto.AllEmployeeDto;
import com.aug.hr.entity.dto.OfficialDto;
import com.aug.hr.services.AddressService;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.MasAddressTypeService;
import com.aug.hr.services.MasProvinceService;
import com.aug.hr.services.OfficialService;

@Service("employeeService")
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;
	@Autowired 
	private MasAddressTypeService masAddressTypeService;
	@Autowired 
	private MasProvinceService masProvinceService;
	@Autowired 
	private AddressService addressService;
	@Autowired
	private OfficialService afficialService;
	
	
	@Override
	public void create(Employee employee) {
		employeeDao.create(employee);
		
	}

	@Override
	public void update(Employee employee) {
		employeeDao.update(employee);
		
	}

	@Override
	public void delete(Employee employee) {
		employeeDao.delete(employee);
		
	}


	@Override
	public List<Employee> findAll() {
		return employeeDao.findAll();
	}

	

	@Override
	public Employee findById(Integer Id) {
		return employeeDao.find(Id);
	}

	@Override
	public Employee deleteById(Integer id) {
		return employeeDao.deleteById(id);
	}

	@Override
	public List<Employee> findByCriteria(Employee employee) {
		return employeeDao.findByCriteria(employee);
	}

	@Override
	@Transactional
	public void createEmployeeAndAddress(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.create(employee);
		for(Address address:employee.getAddresses()){
			address.setEmployee(employee);
			MasProvince masProvince = masProvinceService.find(address.getProvinceId());
			address.setProvince(masProvince);
			MasAddressType masAddressType = masAddressTypeService.findById(address.getAddressTypeId());
			address.setAddressType(masAddressType);
			addressService.create(address);
		}
		
	}

	@Override
	public void saveByNameQuery(AllEmployeeDto allEmployeeDto) {
		
		employeeDao.saveByNameQuery(allEmployeeDto);
	}

	@Override
	public Employee searhEmpIdtoAddress() {
		
		return employeeDao.searhEmpIdtoAddress();
	}

	@Override
	@Transactional
	public void saveEmpAndWithRelateTable(AllEmployeeDto allEmployeeDto) {
		// TODO Auto-generated method stub
		
		
		OfficialDto officialDto = new OfficialDto();
		//Date dateOffi = new Date("12/05/2015");
		Calendar cal = Calendar.getInstance();
		officialDto.setStartDate(allEmployeeDto.getStartDate());
		officialDto.setPositionAppliedFor(allEmployeeDto.getPositionAppliedFor());
		officialDto.setSalaryExpected(allEmployeeDto.getSalaryExpected());
	
		afficialService.saveOfficialByNameQuery(officialDto);		
		
		Official official1 = afficialService.searhEmpIdtoOfficial();
		System.out.println(official1.getId());
	
		allEmployeeDto.setOfficialId(official1.getId());
		
		employeeDao.saveByNameQuery(allEmployeeDto);
		
		
		Employee emp = employeeDao.searhEmpIdtoAddress();
		
		System.out.println("empId: "+emp.getId());
    
		for(AddressDto addressDto:allEmployeeDto.getAddressList()){
			
			addressDto.setEmployeeId(emp.getId());
			addressService.saveAddressByNameQuery(addressDto);;
			
		}
		
	}


	

}
