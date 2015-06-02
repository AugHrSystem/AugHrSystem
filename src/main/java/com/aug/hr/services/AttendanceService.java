package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Attendance;

public interface AttendanceService {
	
	public void create(Attendance attendance);
	public void update(Attendance attendance);
	public void delete(Attendance attendance);
	public Attendance findById(Integer id);
	public List<Attendance> findAll();
	public List<Attendance> findByCriteria(Attendance attendance);
	public Attendance deleteById(Integer id);

}
