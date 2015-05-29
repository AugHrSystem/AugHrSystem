/**
 *
 * @author natechanok
 * @date Apr 30, 2015
 */

package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.OfficialDao;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.OfficialDto;
import com.aug.hr.services.OfficialService;

@Service("officialService")
@Transactional
public class OfficialServiceImpl implements OfficialService{

	@Autowired
	private OfficialDao officialDao;
	
	
	@Override
	public void create(Official official) {
		officialDao.create(official);
		
		
	}

	@Override
	public void update(Official official) {
		officialDao.update(official);
	}

	@Override
	public void delete(Official official) {
		officialDao.delete(official);
	}

	

	@Override
	public List<Official> findAll() {
		return officialDao.findAll();
	}

	@Override
	public List<Official> findByCriteria(Official official) {
		return officialDao.findByCriteria(official);
	}

	@Override
	public Official deleteById(Integer id) {
		return officialDao.deleteById(id);
	}

	@Override
	public Official findById(Integer id) {
		return officialDao.find(id);
	}

	@Override
	public void saveOfficialByNameQuery(OfficialDto officialDto) {
		
		officialDao.saveOfficialByNameQuery(officialDto);
		
	}

	@Override
	public Official searhEmpIdtoOfficial() {
		
		return officialDao.searhEmpIdtoOfficial();
	}

}
