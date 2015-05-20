/**
 *
 * @author Pranrajit
 * @date 19 พ.ค. 2558
 */
package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AbilityDao;
import com.aug.hr.entity.dto.AbilityDto;
import com.aug.hr.entity.dto.ExperienceDto;

@Service("abilityDtoService")
@Transactional
public class AbilityDtoService {
	@Autowired private AbilityDao abilityDao;
	
	public List<AbilityDto> searchAbility(Integer id){
		return abilityDao.searchAbility(id);
	}

}
