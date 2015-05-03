/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasEmploymentDao;
import com.aug.hr.entity.MasEmployment;
import com.mysql.jdbc.StringUtils;

@Repository
public class MasEmploymentDaoImpl extends GenericDaoImpl<MasEmployment, Integer> implements MasEmploymentDao{

	public MasEmploymentDaoImpl() {
		super(MasEmployment.class);
		
	}

	@SuppressWarnings("unchecked")
	public List<MasEmployment> findByCriteria(MasEmployment masEmployment) {
		
		Criteria c = getCurrentSession().createCriteria(MasEmployment.class);
		if (!StringUtils.isNullOrEmpty(masEmployment.getName())) {
			c.add(Restrictions.like("name", "%" + masEmployment.getName() + "%"));
		}
		return c.list();
	}

	
	public MasEmployment deleteById(Integer id) {
		
		MasEmployment masEmployment =(MasEmployment)getCurrentSession().load(MasEmployment.class, id);
		getCurrentSession().delete(masEmployment);
		return masEmployment;
	}

	
}
