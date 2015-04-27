package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasTechnology;

public interface masTechnologyService {
	
	public void create(MasTechnology masTechnology);
	public void update(MasTechnology masTechnology);
	public void delete(MasTechnology masTechnology);
	public MasTechnology find(Integer Id);
	public List<MasTechnology> findAll();
	

}
