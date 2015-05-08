package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.MasCoreSkill;

public interface MasCoreSkillDao extends GenericDao<MasCoreSkill, Integer> {

	public List<MasCoreSkill> findByCriteria(MasCoreSkill masCoreSkill);

	public MasCoreSkill deleteById(Integer id);

}
