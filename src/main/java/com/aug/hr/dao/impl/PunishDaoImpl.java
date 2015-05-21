package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.aug.hr.dao.PunishDao;
import com.aug.hr.entity.Punish;
import com.mysql.jdbc.StringUtils;

public class PunishDaoImpl extends GenericDaoImpl<Punish, Integer>implements PunishDao {

	
	public PunishDaoImpl() {
		super(Punish.class);
		
	}

	@Override
	public List<Punish> findByCriteria(Punish punish) {
		Criteria c = getCurrentSession().createCriteria(Punish.class);
		if (!StringUtils.isNullOrEmpty(punish.getDescription())) {
			c.add(Restrictions.like("Description", "%" + punish.getDescription() + "%"));
		}
		return c.list();
	}

	@Override
	public Punish deleteById(Integer id) {
		Punish punish =(Punish)getCurrentSession().load(Punish.class, id);
		getCurrentSession().delete(punish);
		return punish;
	}

}
