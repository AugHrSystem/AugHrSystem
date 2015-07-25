package com.aug.hr.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.HealthDao;
import com.aug.hr.entity.Health;
import com.aug.hr.entity.dto.Family2Dto;
import com.aug.hr.entity.dto.HealthDto;

@Repository
public class HealthDaoImpl extends GenericDaoImpl<Health, Integer> implements HealthDao,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public HealthDaoImpl() {
		super(Health.class);
	}

	
	@Override
	public List<HealthDto> listHealth(Integer id) {
		// TODO Auto-generated method stub
		Query query =  getCurrentSession().getNamedQuery("listHealth").setInteger("empId" ,id);
		List<HealthDto> healthDtoList = query.list();
		return healthDtoList;
	}


	@Override
	public Health findByEmployeeId(Integer id) {
		// TODO Auto-generated method stub
		Criteria c = getCurrentSession().createCriteria(Health.class,"health");
		c.setFetchMode("employee",FetchMode.JOIN);
		c.createAlias("employee", "employee");
		c.add(Restrictions.eq("health.employee.id", id));
		return (Health) c.uniqueResult();
	}

}
