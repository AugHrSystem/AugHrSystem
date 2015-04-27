/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.AddressTypeDao;
import com.aug.hr.entity.AddressType;

@Repository
public class AddressTypeDaoImpl extends GenericDaoImpl<AddressType, Integer> implements AddressTypeDao{

	public AddressTypeDaoImpl() {
		super(AddressType.class);
		// TODO Auto-generated constructor stub
	}

}
