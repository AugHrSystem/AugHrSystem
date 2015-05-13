/**
 *
 * @author Pranrajit
 * @date 13 พ.ค. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasLocation;



public interface MasLocationService {

	public void create(MasLocation masLocation);
	public void update(MasLocation masLocation);
	public void delete(MasLocation masLocation);
	public MasLocation find(Integer id);
	public List<MasLocation> findAll();
	public List<MasLocation> findByCriteria(MasLocation masLocation);
	public MasLocation deleteById(Integer id);
}
