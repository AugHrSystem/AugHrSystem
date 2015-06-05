/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasDegreetypeDao;
import com.aug.hr.entity.Ability;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasDegreetype;
import com.mysql.jdbc.StringUtils;


@Repository
public class MasDegreetypeDaoImpl extends GenericDaoImpl<MasDegreetype,Integer> implements MasDegreetypeDao{

	public MasDegreetypeDaoImpl() {
		super(MasDegreetype.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<MasDegreetype> findByCriteria(MasDegreetype masDegreetype) {
		Criteria c = getCurrentSession().createCriteria(MasDegreetype.class);
		if (!StringUtils.isNullOrEmpty(masDegreetype.getName())) {
			c.add(Restrictions.like("Name", "%" + masDegreetype.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public MasDegreetype deleteById(Integer id) {
		MasDegreetype masDegreetype =(MasDegreetype)getCurrentSession().load(MasDegreetype.class, id);
		getCurrentSession().delete(masDegreetype);
		return masDegreetype;
	}

}
