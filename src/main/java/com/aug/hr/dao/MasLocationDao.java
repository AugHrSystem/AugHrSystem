/**
 *
 * @author Pranrajit
 * @date 13 พ.ค. 2558
 */
package com.aug.hr.dao;


import java.util.List;


import com.aug.hr.entity.MasLocation;

public interface MasLocationDao extends GenericDao<MasLocation,Integer>{

	
	public List<MasLocation> findByCriteria(MasLocation masLocation);

	public MasLocation deleteById(Integer id);
	
}
