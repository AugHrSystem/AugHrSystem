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
	public List<Family> findEmployeeByOfficial(Integer Id) {
		// TODO Auto-generated method stub
		
		Criteria c = getCurrentSession().createCriteria(Family.class,"family");		
		c.setFetchMode("official",FetchMode.JOIN);
		c.createAlias("official", "official");
		c.setFetchMode("official.empOfficial",FetchMode.JOIN);
		c.createAlias("official.empOfficial", "employee");
		c.add(Restrictions.eq("family.official.id", Id));
		c.add(Restrictions.eq("employee.official.id", Id));
	  
		return c.list();
		
	}

	
	

	@Override
	public Official findOfficialById(Integer Id) {
		// TODO Auto-generated method stub
		Official official = (Official) getCurrentSession().get(Official.class,Id);
		return official;
	}

	
	
	@Override
	public Family findLastFamily(Integer Id) {
		// TODO Auto-generated method stub
		Criteria c = getCurrentSession().createCriteria(Family.class,"family");
		c.setFetchMode("official",FetchMode.JOIN);
		c.createAlias("official", "official");
		c.add(Restrictions.eq("id", Id));
		Family empFamily = (Family)c.uniqueResult();
		return empFamily;
	}

}
