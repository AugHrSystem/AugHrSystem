package com.aug.hr.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.SiteDao;
import com.aug.hr.entity.Site;
import com.aug.hr.entity.dto.SiteDto;

@Repository
public class SiteDaoImpl extends GenericDaoImpl<Site, Integer> implements SiteDao,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SiteDaoImpl() {
		super(Site.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<SiteDto> listByNameNativeQuery(Integer id) {
		// TODO Auto-generated method stub
		
		Query query = getCurrentSession().getNamedQuery("listSite").setInteger("empId", id);	
		return query.list();
	}

}
