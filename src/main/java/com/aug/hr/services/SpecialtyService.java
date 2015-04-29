package com.aug.hr.services;

import java.util.List;
import com.aug.hr.entity.Specialty;

public interface SpecialtyService {
	
	public List<Specialty> findAll();
	public void create(Specialty specialty);
	public void update(Specialty specialty);
	public void delete(Specialty specialty);
	public Specialty findById(Integer id);
	public List<Specialty> findByCriteria(Specialty specialty);
	public Specialty deleteById(Integer id);

}
