/**
 *
 * @author Preeyaporn
 * @date 29 เม.ย. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Education;

public interface EducationService {

	public List<Education> findAll();
	public void create(Education education);
	public void update(Education education);
	public void delete(Education education);
	public Education findById(Integer id);
	public List<Education> findByCriteria(Education education);
	public Education deleteById(Integer id);
	
}
