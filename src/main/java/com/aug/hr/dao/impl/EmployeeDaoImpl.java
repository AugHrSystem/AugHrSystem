/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.dto.EmployeeDto;
import com.mysql.jdbc.StringUtils;

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


	@Override
	public List<Employee> findByUserName(Employee employee) {
//		Criteria c = getCurrentSession().createCriteria(Employee.class);
//		c.setFetchMode("", FetchMode.JOIN);
//		c.setFetchMode("department", FetchMode.JOIN);
//		c.setFetchMode("status", FetchMode.JOIN);
//		c.createAlias("status","status" );
//		//c.createAlias("department", "department");
//		//c.createAlias("position", "position");
//		//c.createAlias("status", "status");
//		if (!StringUtils.isNullOrEmpty(employee.getName())) {
//		 c.add(Restrictions.like("userName", "%"+employee.getName()+"%"));
//		 c.add(Restrictions.or(Restrictions.like("firstName", "%"+employee.getName()+"%")));
//		 c.add(Restrictions.or(Restrictions.like("lastName", "%"+employee.getName()+"%")));
//		 c.add(Restrictions.or(Restrictions.like("email", "%"+employee.getName()+"%")));
//
//		 
//		 
//		//c.add(Restrictions.or(Restrictions.like("joinDate", "%"+employee.getName()+"%")));
////		 c.add(Restrictions.or(Restrictions.like("department.departmentName", "%"+employee.getName()+"%")));
////		 c.add(Restrictions.or(Restrictions.like("position.positionName", "%"+employee.getName()+"%")));
////		 c.add(Restrictions.or(Restrictions.like("status.statusName", "%"+employee.getName()+"%")));
//		// c.add(Restrictions.or(Restrictions.like("joinDate", "%"+employee.getName()+"%")));
//		// c.add(Restrictions.or(Restrictions.like("department.departmentName", "%"+employee.getName()+"%")));
//		// c.add(Restrictions.or(Restrictions.like("position.positionName", "%"+employee.getName()+"%")));
//		//c.add(Restrictions.or(Restrictions.like("status.statusName", "%"+employee.getName()+"%")));
//		}
//		if(employee.getIsManager()!=null&& employee.getIsManager()>0)
//			 c.add(Restrictions.eq("isManager", 1));
//		if(!StringUtils.isNullOrEmpty(employee.getSortingBy())){
//			c.addOrder(Order.asc(employee.getSortingBy()));
//		}
//		return c.list();
//	}
		return null;

	}


	@SuppressWarnings("unchecked")
	public List<EmployeeDto> searchEmployee() {
		Query namedQuery = getCurrentSession().getNamedQuery("searchEmployee");
		List<EmployeeDto> empDto = namedQuery.list();
		return empDto;
	}
}
