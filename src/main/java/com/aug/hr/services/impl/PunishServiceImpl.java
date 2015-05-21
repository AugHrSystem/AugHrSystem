package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.PunishDao;
import com.aug.hr.entity.Punish;
import com.aug.hr.services.PunishService;

@Service("PunishService")
@Transactional
public class PunishServiceImpl implements PunishService {
	
	@Autowired
	private  PunishDao punishDao;


	@Override
	public void create(Punish punish) {
		punishDao.create(punish);
		
	}

	@Override
	public void update(Punish punish) {
		punishDao.update(punish);
		
	}

	@Override
	public void delete(Punish punish) {
		punishDao.delete(punish);
		
	}

	@Override
	public Punish findById(Integer id) {
		return punishDao.find(id);
	}

	@Override
	public List<Punish> findAll() {
		return punishDao.findAll();
	}

	@Override
	public List<Punish> findByCriteria(Punish punish) {
		return punishDao.findByCriteria(punish);
	}

	@Override
	public Punish deleteById(Integer id) {
		return punishDao.deleteById(id);
	}

	@Override
	public List<Punish> findAll(Integer id) {
		return punishDao.findAll();
	}
	
	

}
