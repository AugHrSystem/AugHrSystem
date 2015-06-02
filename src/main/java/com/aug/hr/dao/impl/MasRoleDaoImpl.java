package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasRoleDao;
import com.aug.hr.entity.MasLocation;
import com.aug.hr.entity.MasRole;

@Repository
public class MasRoleDaoImpl extends GenericDaoImpl<MasRole, Integer> implements MasRoleDao{

		public MasRoleDaoImpl() {
			super(MasRole.class);
		}
		
		public MasRole deleteById(Integer id) {
			MasRole masRole =(MasRole)getCurrentSession().load(MasRole.class, id);
			getCurrentSession().delete(masRole);
			return masRole;
		}
}
