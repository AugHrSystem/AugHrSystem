/**
 *
 * @author Preeyaporn
 * @date 13 พ.ค. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.GetPosition;


public interface GetPositionService {

	public List<GetPosition> findAll();
	public void create(GetPosition getPosition);
	public void update(GetPosition getPosition);
	public void delete(GetPosition getPosition);
	public GetPosition findById(Integer id);
	public List<GetPosition> findByCriteria(GetPosition getPosition);
	public GetPosition deleteById(Integer id);
}
