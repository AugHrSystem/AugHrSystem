package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasRelationTypeDao;
import com.aug.hr.entity.MasRelationType;
import com.aug.hr.services.MasRelationTypeService;


@Service
@Transactional
public class MasRelationTypeServiceImpl implements MasRelationTypeService{
	
	@Autowired
	private MasRelationTypeDao masRelationTypeDao;

	@Override
	public void create(MasRelationType masRelationType) {
		// TODO Auto-generated method stub
		masRelationTypeDao.create(masRelationType);
	}

	@Override
	public void update(MasRelationType masRelationType) {
		// TODO Auto-generated method stub
		masRelationTypeDao.update(masRelationType);
	}

	@Override
	public void delete(MasRelationType masRelationType) {
		// TODO Auto-generated method stub
		masRelationTypeDao.delete(masRelationType);
	}

	@Override
	public MasRelationType find(Integer Id) {
		// TODO Auto-generated method stub
		MasRelationType masRelationType = masRelationTypeDao.find(Id);
		return masRelationType;
	}

	@Override
	public List<MasRelationType> findAll() {
		// TODO Auto-generated method stub
		List<MasRelationType> masRelationTypeList = masRelationTypeDao.findAll();
		return masRelationTypeList;
	}

	@Override
	public MasRelationType findByName(String name) {
		// TODO Auto-generated method stub
		MasRelationType masRelation = masRelationTypeDao.findByName(name);
		return masRelation;
	}

}
