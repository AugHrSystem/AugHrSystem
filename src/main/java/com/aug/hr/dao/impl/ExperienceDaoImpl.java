package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.ExperienceDao;
import com.aug.hr.entity.Experience;

@Repository
public class ExperienceDaoImpl extends GenericDaoImpl<Experience, Integer> implements ExperienceDao{

	public ExperienceDaoImpl() {
		super(Experience.class);
	}

}
