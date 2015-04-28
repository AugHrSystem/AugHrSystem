/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasAddressTypeDao;
import com.aug.hr.entity.MasAddressType;

@Repository
public class AddressTypeDaoImpl extends GenericDaoImpl<MasAddressType, Integer> implements MasAddressTypeDao{

	public AddressTypeDaoImpl() {
		super(MasAddressType.class);
		// TODO Auto-generated constructor stub
	}

}
