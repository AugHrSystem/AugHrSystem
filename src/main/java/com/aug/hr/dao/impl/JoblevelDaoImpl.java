/**
 *
 * @author Pranrajit
 * @date 11 พ.ค. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.JoblevelDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Joblevel;
import com.aug.hr.entity.MasDegreetype;
import com.mysql.jdbc.StringUtils;


@Repository
public class JoblevelDaoImpl extends GenericDaoImpl<Joblevel,Integer> implements JoblevelDao{

	public JoblevelDaoImpl( ) {
		super(Joblevel.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Joblevel> findByCriteria(Joblevel joblevel) {
		Criteria c = getCurrentSession().createCriteria(Joblevel.class);
		if (!StringUtils.isNullOrEmpty(joblevel.getName())) {
			c.add(Restrictions.like("Name", "%" + joblevel.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public Joblevel deleteById(Integer id) {
		Joblevel joblevel =(Joblevel)getCurrentSession().load(Joblevel.class, id);
		getCurrentSession().delete(joblevel);
		return joblevel;
	}

}
