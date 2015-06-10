/**
 *
 * @author Pranrajit
 * @date 13 พ.ค. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasLocationDao;
import com.aug.hr.entity.MasLocation;
import com.aug.hr.services.MasLocationService;


@Service("masLocationService")
@Transactional
public class MasLocationServiceImpl implements MasLocationService{

	@Autowired
	private MasLocationDao masLocationDao;
	
	@Override
	public void create(MasLocation masLocation) {
		masLocationDao.create(masLocation);
		
	}

	@Override
	public void update(MasLocation masLocation) {
		masLocationDao.update(masLocation);
		
	}

	@Override
	public void delete(MasLocation masLocation) {
		masLocationDao.delete(masLocation);
		
	}

	@Override
	public MasLocation find(Integer id) {
		
		return masLocationDao.find(id);
	}

	@Override
	public List<MasLocation> findAll() {
		
		return masLocationDao.findAll();
	}

	@Override
	public List<MasLocation> findByCriteria(MasLocation masLocation) {
		
		return masLocationDao.findByCriteria(masLocation);
	}

	@Override
	public MasLocation deleteById(Integer id) {
		
		return masLocationDao.deleteById(id);
	}

	@Override
	public MasLocation findByLocationCode(String locationCode) {
		
		return masLocationDao.findByLocationCode(locationCode);
	}

}
