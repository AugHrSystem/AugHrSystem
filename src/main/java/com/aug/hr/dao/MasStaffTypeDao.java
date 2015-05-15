package com.aug.hr.dao;

import com.aug.hr.entity.MasStaffType;

public interface MasStaffTypeDao extends GenericDao<MasStaffType, Integer>{
	
	public void create(MasStaffType masStaffType);
	public void update(MasStaffType masStaffType);
	public void delete(MasStaffType masStaffType);
	public MasStaffType find(Integer Id);


}
