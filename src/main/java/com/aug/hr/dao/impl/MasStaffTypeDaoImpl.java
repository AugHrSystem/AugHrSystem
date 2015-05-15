package com.aug.hr.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasStaffTypeDao;
import com.aug.hr.entity.MasStaffType;

@Repository
public class MasStaffTypeDaoImpl extends GenericDaoImpl<MasStaffType, Integer> implements MasStaffTypeDao,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public MasStaffTypeDaoImpl() {
		super(MasStaffType.class);
	}

}
