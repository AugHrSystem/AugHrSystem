package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.SiteDao;
import com.aug.hr.entity.Site;
import com.aug.hr.services.SiteService;

@Service
@Transactional
public class SiteServiceImpl implements SiteService{
	
	@Autowired
	private SiteDao siteDao;

	@Override
	public void create(Site site) {
		// TODO Auto-generated method stub
		siteDao.create(site);
	}

	@Override
	public void update(Site site) {
		// TODO Auto-generated method stub
		siteDao.update(site);
	}

	@Override
	public void delete(Site site) {
		// TODO Auto-generated method stub
		siteDao.delete(site);
	}

	@Override
	public Site find(Integer Id) {
		// TODO Auto-generated method stub
		Site site = siteDao.find(Id);
		return site;
	}

	@Override
	public List<Site> findAll() {
		// TODO Auto-generated method stub
		List<Site> siteList = siteDao.findAll();
		return siteList;
	}

}
