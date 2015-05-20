/**
 *
 * @author Pranrajit
 * @date 20 พ.ค. 2558
 */
package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.EducationDao;
import com.aug.hr.entity.dto.EducationDto;
import com.aug.hr.entity.dto.ExperienceDto;


@Service("educationDtoService")
@Transactional
public class EducationDtoService {

	@Autowired private EducationDao educationDao;
	
	public List<EducationDto> searchEducation(Integer id){
		return educationDao.searchEducation(id);
	}
	
}
