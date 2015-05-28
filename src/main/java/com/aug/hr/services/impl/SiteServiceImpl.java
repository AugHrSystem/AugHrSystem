package com.aug.hr.services.impl;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.SiteDao;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Site;
import com.aug.hr.entity.dto.SiteDto;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.SiteService;

@Service
@Transactional
public class SiteServiceImpl implements SiteService{
	
	@Autowired
	private SiteDao siteDao;
	@Autowired
	private EmployeeService employeeService;

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

	@Override
	public void createSetDtoToEnity(SiteDto siteDto) {
		// TODO Auto-generated method stub
		
		Employee employee = new Employee();
		employee = employeeService.findById(siteDto.getEmployeeId());
		
		Site site = new Site();
		site.setProjectName(siteDto.getProjectName());
		site.setProjectOwner(siteDto.getProjectOwner());
		site.setProjectOwnerContact(siteDto.getProjectOwnerContact());
		site.setStartDate(siteDto.getStartDate());
		site.setEndDate(siteDto.getEndDate());
		site.setEmployee(employee);
		site.setAuditFlag("C");
		site.setCreatedBy(siteDto.getEmployeeId());
		site.setCreatedTimeStamp(Calendar.getInstance().getTime());
		siteDao.create(site);
		
	}

	@Override
	public SiteDto findByIdReturnToDto(Integer id) {
		// TODO Auto-generated method stub
		Site site = siteDao.find(id);
		SiteDto siteDto = new SiteDto();
		siteDto.setId(site.getId());
		siteDto.setProjectName(site.getProjectName());
		siteDto.setProjectOwner(site.getProjectOwner());
		siteDto.setProjectOwnerContact(site.getProjectOwnerContact());
		siteDto.setStartDate(site.getStartDate());
		siteDto.setEndDate(site.getEndDate());
		siteDto.setEmployeeId(site.getEmployee().getId());
		siteDto.setEmployeeCode(site.getEmployee().getEmployeeCode());
		return siteDto;
	}

	@Override
	public void updateSetDtoToEntity(SiteDto siteDto) {
		// TODO Auto-generated method stub
	
		
		Site site = new Site();
		site = siteDao.find(siteDto.getId());
		site.setAuditFlag("U");
		site.setUpdatedBy(siteDto.getEmployeeId());
		site.setUpdatedTimeStamp(Calendar.getInstance().getTime());
		site.setProjectName(siteDto.getProjectName());
		site.setStartDate(siteDto.getStartDate());
		site.setEndDate(siteDto.getEndDate());
		site.setProjectOwner(siteDto.getProjectOwner());
		site.setProjectOwnerContact(siteDto.getProjectOwnerContact());
		siteDao.update(site);
	}

}
