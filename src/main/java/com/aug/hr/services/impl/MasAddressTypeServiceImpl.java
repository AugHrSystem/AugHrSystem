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
import com.aug.hr.entity.MasEmployment;
import com.aug.hr.services.MasAddressTypeService;

@Service
@Transactional
public class MasAddressTypeServiceImpl implements MasAddressTypeService{
	
	@Autowired
	private MasAddressTypeDao masAddressTypeDao;

	@Override
	public void create(MasAddressType masAddressType) {
		// TODO Auto-generated method stub
		masAddressTypeDao.create(masAddressType);
		
	}

	@Override
	public void update(MasAddressType masAddressType) {
		// TODO Auto-generated method stub
		masAddressTypeDao.update(masAddressType);
	}

	@Override
	public void delete(MasAddressType masAddressType) {
		// TODO Auto-generated method stub
		masAddressTypeDao.delete(masAddressType);
		
	}

	@Override
	public MasAddressType find(Integer Id) {
		// TODO Auto-generated method stub
		MasAddressType masAddressType = masAddressTypeDao.find(Id);
		return masAddressType;
	}

	@Override
	public List<MasAddressType> findAll() {
		// TODO Auto-generated method stub
		List<MasAddressType> masAddressType = masAddressTypeDao.findAll();
		return masAddressType;
	}
	

}
