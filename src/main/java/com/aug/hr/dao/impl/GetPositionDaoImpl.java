/**
 *
 * @author Preeyaporn
 * @date 13 พ.ค. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.GetPositionDao;
import com.aug.hr.entity.GetPosition;
import com.mysql.jdbc.StringUtils;

@Repository
public class GetPositionDaoImpl extends GenericDaoImpl<GetPosition, Integer> implements GetPositionDao{

	public GetPositionDaoImpl() {
		super(GetPosition.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GetPosition> findByCriteria(GetPosition getPosition) {
		Criteria c = getCurrentSession().createCriteria(GetPosition.class);
		if (!StringUtils.isNullOrEmpty(getPosition.getPosition())) {
			c.add(Restrictions.like("position", "%" + getPosition.getPosition() + "%"));
		}
		return c.list();
	}

	@Override
	public GetPosition deleteById(Integer id) {
		GetPosition getPosition =(GetPosition)getCurrentSession().load(GetPosition.class, id);
		getCurrentSession().delete(getPosition);
		return getPosition;
	}

}
