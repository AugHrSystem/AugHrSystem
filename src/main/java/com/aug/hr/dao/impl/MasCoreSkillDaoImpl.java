package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasCoreSkillDao;
import com.aug.hr.entity.MasCoreSkill;
@Repository
public class MasCoreSkillDaoImpl extends GenericDaoImpl<MasCoreSkill, Integer> implements MasCoreSkillDao{

	public MasCoreSkillDaoImpl() {
		super(MasCoreSkill.class);
	}

}
