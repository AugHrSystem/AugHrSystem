package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasRelationType;


public interface MasRelationTypeService {
	
	public void create(MasRelationType masRelationType);
	public void update(MasRelationType masRelationType);
	public void delete(MasRelationType masRelationType);
	public MasRelationType find(Integer Id);
	public List<MasRelationType> findAll();

}
