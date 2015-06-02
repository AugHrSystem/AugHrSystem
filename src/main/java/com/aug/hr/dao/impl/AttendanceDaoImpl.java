package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.AttendanceDao;
import com.aug.hr.entity.Attendance;
import com.aug.hr.entity.Reward;
import com.mysql.jdbc.StringUtils;


@Repository("AttendanceDao")
public class AttendanceDaoImpl extends GenericDaoImpl<Attendance, Integer> implements AttendanceDao{

	public AttendanceDaoImpl() {
		super(Attendance.class);

	}

	@Override
	public List<Attendance> findByCriteria(Attendance attendance) {
		Criteria c = getCurrentSession().createCriteria(Attendance.class);
		if (!StringUtils.isNullOrEmpty(attendance.getCard_no())) {
			c.add(Restrictions.like("card_no", "%" + attendance.getCard_no() + "%"));
		}
		return c.list();
	}
	
	

	@Override
	public Attendance deleteById(Integer id) {
		Attendance attendance = (Attendance)getCurrentSession().load(Attendance.class, id);
		getCurrentSession().delete(attendance);
		return attendance;
	}

}
