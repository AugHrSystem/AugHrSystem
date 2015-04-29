/**
 *
 * @author Preeyaporn
 * @date 29 เม.ย. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Division;

public interface DivisionService {

	public List<Division> findAll();
	public void create(Division division);
	public void update(Division division);
	public void delete(Division division);
	public Division findById(Integer id);
	public List<Division> findByCriteria(Division division);
	public Division deleteById(Integer id);
}
