/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Ability;
import com.aug.hr.entity.Employee;




public interface AbilityDao extends GenericDao<Ability, Integer> {

	public List<Employee> findByCriteria(Employee employee);

	public Ability deleteById(Integer id);

}
