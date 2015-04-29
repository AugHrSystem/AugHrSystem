/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao;

import java.util.List;


import com.aug.hr.entity.MasDegreetype;

public interface MasDegreetypeDao extends GenericDao<MasDegreetype,Integer>{


	
	public List<MasDegreetype> findByCriteria(MasDegreetype masDegreetype);

	public MasDegreetype deleteById(Integer id);

	
}
