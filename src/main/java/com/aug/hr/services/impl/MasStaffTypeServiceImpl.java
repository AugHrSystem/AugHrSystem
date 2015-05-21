package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasStaffTypeDao;
import com.aug.hr.entity.MasStaffType;
import com.aug.hr.services.MasStaffTypeService;

@Service("masStaffTypeService")
@Transactional
public class MasStaffTypeServiceImpl implements MasStaffTypeService{
	
	@Autowired
	private MasStaffTypeDao masStaffTypeDao;

	@Override
	public void create(MasStaffType masStaffType) {
		masStaffTypeDao.create(masStaffType);
		
	}

	@Override
	public void update(MasStaffType masStaffType) {
		masStaffTypeDao.update(masStaffType);
		
	}

	@Override
	public void delete(MasStaffType masStaffType) {
		masStaffTypeDao.delete(masStaffType);
		
	}

	@Override
	public MasStaffType find(Integer Id) {
			return masStaffTypeDao.find(Id);
	}

	@Override
	public List<MasStaffType> findAll() {
		return masStaffTypeDao.findAll();
	}

	

}
