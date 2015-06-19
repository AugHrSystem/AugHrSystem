/**
 *
 * @author natechanok
 * @date Apr 28, 2015
 */

package com.aug.hr.services.impl;

import java.util.ArrayList;
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

	@Override
	public List<AddressDto> findAddressByEmployeeId(Integer id) {
		// TODO Auto-generated method stub
		
		List<Address> addressList = addressDao.findAddressByEmployeeId(id);
		List<AddressDto> addressDtoList = new ArrayList<AddressDto>();
		for(Address address:addressList){
			
		   AddressDto addressDto = new AddressDto();
		   addressDto.setId(address.getId());
		   addressDto.setAddress1(address.getAddress1());
		   addressDto.setAddress2(address.getAddress2());
		   addressDto.setAddressTypeId(address.getAddressType().getId());
		   addressDto.setEmployeeId(id);
		   addressDto.setMasaddresstypeName(address.getAddressType().getName());
		   addressDto.setMasprovinceId(address.getProvince().getId());
		   addressDto.setMasprovinceName(address.getProvince().getName());
		   addressDto.setZipcode(address.getZipcode());
		   
		   addressDtoList.add(addressDto);
			
		}
		return addressDtoList;
	}

	@Override
	public List<AddressDto> searchAddress(Integer id) {
		// TODO Auto-generated method stub
		return addressDao.searchAddress(id);
	}

	@Override
	public void deleteAddressByNameQuery(Integer id) {
		// TODO Auto-generated method stub
		addressDao.deleteAddressByNameQuery(id);
		
	}
	

}
