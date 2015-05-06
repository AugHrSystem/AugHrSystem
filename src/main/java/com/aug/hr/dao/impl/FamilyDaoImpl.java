package com.aug.hr.dao.impl;


import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.FamilyDao;
import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;

@Repository
public class FamilyDaoImpl extends GenericDaoImpl<Family, Integer> implements FamilyDao,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public FamilyDaoImpl() {
		super(Family.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Family> findAllEmpAndEmp() {
		// TODO Auto-generated method stub
		Criteria c = getCurrentSession().createCriteria(Family.class);
		c.setFetchMode("employee",FetchMode.JOIN);
		return c.list();
	}

	
	@Override
	public List<Family> findByEmployee(Long Id) {
		Criteria c = getCurrentSession().createCriteria(Family.class,"family");
		c.setFetchMode("employee",FetchMode.JOIN);
		c.createAlias("employee", "employee");
		c.add(Restrictions.eq("family.employee.id", Id));
		return c.list();
	}

	@Override
	public Employee findEmployeeById(Long Id) {
		// TODO Auto-generated method stub
		Employee emp = (Employee) getCurrentSession().get(Employee.class,Id);
		return emp;
	}

	@Override
	public Family findLastEmpFamily(Integer Id) {
		// TODO Auto-generated method stub
		Criteria c = getCurrentSession().createCriteria(Family.class,"family");
		c.setFetchMode("employee",FetchMode.JOIN);
		c.createAlias("employee", "employee");
		c.add(Restrictions.eq("id", Id));
		Family empFamily = (Family)c.uniqueResult();
		return empFamily;
	}

}
