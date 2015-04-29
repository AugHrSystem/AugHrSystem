/**
 *
 * @author natechanok
 * @date Apr 29, 2015
 */

package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasAddressType;



public interface MasAddressTypeService {

	public void create(MasAddressType masAddressType );
	public void update(MasAddressType masAddressType);
	public void delete(MasAddressType masAddressType);
	public MasAddressType find(Integer Id);
	public List<MasAddressType> findAll();
}
