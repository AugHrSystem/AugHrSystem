package com.aug.hr.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.TechnologyEmpDao;
import com.aug.hr.entity.TechnologyEmp;

@Repository
public class TechnologyEmpDaoImpl extends GenericDaoImpl<TechnologyEmp, Integer> implements TechnologyEmpDao,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public TechnologyEmpDaoImpl() {
		super(TechnologyEmp.class);
		
	}

}
