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
import com.aug.hr.entity.dto.AddressDto;
import com.aug.hr.services.AddressService;

@Service("addressService")
@Transactional
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressDao addressDao;
	
	@Override
	public void create(Address address) {
		addressDao.create(address);
		
	}

	@Override
	public void update(Address address) {
		addressDao.update(address);
		
	}

	@Override
	public void delete(Address address) {
		addressDao.delete(address);
		
	}


	@Override
	public List<Address> findAll() {
		return addressDao.findAll();
	}

	@Override
	public Address findById(Integer Id) {
		return addressDao.find(Id);
	}

	@Override
	public List<Address> findByCriteria(Address address) {
		return addressDao.findByCriteria(address);
	}

	@Override
	public Address deleteById(Integer id) {
		return addressDao.deleteById(id);
	}

	@Override
	public Address find(Integer Id) {
		return addressDao.find(Id);
	}

	@Override
	public void saveAddressByNameQuery(AddressDto addressDto) {
		// TODO Auto-generated method stub
		addressDao.saveAddressByNameQuery(addressDto);
	}
	

}
