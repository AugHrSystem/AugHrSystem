/**
 *
 * @author Preeyaporn
 * @date 3 มิ.ย. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Allowances;

public interface AllowancesService {

	public List<Allowances> findAll();
	public void create(Allowances allowances);
	public void update(Allowances allowances);
	public void delete(Allowances allowances);
	public Allowances findById(Integer id);
//	public List<Allowances> findByCriteria(Allowances allowances);
	public Allowances deleteById(Integer id);
}
