package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Site;
import com.aug.hr.entity.dto.SiteDto;



public interface SiteService {
	
	public void create(Site site);
	public void update(Site site);
	public void delete(Site site);
	public Site find(Integer Id);
	public List<Site> findAll();
	public void createSetDtoToEnity(SiteDto siteDto);
	public SiteDto findByIdReturnToDto(Integer id);
	public void updateSetDtoToEntity(SiteDto siteDto);

}
