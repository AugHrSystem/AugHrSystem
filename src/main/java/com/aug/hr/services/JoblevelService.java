/**
 *
 * @author Pranrajit
 * @date 11 พ.ค. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasJoblevel;



public interface JoblevelService {
	
	public void create(MasJoblevel masJoblevel);
	public void update(MasJoblevel masJoblevel);
	public void delete(MasJoblevel masJoblevel);
	public MasJoblevel find(Integer id);
	public List<MasJoblevel> findAll();
	public List<MasJoblevel> findByCriteria(MasJoblevel masJoblevel);
	public MasJoblevel deleteById(Integer id);

}
