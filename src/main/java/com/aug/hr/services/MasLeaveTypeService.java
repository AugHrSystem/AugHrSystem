/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasLeaveType;



public interface MasLeaveTypeService {

	public void create(MasLeaveType masLeaveType);
	public void update(MasLeaveType masLeaveType);
	public void delete(MasLeaveType masLeaveType);
	public MasLeaveType find(Integer id);
	public List<MasLeaveType> findAll();
	public List<MasLeaveType> findByCriteria(MasLeaveType masLeaveType);
	public MasLeaveType deleteById(Integer id);
}
