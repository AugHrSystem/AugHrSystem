/**
 *
 * @author Preeyaporn
 * @date 3 มิ.ย. 2558
 */
package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AllowancesDao;
import com.aug.hr.entity.dto.AllowancesDto;


@Service("allowancesDtoService")
@Transactional
public class AllowancesDtoService {

@Autowired private AllowancesDao allowancesDao;
	
	public List<AllowancesDto> searchAllowances(Integer id){
		return allowancesDao.searchAllowances(id);
	}
}
