/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Address;
import com.aug.hr.entity.dto.AddressDto;



public interface AddressDao extends GenericDao<Address, Integer>{
	
	public List<Address> findByCriteria(Address address);

	public Address deleteById(Integer id);
	
	public List<AddressDto> searchAddress(Integer id);
	public void saveAddressByNameQuery(AddressDto addressDto);
	public List<Address> findAddressByEmployeeId(Integer id);
	

}
