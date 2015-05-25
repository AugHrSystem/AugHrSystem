/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasLeaveTypeDao;
import com.aug.hr.entity.MasLeaveType;
import com.mysql.jdbc.StringUtils;


@Repository
public class MasLeaveTypeDaoImpl extends GenericDaoImpl<MasLeaveType,Integer> implements MasLeaveTypeDao{

	public MasLeaveTypeDaoImpl() {
		super(MasLeaveType.class);
		// TODO Auto-generated constructor stub
	}
	@Override
	public List<MasLeaveType> findByCriteria(MasLeaveType masLeaveType) {
		Criteria c = getCurrentSession().createCriteria(MasLeaveType.class);
		if (!StringUtils.isNullOrEmpty(masLeaveType.getName())) {
			c.add(Restrictions.like("Name", "%" + masLeaveType.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public MasLeaveType deleteById(Integer id) {
		MasLeaveType masLeaveType =(MasLeaveType)getCurrentSession().load(MasLeaveType.class, id);
		getCurrentSession().delete(masLeaveType);
		return masLeaveType;
	}

		

}
