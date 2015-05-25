/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.aug.hr.dao.LeaveDao;
import com.aug.hr.entity.Leave;
import com.aug.hr.services.LeaveService;

public class LeaveServiceImpl implements LeaveService {

	
	@Autowired private LeaveDao leaveDao;
	
	@Override
	public List<Leave> findAll() {
		
		return leaveDao.findAll();
	}

	@Override
	public void create(Leave leave) {
		leaveDao.create(leave);
		
	}

	@Override
	public void update(Leave leave) {
		leaveDao.update(leave);
		
	}

	@Override
	public void delete(Leave leave) {
		leaveDao.delete(leave);
		
	}

	@Override
	public Leave findById(Integer id) {
		
		return leaveDao.find(id);
	}

	@Override
	public List<Leave> findByCriteria(Leave leave) {
		
		return leaveDao.findByCriteria(null);
	}

	@Override
	public Leave deleteById(Integer id) {
		
		return leaveDao.deleteById(id);
	}

}
