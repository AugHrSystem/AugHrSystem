package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.ReferenceDao;
import com.aug.hr.entity.Education;
import com.aug.hr.entity.Reference;
import com.aug.hr.services.ReferenceService;
import com.mysql.jdbc.StringUtils;

@Repository("referenceDao")
public class ReferenceImpl extends GenericDaoImpl<Reference, Integer> implements ReferenceDao{

		public ReferenceImpl(){
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
		public List<Reference>  findByID(Integer id) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public Reference deleteById(Integer id) {
			Reference reference =(Reference)getCurrentSession().load(Reference.class, id);
			getCurrentSession().delete(reference);
			return reference;
		}
		
		

}
