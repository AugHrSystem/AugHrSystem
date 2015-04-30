/**
 *
 * @author Pranrajit
 * @date 29 เม.ย. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasDegreetype;


public interface MasDegreetypeService {

	public void create(MasDegreetype masDegreetype);
	public void update(MasDegreetype masDegreetype);
	public void delete(MasDegreetype masDegreetype);
	public MasDegreetype find(Integer id);
	public List<MasDegreetype> findAll();
	public List<MasDegreetype> findByCriteria(MasDegreetype masDegreetype);
	public void deleteById(Integer id);
}
