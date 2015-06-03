/**
 *
 * @author Preeyaporn
 * @date 3 มิ.ย. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.AllowancesDao;
import com.aug.hr.entity.Allowances;
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
		if (!StringUtils.isNullOrEmpty(allowances.getAllowances_type())) {
			c.add(Restrictions.like("name", "%" + allowances.getAllowances_type() + "%"));
		}
		return c.list();
	}

	@Override
	public Allowances deleteById(Integer id) {
		Allowances allowances =(Allowances)getCurrentSession().load(Allowances.class, id);
		getCurrentSession().delete(allowances);
		return allowances;
	}

//	@SuppressWarnings("unchecked")
//	public List<EducationDto> searchEducation(Integer id) {
//		Query namedQuery = getCurrentSession().getNamedQuery("searchEducation").setInteger("empId" ,id);
//		//namedQuery.executeUpdate();
//		List<EducationDto> eduDto = namedQuery.list();
//	     return eduDto;
//	}
}
