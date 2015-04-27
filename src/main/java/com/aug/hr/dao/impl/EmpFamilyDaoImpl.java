package com.aug.hr.dao.impl;


import java.io.Serializable;

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

}
