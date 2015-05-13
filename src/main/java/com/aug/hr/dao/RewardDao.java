package com.aug.hr.dao;


import java.util.List;

import com.aug.hr.entity.Reward;

public interface RewardDao extends GenericDao<Reward, Integer>{

	public List<Reward> findByCriteria(Reward reward);
	public Reward deleteById(Integer id);

	
}
