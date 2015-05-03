/**
 *
 * @author natechanok
 * @date Apr 30, 2015
 */

package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Official;



public interface OfficialService {
	public void create(Official official);
	public void update(Official official);
	public void delete(Official official);
	public Official findById(Integer id);
	public List<Official> findAll();
	public List<Official> findByCriteria(Official official);
	public Official deleteById(Integer id);

}
