package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.aug.hr.dao.PunishDao;
import com.aug.hr.entity.dto.PunsihDto;


@Service("punishDtoService")
@Transactional
public class PunishDtoService {
		
	@Autowired private PunishDao punishDao;
	
	public List<PunsihDto> searchPunish(Integer id){
		return punishDao.searchPunish(id);
	}
}
