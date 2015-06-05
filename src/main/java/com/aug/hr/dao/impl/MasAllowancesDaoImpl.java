/**
 *
 * @author Preeyaporn
 * @date 5 มิ.ย. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasAllowancesDao;
import com.aug.hr.entity.MasAllowances;
import com.mysql.jdbc.StringUtils;

@Repository
public class MasAllowancesDaoImpl extends GenericDaoImpl<MasAllowances, Integer> implements MasAllowancesDao{

	public MasAllowancesDaoImpl() {
		super(MasAllowances.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MasAllowances> findByCriteria(MasAllowances masAllowances) {
		Criteria c = getCurrentSession().createCriteria(MasAllowances.class);
		if (!StringUtils.isNullOrEmpty(masAllowances.getName())) {
			c.add(Restrictions.like("Name", "%" + masAllowances.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public MasAllowances deleteById(Integer id) {
		MasAllowances masAllowances =(MasAllowances)getCurrentSession().load(MasAllowances.class, id);
		getCurrentSession().delete(masAllowances);
		return masAllowances;
	}

}
