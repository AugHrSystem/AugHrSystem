/**
 *
 * @author Preeyaporn
 * @date 13 พ.ค. 2558
 */
package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.GetPosition;

public interface GetPositionDao extends GenericDao<GetPosition, Integer>{

	public List<GetPosition> findByCriteria(GetPosition getPosition);

	public GetPosition deleteById(Integer id);
}
