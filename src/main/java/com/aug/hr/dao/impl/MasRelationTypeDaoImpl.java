package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasRelationTypeDao;
import com.aug.hr.entity.MasRelationType;

@Repository
public class MasRelationTypeDaoImpl extends GenericDaoImpl<MasRelationType, Integer> implements MasRelationTypeDao{

	public MasRelationTypeDaoImpl() {
		super(MasRelationType.class);
		// TODO Auto-generated constructor stub
	}
	
	

}
