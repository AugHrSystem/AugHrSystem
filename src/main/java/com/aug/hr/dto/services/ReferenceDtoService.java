package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.ReferenceDao;
import com.aug.hr.entity.dto.ReferenceDto;



@Service("referenceDtoService")
@Transactional
public class ReferenceDtoService {
	
	@Autowired private ReferenceDao referenceDao;
	
	public List<ReferenceDto> searchReference(Integer id){
		return referenceDao.searchReference(id);
	}

}
