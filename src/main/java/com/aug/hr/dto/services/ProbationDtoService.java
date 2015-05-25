package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.ProbationDao;
import com.aug.hr.entity.dto.ExperienceDto;
import com.aug.hr.entity.dto.ProbationDto;

@Service("probationDtoService")
@Transactional
public class ProbationDtoService {
	@Autowired private ProbationDao probationDao;
	
	public List<ProbationDto> searchProbation(Integer id){
		return probationDao.searchProbation(id);
	}
	
	public void createProbation(ProbationDto probationDto){
		probationDao.createProbation(probationDto);
	}
	
}
