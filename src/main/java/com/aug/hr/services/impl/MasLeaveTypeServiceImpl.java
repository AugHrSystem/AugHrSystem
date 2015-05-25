/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasLeaveTypeDao;
import com.aug.hr.entity.MasLeaveType;
import com.aug.hr.services.MasLeaveTypeService;

@Service("masLeaveTypeService")
@Transactional
public class MasLeaveTypeServiceImpl implements MasLeaveTypeService{

	
	@Autowired private MasLeaveTypeDao masLeaveTypeDao;
	
	@Override
	public void create(MasLeaveType masLeaveType) {
		masLeaveTypeDao.create(masLeaveType);
		
	}

	@Override
	public void update(MasLeaveType masLeaveType) {
	 masLeaveTypeDao.update(masLeaveType);	
	}

	@Override
	public void delete(MasLeaveType masLeaveType) {
		masLeaveTypeDao.delete(masLeaveType);
		
	}

	@Override
	public MasLeaveType find(Integer id) {
		
		return masLeaveTypeDao.find(id);
	}

	@Override
	public List<MasLeaveType> findAll() {
		
		return masLeaveTypeDao.findAll();
	}

	@Override
	public List<MasLeaveType> findByCriteria(MasLeaveType masLeaveType) {
		
		return masLeaveTypeDao.findByCriteria(masLeaveType);
	}

	@Override
	public MasLeaveType deleteById(Integer id) {
		
		return masLeaveTypeDao.deleteById(id);
	}

	
}
