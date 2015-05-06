package com.aug.hr.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.TechnologyEmployeeDao;
import com.aug.hr.entity.TechnologyEmployee;

@Repository
public class TechnologyEmployeeDaoImpl extends GenericDaoImpl<TechnologyEmployee, Integer> implements TechnologyEmployeeDao,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public TechnologyEmployeeDaoImpl() {
		super(TechnologyEmployee.class);
		
	}

}
