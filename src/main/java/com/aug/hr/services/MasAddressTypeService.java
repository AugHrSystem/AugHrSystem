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
	public MasAddressType findById(Integer Id);
	public List<MasAddressType> findAll();
	public List<MasAddressType> findByCriteria(MasAddressType masAddressType);
	public MasAddressType deleteById(Integer id);
}
