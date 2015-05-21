package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Punish;

public interface PunishDao extends GenericDao<Punish, Integer> {

	
	public List<Punish> findByCriteria(Punish punish);

	public Punish deleteById(Integer id);

}
