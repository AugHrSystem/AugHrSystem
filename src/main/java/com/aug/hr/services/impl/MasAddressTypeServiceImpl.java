/**
 *
 * @author natechanok
 * @date Apr 29, 2015
 */

package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasAddressTypeDao;
import com.aug.hr.entity.MasAddressType;
import com.aug.hr.services.MasAddressTypeService;

@Service("MasAddressTypeService")
@Transactional
public class MasAddressTypeServiceImpl implements MasAddressTypeService{
	
	@Autowired
	private MasAddressTypeDao masAddressTypeDao;

	@Override
	public void create(MasAddressType masAddressType) {
		masAddressTypeDao.create(masAddressType);
		
	}

	@Override
	public void update(MasAddressType masAddressType) {
		masAddressTypeDao.update(masAddressType);
	}

	@Override
	public void delete(MasAddressType masAddressType) {
		masAddressTypeDao.delete(masAddressType);
		
	}


	@Override
	public List<MasAddressType> findAll() {
		return masAddressTypeDao.findAll();
	}

	@Override
	public MasAddressType findById(Integer Id) {
		return masAddressTypeDao.find(Id);
	}

	@Override
	public List<MasAddressType> findByCriteria(MasAddressType masAddressType) {
		return masAddressTypeDao.findByCriteria(masAddressType);
	}

	@Override
	public MasAddressType deleteById(Integer id) {
		return masAddressTypeDao.deleteById(id);
	}
	

}
