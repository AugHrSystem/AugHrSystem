/**
 *
 * @author Preeyaporn
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Education;
import com.aug.hr.entity.dto.EducationDto;

public interface EducationDao extends GenericDao<Education, Integer>{

	public List<Education> findByCriteria(Education education);

	public Education deleteById(Integer id);

	public List<EducationDto> searchEducation(Integer id);

}
