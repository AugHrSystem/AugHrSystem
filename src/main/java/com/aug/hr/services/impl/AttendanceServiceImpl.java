package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AttendanceDao;
import com.aug.hr.entity.Attendance;
import com.aug.hr.services.AttendanceService;


@Service("attendanceService")
@Transactional
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceDao attendanceDao;
	
	@Override
	public List<Attendance> findAll() {
		return attendanceDao.findAll();
	}

	
	
	@Override
	public void create(Attendance attendance) {
		attendanceDao.create(attendance);
		
	}

	@Override
	public void update(Attendance attendance) {
		attendanceDao.update(attendance);
		
	}

	@Override
	public void delete(Attendance attendance) {
		attendanceDao.delete(attendance);
		
	}

	@Override
	public Attendance findById(Integer id) {
		return attendanceDao.find(id);
	}

	
	@Override
	public List<Attendance> findByCriteria(Attendance attendance) {
		return attendanceDao.findByCriteria(attendance);
	}

	@Override
	public Attendance deleteById(Integer id) {
		return attendanceDao.deleteById(id);
	}

}
