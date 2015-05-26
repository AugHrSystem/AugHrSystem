package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.FamilyDao;
import com.aug.hr.entity.dto.Family2Dto;



@Service
@Transactional
public class FamilyDtoService {
	
	@Autowired
	private FamilyDao familyDao;
	
	
	public  List<Family2Dto> listFamily(Integer id){
		return familyDao.findFamilyList(id);
		
	}
	

}
