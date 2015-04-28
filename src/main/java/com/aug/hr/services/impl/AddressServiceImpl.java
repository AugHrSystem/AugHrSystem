/**
 *
 * @author natechanok
 * @date Apr 28, 2015
 */

package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AddressDao;
import com.aug.hr.entity.Address;
import com.aug.hr.services.AddressService;

@Service
@Transactional
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressDao addressDao;
	
	@Override
	public void create(Address address) {
		// TODO Auto-generated method stub
		addressDao.create(address);
		
	}

	@Override
	public void update(Address address) {
		// TODO Auto-generated method stub
		addressDao.update(address);
		
	}

	@Override
	public void delete(Address address) {
		// TODO Auto-generated method stub
		addressDao.delete(address);
		
	}

	@Override
	public Address find(Integer Id) {
		// TODO Auto-generated method stub
		Address address = addressDao.find(Id);
		return address;
	}

	@Override
	public List<Address> findAll() {
		// TODO Auto-generated method stub
		List<Address> addressList = addressDao.findAll();
		return addressList;
	}
	

}
