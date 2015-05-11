/**
 *
 * @author Pranrajit
 * @date 11 พ.ค. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Joblevel;



public interface JoblevelService {
	
	public void create(Joblevel joblevel);
	public void update(Joblevel joblevel);
	public void delete(Joblevel joblevel);
	public Joblevel find(Integer id);
	public List<Joblevel> findAll();
	public List<Joblevel> findByCriteria(Joblevel joblevel);
	public Joblevel deleteById(Integer id);

}
