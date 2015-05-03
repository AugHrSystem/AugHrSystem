/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Address;


public interface AddressDao extends GenericDao<Address, Integer>{
	
	public List<Address> findByCriteria(Address address);

	public Address deleteById(Integer id);

}
