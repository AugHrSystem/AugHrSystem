/**
 *
 * @author Pranrajit
 * @date 11 พ.ค. 2558
 */
package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.MasJoblevel;


public interface MasJoblevelDao extends GenericDao<MasJoblevel,Integer> {

	public List<MasJoblevel> findByCriteria(MasJoblevel masJoblevel);

	public MasJoblevel deleteById(Integer id);

}
