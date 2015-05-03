/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.MasEmployment;


public interface MasEmploymentDao extends GenericDao<MasEmployment,Integer>{
	
List<MasEmployment> findByCriteria(MasEmployment masEmployment);
	
	public MasEmployment deleteById(Integer id);

}
