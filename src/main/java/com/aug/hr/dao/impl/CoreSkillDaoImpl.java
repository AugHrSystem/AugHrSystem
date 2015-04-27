package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.CoreSkillDao;
import com.aug.hr.entity.CoreSkill;
@Repository
public class CoreSkillDaoImpl extends GenericDaoImpl<CoreSkill, Integer> implements CoreSkillDao{

	public CoreSkillDaoImpl() {
		super(CoreSkill.class);
	}

}
