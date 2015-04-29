/**
 *
 * @author Preeyaporn
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.EducationDao;
import com.aug.hr.entity.Education;
import com.mysql.jdbc.StringUtils;

@Repository
public class EducationDaoImpl extends GenericDaoImpl<Education, Integer> implements EducationDao{

	public EducationDaoImpl() {
		super(Education.class);
	}

	@SuppressWarnings("unchecked")
	public List<Education> findByCriteria(Education education){
		
		Criteria c = getCurrentSession().createCriteria(Education.class);
		if (!StringUtils.isNullOrEmpty(education.getName())) {
			c.add(Restrictions.like("name", "%" + education.getName() + "%"));
		}
		return c.list();
		
	}
	
	public Education deleteById(Integer id){
		
		Education education =(Education)getCurrentSession().load(Education.class, id);
		getCurrentSession().delete(education);
		return education;
	}
}
