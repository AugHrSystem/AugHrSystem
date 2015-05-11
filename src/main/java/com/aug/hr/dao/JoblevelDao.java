/**
 *
 * @author Pranrajit
 * @date 11 พ.ค. 2558
 */
package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Joblevel;


public interface JoblevelDao extends GenericDao<Joblevel,Integer> {

	public List<Joblevel> findByCriteria(Joblevel joblevel);

	public Joblevel deleteById(Integer id);

}
