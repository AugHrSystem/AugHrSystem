package com.aug.hr.dao.impl;

import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.ReferenceDao;
import com.aug.hr.entity.Reference;
import com.aug.hr.entity.dto.ReferenceDto;
import com.mysql.jdbc.StringUtils;

@Repository("referenceDao")
public class ReferenceDaoImpl extends GenericDaoImpl<Reference, Integer> implements ReferenceDao{

		public ReferenceDaoImpl(){
			super(Reference.class);
		}

		@Override
		public List<Reference> findByCriteria(Reference reference) {
			
			Criteria c = getCurrentSession().createCriteria(Reference.class);
			if (!StringUtils.isNullOrEmpty(reference.getName())) {
				c.add(Restrictions.like("name", "%" + reference.getName() + "%"));
			}
			return c.list();
		}


	
		

		@Override
		public Reference deleteById(Integer id) {
			Reference reference =(Reference)getCurrentSession().load(Reference.class, id);
			getCurrentSession().delete(reference);
			return reference;
		}

		
		
		
		
		@SuppressWarnings("unchecked")
		@Override
		public List<ReferenceDto> searchReference(Integer id) {
			 Query   namedQuery = getCurrentSession().getNamedQuery("searchReferent").setInteger("empId" ,id);
				List<ReferenceDto> refDto = namedQuery.list();
				return refDto;
		}
		
		

}
