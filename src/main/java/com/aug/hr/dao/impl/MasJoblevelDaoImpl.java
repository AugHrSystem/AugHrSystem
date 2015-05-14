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

import com.aug.hr.dao.MasJoblevelDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasJoblevel;
import com.aug.hr.entity.MasDegreetype;
import com.mysql.jdbc.StringUtils;


@Repository
public class MasJoblevelDaoImpl extends GenericDaoImpl<MasJoblevel,Integer> implements MasJoblevelDao{

	public MasJoblevelDaoImpl( ) {
		super(MasJoblevel.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<MasJoblevel> findByCriteria(MasJoblevel masJoblevel) {
		Criteria c = getCurrentSession().createCriteria(MasJoblevel.class);
		if (!StringUtils.isNullOrEmpty(masJoblevel.getName())) {
			c.add(Restrictions.like("Name", "%" + masJoblevel.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public MasJoblevel deleteById(Integer id) {
		MasJoblevel masJoblevel =(MasJoblevel)getCurrentSession().load(MasJoblevel.class, id);
		getCurrentSession().delete(masJoblevel);
		return masJoblevel;
	}

}
