/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.AddressDao;
import com.aug.hr.entity.Address;

@Repository
public class AddressDaoImpl extends GenericDaoImpl<Address, Integer> implements AddressDao{

	public AddressDaoImpl() {
		super(Address.class);
		// TODO Auto-generated constructor stub
	}

}
