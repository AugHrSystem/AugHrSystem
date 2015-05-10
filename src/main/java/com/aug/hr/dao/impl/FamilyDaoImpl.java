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
import com.aug.hr.entity.Official;

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
	public List<Family> findFamilyByEmployeeId(Integer Id) {
		// TODO Auto-generated method stub
		
		Criteria c = getCurrentSession().createCriteria(Family.class,"family");		
		c.setFetchMode("employee",FetchMode.JOIN);
		c.createAlias("employee", "employee");
		c.setFetchMode("masRelation",FetchMode.JOIN);
		c.createAlias("masRelation", "masRelation");
		c.add(Restrictions.eq("family.employee.id", Id));
	  
		return c.list();
		
	}

	
	

	@Override
	public Employee findEmployeeById(Integer Id) {
		// TODO Auto-generated method stub
		Employee employee = (Employee) getCurrentSession().get(Employee.class,Id);
		return employee;
	}

	
	
	@Override
	public Family findLastFamily(Integer Id) {
		// TODO Auto-generated method stub
		Criteria c = getCurrentSession().createCriteria(Family.class,"family");
		c.setFetchMode("employee",FetchMode.JOIN);
		c.createAlias("employee", "employee");
		c.setFetchMode("masRelation",FetchMode.JOIN);
		c.createAlias("masRelation", "masRelation");
		c.add(Restrictions.eq("id", Id));
		Family empFamily = (Family)c.uniqueResult();
		return empFamily;
	}

}
