package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Punish;


public interface PunishService {
		
	public void create(Punish punish);
	public void update(Punish punish);
	public void delete(Punish punish);
	public Punish findById(Integer id);
	public List<Punish> findAll();
	public List<Punish> findByCriteria(Punish punish);
	public Punish deleteById(Integer id);
	
}
