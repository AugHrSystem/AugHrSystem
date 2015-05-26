/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.LeaveDao;
import com.aug.hr.entity.Leave;
import com.aug.hr.entity.dto.LeaveDto;
import com.mysql.jdbc.StringUtils;



@Repository
public class LeaveDaoImpl extends GenericDaoImpl<Leave, Integer> implements LeaveDao{

	public LeaveDaoImpl() {
		super(Leave.class);
		
	}

	@SuppressWarnings("unchecked")
	public List<Leave> findByCriteria(Leave leave) {
		Criteria c = getCurrentSession().createCriteria(Leave.class);
		if (!StringUtils.isNullOrEmpty(leave.getName())) {
			c.add(Restrictions.like("name", "%" + leave.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public Leave deleteById(Integer id) {
		Leave leave =(Leave)getCurrentSession().load(Leave.class, id);
		getCurrentSession().delete(leave);
		return leave;
	}

	@SuppressWarnings("unchecked")
	public List<LeaveDto> searchLeave(Integer id) {
		Query namedQuery = getCurrentSession().getNamedQuery("searchLeave").setInteger("empId" ,id);
		//namedQuery.executeUpdate();
		List<LeaveDto> leaveDto = namedQuery.list();
	     return leaveDto;

	}

	


}
