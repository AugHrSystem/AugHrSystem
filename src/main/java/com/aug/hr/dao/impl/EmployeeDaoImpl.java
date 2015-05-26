/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao.impl;

import java.util.List;

import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.dto.AimEmployeeDto;
import com.aug.hr.entity.dto.EmployeeDto;
import com.mysql.jdbc.StringUtils;

/*@NamedNativeQueries({
	@NamedNativeQuery(
            name = "searchEmployee",
            query = "select emp.id as id, emp.employee_code as employeeCode, emp.name_eng as nameEng, emp.surname_eng as surnameEng from emp_employee as emp", 
            resultClass = EmployeeDto.class)
  })*/
@Repository
public class EmployeeDaoImpl extends GenericDaoImpl<Employee, Integer> implements EmployeeDao{

	public EmployeeDaoImpl() {
		super(Employee.class);
	}

	
	@SuppressWarnings("unchecked")
	public List<Employee> findByCriteria(Employee employee) {
		
		Criteria c = getCurrentSession().createCriteria(Employee.class);
		if (!StringUtils.isNullOrEmpty(employee.getNameEng())) {
			c.add(Restrictions.like("name", "%" + employee.getNameEng() + "%"));
		}
		return c.list();
		
	}

	
	public Employee deleteById(Integer id) {
		
		Employee employee =(Employee)getCurrentSession().load(Employee.class, id);
		getCurrentSession().delete(employee);
		return employee;
	}




	@SuppressWarnings("unchecked")
	public List<EmployeeDto> searchEmployee() {
		Query namedQuery = getCurrentSession().getNamedQuery("searchEmployee");
		List<EmployeeDto> empDto = namedQuery.list();
		return empDto;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<AimEmployeeDto> listEmployeeAim() {
		Query aimnamedQuery = getCurrentSession().getNamedQuery("listEmployeeAim");
		List<AimEmployeeDto> aimemp = aimnamedQuery.list();
		return aimemp;
	}


	@Override
	public void saveEmployee() {
		// TODO Auto-generated method stub
		
	}


	
}
