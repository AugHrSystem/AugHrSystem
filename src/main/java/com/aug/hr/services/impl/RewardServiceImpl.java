package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.RewardDao;
import com.aug.hr.entity.Reward;
import com.aug.hr.services.RewardService;



@Service("rewardService")
@Transactional
public class RewardServiceImpl implements RewardService {
	
	@Autowired
	private RewardDao rewardDao;

	
	@Override
	public List<Reward> findAll() {
		return rewardDao.findAll();
	}

	@Override
	public void create(Reward reward) {
		rewardDao.create(reward);
		
	}

	@Override
	public void update(Reward reward) {
		rewardDao.update(reward);
		
	}

	@Override
	public void delete(Reward reward) {
		rewardDao.delete(reward);
		
	}

	@Override
	public Reward findById(Integer id) {
		return rewardDao.find(id);
	}

	@Override
	public List<Reward> findByCriteria(Reward reward) {
		return rewardDao.findByCriteria(reward);
	}

	@Override
	public Reward deleteById(Integer id) {
		return rewardDao.deleteById(id);
	}

}
