package com.aug.hr.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.SkillLanguageDao;
import com.aug.hr.entity.SkillLanguage;

@Repository
public class SkillLanguageDaoImpl extends GenericDaoImpl<SkillLanguage,Integer> implements SkillLanguageDao,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SkillLanguageDaoImpl() {
		super(SkillLanguage.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<SkillLanguage> findAllByEmployee(Integer IdEmployee) {
		// TODO Auto-generated method stub
		Criteria c = getCurrentSession().createCriteria(SkillLanguage.class,"skillLanguage");
		c.setFetchMode("employee",FetchMode.JOIN);
		c.createAlias("employee", "employee");
		c.setFetchMode("masSkillLanguage",FetchMode.JOIN);		
		return c.list();
	}

}
