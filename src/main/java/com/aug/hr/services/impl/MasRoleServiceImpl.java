package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasRoleDao;
import com.aug.hr.entity.MasRole;
import com.aug.hr.services.MasRoleService;

@Service("masRoleService")
@Transactional
public class MasRoleServiceImpl implements MasRoleService{

	@Autowired
	private MasRoleDao masRoleDao;

	@Override
	public void create(MasRole masRole) {
		masRoleDao.create(masRole);
		
	}

	@Override
	public void update(MasRole masRole) {
		masRoleDao.update(masRole);
		
	}

	@Override
	public void delete(MasRole masRole) {
		masRoleDao.delete(masRole);
		
	}

	@Override
	public MasRole find(Integer id) {
		return masRoleDao.find(id);
	}

	@Override
	public List<MasRole> findAll() {
		return masRoleDao.findAll();
	}

	@Override
	public MasRole deleteById(Integer id) {
		return masRoleDao.deleteById(id);
	}
	
}
