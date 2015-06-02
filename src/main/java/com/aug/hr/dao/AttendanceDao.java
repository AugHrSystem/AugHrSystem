package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Attendance;


public interface AttendanceDao extends GenericDao<Attendance, Integer>{

	public List<Attendance> findByCriteria(Attendance attendance);

	public Attendance deleteById(Integer id);
	
	//public List<AttendanceDto> searchAttendance(Integer id);

	

}
