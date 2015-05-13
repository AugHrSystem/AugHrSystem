package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Reward;


public interface RewardService { 
	
	
	
	public List<Reward> findAll();
	public void create(Reward reward);
	public void update(Reward  reward);
	public void delete(Reward  reward);
	public Reward  findById(Integer id);
	public List<Reward> findByCriteria(Reward  reward);
	public Reward deleteById(Integer id);
	

}
