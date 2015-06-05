/**
 *
 * @author Preeyaporn
 * @date 3 มิ.ย. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.AllowancesDao;
import com.aug.hr.entity.Allowances;
import com.aug.hr.entity.dto.AllowancesDto;
import com.mysql.jdbc.StringUtils;

@Repository
public class AllowancesDaoImpl extends GenericDaoImpl<Allowances, Integer> implements AllowancesDao{

	public AllowancesDaoImpl() {
		super(Allowances.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Allowances> findByCriteria(Allowances allowances) {
		Criteria c = getCurrentSession().createCriteria(Allowances.class);
		if (!StringUtils.isNullOrEmpty(allowances.getName())) {
			c.add(Restrictions.like("name", "%" + allowances.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public Allowances deleteById(Integer id) {
		Allowances allowances =(Allowances)getCurrentSession().load(Allowances.class, id);
		getCurrentSession().delete(allowances);
		return allowances;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AllowancesDto> searchAllowances(Integer id) {
		Query namedQuery = getCurrentSession().getNamedQuery("searchAllowances").setInteger("empId" ,id);
		//namedQuery.executeUpdate();
		List<AllowancesDto> allowancesDtos = namedQuery.list();
	     return allowancesDtos;
	}

}
