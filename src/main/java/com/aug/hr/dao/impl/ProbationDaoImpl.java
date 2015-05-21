package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.ProbationDao;
import com.aug.hr.entity.Probation;
import com.aug.hr.entity.dto.ProbationDto;
import com.mysql.jdbc.StringUtils;

@Repository
public class ProbationDaoImpl extends GenericDaoImpl<Probation, Integer> implements ProbationDao{

	public ProbationDaoImpl() {
		super(Probation.class);
	}
	
	@Override
	public void deleteById(Integer id){
		
		Probation probation =(Probation)getCurrentSession().load(Probation.class, id);
		if(probation != null){
			getCurrentSession().delete(probation);
		}
	}

	@Override
	public List<Probation> findByCriteria(Probation probation) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<ProbationDto> searchProbation(Integer id){
		Query namedQuery = getCurrentSession().getNamedQuery("searchProbation").setInteger("empId" ,id);
		//namedQuery.executeUpdate();
		List<ProbationDto> expDto = namedQuery.list();
	     return expDto;
	}
	

}
