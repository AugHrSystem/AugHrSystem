package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.aug.hr.dao.MasSpecialtyDao;
import com.aug.hr.entity.MasSpecialty;
import com.mysql.jdbc.StringUtils;


@Repository("specialtyDao")
public class MasSpecialtyDaoImpl extends GenericDaoImpl<MasSpecialty, Integer> implements MasSpecialtyDao{

			public MasSpecialtyDaoImpl(){
				super(MasSpecialty.class);
			}

			

			@Override
			public List<MasSpecialty> findByCriteria(MasSpecialty specialty) {
				Criteria c = getCurrentSession().createCriteria(MasSpecialty.class);
				if (!StringUtils.isNullOrEmpty(specialty.getName())) {
					c.add(Restrictions.like("name", "%" + specialty.getName() + "%"));
				}
				return c.list();
			}

			@Override
			public MasSpecialty deleteById(Integer id) {
				MasSpecialty specialty =(MasSpecialty)getCurrentSession().load(MasSpecialty.class, id);
				getCurrentSession().delete(specialty);
				return specialty;
			}
}
