package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Probation;
import com.aug.hr.entity.dto.ProbationDto;

public interface ProbationDao extends GenericDao<Probation, Integer>{

	public void deleteById(Integer id);

	public List<Probation> findByCriteria(Probation probation);
	
	public List<ProbationDto> searchProbation(Integer id);

}
