package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasTechnologyDao;
import com.aug.hr.entity.MasTechnology;
import com.aug.hr.services.masTechnologyService;

@Service
@Transactional
public class MasTechnologyServiceImpl implements masTechnologyService{

	@Autowired
	private MasTechnologyDao masTechDao;
	
	
	
	@Override
	public void create(MasTechnology masTechnology) {
		// TODO Auto-generated method stub
		masTechDao.create(masTechnology);
		
	}

	@Override
	public void update(MasTechnology masTechnology) {
		// TODO Auto-generated method stub
		masTechDao.update(masTechnology);
	}

	@Override
	public MasTechnology find(Integer id) {
		// TODO Auto-generated method stub
		MasTechnology mastech = masTechDao.find(id);
		return mastech;
	}
	
	@Override
	public void delete(MasTechnology masTechnology) {
		// TODO Auto-generated method stub
		masTechDao.delete(masTechnology);
	}

	@Override
	public List<MasTechnology> findAll() {
		// TODO Auto-generated method stub
		List<MasTechnology> mastech = masTechDao.findAll();
		return mastech;
	}

}
