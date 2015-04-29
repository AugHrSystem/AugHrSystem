package com.aug.hr.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.ReferenceDao;
import com.aug.hr.entity.Reference;
import com.aug.hr.services.ReferenceService;

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
		public List<Reference>  findByID(Integer id) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public Reference deleteById(Integer id) {
			// TODO Auto-generated method stub
			return null;
		}
		
		

}
