package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.aug.hr.dao.SpecialtyDao;
import com.aug.hr.entity.Specialty;
import com.mysql.jdbc.StringUtils;


@Repository("specialtyDao")
public class SpecialtyDaoImpl extends GenericDaoImpl<Specialty, Integer> implements SpecialtyDao{

			public SpecialtyDaoImpl(){
				super(Specialty.class);
			}

			

			@Override
			public List<Specialty> findByCriteria(Specialty specialty) {
				Criteria c = getCurrentSession().createCriteria(Specialty.class);
				if (!StringUtils.isNullOrEmpty(specialty.getName())) {
					c.add(Restrictions.like("name", "%" + specialty.getName() + "%"));
				}
				return c.list();
			}

			@Override
			public Specialty deleteById(Integer id) {
				Specialty specialty =(Specialty)getCurrentSession().load(Specialty.class, id);
				getCurrentSession().delete(specialty);
				return specialty;
			}
}
