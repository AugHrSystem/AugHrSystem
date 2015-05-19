package com.aug.hr.dao.impl;

import java.util.List;

import javax.transaction.Transaction;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.ExperienceDao;
import com.aug.hr.entity.Experience;
import com.aug.hr.entity.dto.ExperienceDto;
import com.mysql.jdbc.StringUtils;

@Repository
public class ExperienceDaoImpl extends GenericDaoImpl<Experience, Integer> implements ExperienceDao{

	public ExperienceDaoImpl() {
		super(Experience.class);
	}
		
	@SuppressWarnings("unchecked")
	public List<Experience> findByCriteria(Experience experience){
		
		Criteria c = getCurrentSession().createCriteria(Experience.class);
		if (!StringUtils.isNullOrEmpty(experience.getName())) {
			c.add(Restrictions.like("name", "%" + experience.getName() + "%"));
		}
		return c.list();
		
	}
	
	@Override
	public void deleteById(Integer id){
		
		Experience experience =(Experience)getCurrentSession().load(Experience.class, id);
		if(experience != null){
			getCurrentSession().delete(experience);
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<ExperienceDto> searchExperience(Integer id){
		Query namedQuery = getCurrentSession().getNamedQuery("searchExperience").setInteger("empId" ,id);
		//namedQuery.executeUpdate();
		List<ExperienceDto> expDto = namedQuery.list();
	     return expDto;
	}

}
