/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Ability;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.dto.AbilityDto;

public interface AbilityDao extends GenericDao<Ability, Integer> {

	public List<Employee> findByCriteria(Employee employee);
	
	public Ability deleteById(Integer id);

	public List<AbilityDto> searchAbility(Integer id);

	
}
