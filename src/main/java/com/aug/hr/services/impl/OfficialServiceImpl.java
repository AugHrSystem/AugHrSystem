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
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Official;
import com.aug.hr.services.OfficialService;
@Service
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
		// TODO Auto-generated method stub
		officialDao.delete(official);
	}

	

	@Override
	public List<Official> findAll() {
		List<Official> official = officialDao.findAll();
		return official;
	}

	@Override
	public List<Official> findByCriteria(Official official) {
		// TODO Auto-generated method stub
		return officialDao.findByCriteria(official);
	}

	@Override
	public Official deleteById(Integer id) {
		// TODO Auto-generated method stub
		return officialDao.deleteById(id);
	}

}
