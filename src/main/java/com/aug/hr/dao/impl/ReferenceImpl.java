package com.aug.hr.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.ReferenceDao;
import com.aug.hr.services.Reference;

@Repository("referenceDao")
public class ReferenceImpl extends GenericDaoImpl<Reference, Integer> implements ReferenceDao{

		public ReferenceImpl(){
			super(Reference.class);
		}
		
		

		@Override
		public List<Reference> findByCriteria(Reference reference) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public Reference delete(Integer id) {
			// TODO Auto-generated method stub
			return null;
		}
		
		
}
