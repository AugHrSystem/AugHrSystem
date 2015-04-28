/**
 *
 * @author Preeyaporn
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.EducationDao;
import com.aug.hr.entity.Education;

@Repository
public class EducationDaoImpl extends GenericDaoImpl<Education, Integer> implements EducationDao{

	public EducationDaoImpl() {
		super(Education.class);
	}

}
