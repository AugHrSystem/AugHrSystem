package com.aug.hr.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.SpecialtyDao;
import com.aug.hr.entity.Specialty;


@Repository("specialtyDao")
public class SpecialtyDaoImpl extends GenericDaoImpl<Specialty, Integer> implements SpecialtyDao{

			public SpecialtyDaoImpl(){
				super(Specialty.class);
			}

			@Override
			public List<SpecialtyDao> findByCriteria(SpecialtyDao specialty) {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public SpecialtyDao delete(Integer id) {
				// TODO Auto-generated method stub
				return null;
			}
}
