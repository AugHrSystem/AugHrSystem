/**
 *
 * @author Pranrajit
 * @date 13 พ.ค. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasLocationDao;

import com.aug.hr.entity.MasLocation;
import com.mysql.jdbc.StringUtils;



@Repository
public class MasLocationDaoImpl  extends GenericDaoImpl<MasLocation,Integer> implements MasLocationDao{

	public MasLocationDaoImpl() {
		super(MasLocation.class);
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public List<MasLocation> findByCriteria(MasLocation masLocation) {
		Criteria c = getCurrentSession().createCriteria(MasLocation.class);
		if (!StringUtils.isNullOrEmpty(masLocation.getName())) {
			c.add(Restrictions.like("Name", "%" + masLocation.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public MasLocation deleteById(Integer id) {
		MasLocation masLocation =(MasLocation)getCurrentSession().load(MasLocation.class, id);
		getCurrentSession().delete(masLocation);
		return masLocation;
	}

}
