package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Site;
import com.aug.hr.entity.dto.SiteDto;

public interface SiteDao extends GenericDao<Site, Integer>{
	
	public List<SiteDto> listByNameNativeQuery(Integer id);

}
