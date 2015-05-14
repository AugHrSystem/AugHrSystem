package com.aug.hr.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasRelationTypeDao;
import com.aug.hr.entity.MasRelationType;

@Repository
public class MasRelationTypeDaoImpl extends GenericDaoImpl<MasRelationType, Integer> implements MasRelationTypeDao{

	public MasRelationTypeDaoImpl() {
		super(MasRelationType.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public MasRelationType findByName(String name) {
		// TODO Auto-generated method stub
		Criteria c = getCurrentSession().createCriteria(MasRelationType.class);
		c.add(Restrictions.eq("relationType", name));
		MasRelationType masRelation = (MasRelationType) c.uniqueResult();
		return masRelation;
	}
	
	

}
