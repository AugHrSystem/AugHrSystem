package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.ExperienceDao;
import com.aug.hr.entity.Experience;
import com.mysql.jdbc.StringUtils;

@Repository
public class ExperienceDaoImpl extends GenericDaoImpl<Experience, Integer> implements ExperienceDao{

	public ExperienceDaoImpl() {
		super(Experience.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<Experience> findByCriteria(Experience experience){
		
		Criteria c = getCurrentSession().createCriteria(Experience.class);
		if (!StringUtils.isNullOrEmpty(experience.getName())) {
			c.add(Restrictions.like("name", "%" + experience.getName() + "%"));
		}
		return c.list();
		
	}
	
	@Override
	public Experience deleteById(Integer id){
		
		Experience experience =(Experience)getCurrentSession().load(Experience.class, id);
		getCurrentSession().delete(experience);
		return experience;
	}

}
