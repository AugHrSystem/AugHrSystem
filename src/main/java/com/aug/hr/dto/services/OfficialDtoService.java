/**
 *
 * @author natechanok
 * @date May 28, 2015
 */

package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.OfficialDao;
import com.aug.hr.entity.dto.OfficialDto;

@Service("officialDtoService")
@Transactional
public class OfficialDtoService {
	
	@Autowired private OfficialDao officialDao;
	
	public List<OfficialDto> searchOfficial(){
		return officialDao.searchOfficial();
	}

}
