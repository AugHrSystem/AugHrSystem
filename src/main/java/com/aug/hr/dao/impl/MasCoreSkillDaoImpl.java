package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasCoreSkillDao;
import com.aug.hr.entity.Experience;
import com.aug.hr.entity.MasCoreSkill;
import com.mysql.jdbc.StringUtils;
@Repository
public class MasCoreSkillDaoImpl extends GenericDaoImpl<MasCoreSkill, Integer> implements MasCoreSkillDao{

	public MasCoreSkillDaoImpl() {
		super(MasCoreSkill.class);
	}

	@Override
	public List<MasCoreSkill> findByCriteria(MasCoreSkill masCoreSkill) {
		Criteria c = getCurrentSession().createCriteria(Experience.class);
		if (!StringUtils.isNullOrEmpty(masCoreSkill.getName())) {
			c.add(Restrictions.like("name", "%" + masCoreSkill.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public MasCoreSkill deleteById(Integer id) {
		MasCoreSkill masCoreSkill =(MasCoreSkill)getCurrentSession().load(MasCoreSkill.class, id);
		getCurrentSession().delete(masCoreSkill);
		return masCoreSkill;
		}
	

}
