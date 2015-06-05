/**
 *
 * @author Preeyaporn
 * @date 5 มิ.ย. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasAllowances;


public interface MasAllowancesService {

	public void create(MasAllowances masAllowances);
	public void update(MasAllowances masAllowances);
	public void delete(MasAllowances masAllowances);
	public MasAllowances find(Integer id);
	public List<MasAllowances> findAll();
	public List<MasAllowances> findByCriteria(MasAllowances masAllowances);
	public MasAllowances deleteById(Integer id);
	
}
