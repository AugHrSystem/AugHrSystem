package com.aug.hr.services;

import java.util.List;
import com.aug.hr.entity.MasRole;

public interface MasRoleService {

	public void create(MasRole masRole);
	public void update(MasRole masRole);
	public void delete(MasRole masRole);
	public MasRole find(Integer id);
	public List<MasRole> findAll();
	public MasRole deleteById(Integer id);
}
