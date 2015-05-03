/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao;

import java.util.List;
import com.aug.hr.entity.MasAddressType;

public interface MasAddressTypeDao extends GenericDao<MasAddressType, Integer>{
	
	public List<MasAddressType> findByCriteria(MasAddressType masAddressType);

	public MasAddressType deleteById(Integer id);

}
