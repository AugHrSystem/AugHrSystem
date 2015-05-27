package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.SiteDao;
import com.aug.hr.entity.dto.SiteDto;

@Service
@Transactional
public class SiteDtoService {
	
	@Autowired
	private SiteDao siteDao;
	
	public List<SiteDto> listByNameNativeQuery(Integer id){
		return siteDao.listByNameNativeQuery(id); 
	}

}
