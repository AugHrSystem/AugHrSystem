package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasTechnologyDao;
import com.aug.hr.entity.MasTechnology;

@Repository
public class MasTechnologyDaoImpl extends GenericDaoImpl<MasTechnology, Integer> implements MasTechnologyDao{

	public MasTechnologyDaoImpl() {
		super(MasTechnology.class);
		// TODO Auto-generated constructor stub
	}

	
}
