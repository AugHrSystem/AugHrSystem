/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.MasLeaveType;

public interface MasLeaveTypeDao extends GenericDao<MasLeaveType, Integer> {

	public List<MasLeaveType> findByCriteria(MasLeaveType masLeaveType);

	public MasLeaveType deleteById(Integer id);

}