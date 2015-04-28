package com.aug.hr.dao.impl;


import java.io.Serializable;
import java.util.List;

import javax.persistence.criteria.Fetch;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.EmpFamilyDao;
import com.aug.hr.entity.EmpFamily;

@Repository
public class EmpFamilyDaoImpl extends GenericDaoImpl<EmpFamily, Integer> implements EmpFamilyDao,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public EmpFamilyDaoImpl() {
		super(EmpFamily.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<EmpFamily> findAllEmpAndEmp() {
		// TODO Auto-generated method stub
		Criteria c = getCurrentSession().createCriteria(EmpFamily.class);
		c.setFetchMode("employee",FetchMode.JOIN);
		return c.list();
	}

}
