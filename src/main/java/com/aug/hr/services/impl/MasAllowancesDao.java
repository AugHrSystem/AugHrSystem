/**
 *
 * @author Preeyaporn
 * @date 5 มิ.ย. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import com.aug.hr.dao.GenericDao;
import com.aug.hr.entity.MasAllowances;

public interface MasAllowancesDao extends GenericDao<MasAllowances, Integer>{

	public List<MasAllowances> findByCriteria(MasAllowances masAllowances);

	public MasAllowances deleteById(Integer id);
}
