package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Site;



public interface SiteService {
	
	public void create(Site site);
	public void update(Site site);
	public void delete(Site site);
	public Site find(Integer Id);
	public List<Site> findAll();

}
