package com.aug.hr.dao;

import com.aug.hr.entity.MasRole;

public interface MasRoleDao extends GenericDao<MasRole, Integer>{
	
	public MasRole deleteById(Integer id);
}
