package com.aug.hr.services;

import java.util.List;
import com.aug.hr.entity.MasSpecialty;

public interface MasSpecialtyService {
	
	public List<MasSpecialty> findAll();
	public void create(MasSpecialty specialty);
	public void update(MasSpecialty specialty);
	public void delete(MasSpecialty specialty);
	public MasSpecialty findById(Integer id);
	public List<MasSpecialty> findByCriteria(MasSpecialty specialty);
	public MasSpecialty deleteById(Integer id);

}
