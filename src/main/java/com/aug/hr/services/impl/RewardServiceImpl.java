package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.RewardDao;
import com.aug.hr.entity.Reward;
import com.aug.hr.services.RewardService;



@Service("RewardService")
@Transactional
public class RewardServiceImpl implements RewardService {
	
	@Autowired
	private RewardDao rewardDao;

	
	@Override
	public List<Reward> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void create(Reward reward) {
		rewardDao.create(reward);
		
	}

	@Override
	public void update(Reward reward) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Reward reward) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Reward findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reward> findByCriteria(Reward reward) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reward deleteById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
