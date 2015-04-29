/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Ability;
import com.aug.hr.entity.Employee;


public interface AbilityService {

	public void create(Ability ability);
	public void update(Ability Ability);
	public void delete(Ability Ability);
	public Ability find(Integer Id);
	public List<Ability> findAll();
	public List<Ability> findByCriteria(Ability ability);
	public Ability deleteById(Integer id);
	List<Employee> findByCriteria(Employee employee);
	
}
