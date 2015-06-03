/**
 *
 * @author Preeyaporn
 * @date 3 มิ.ย. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AllowancesDao;
import com.aug.hr.entity.Allowances;
import com.aug.hr.services.AllowancesService;

@Service("allowancesService")
@Transactional
public class AllowancesServiceImpl implements AllowancesService {

	@Autowired
	private AllowancesDao allowancesDao;
	
	@Override
	public List<Allowances> findAll() {
		return allowancesDao.findAll();
	}

	@Override
	public void create(Allowances allowances) {
		allowancesDao.create(allowances);
	}

	@Override
	public void update(Allowances allowances) {
		allowancesDao.update(allowances);
	}

	@Override
	public void delete(Allowances allowances) {
		allowancesDao.delete(allowances);
	}

	@Override
	public Allowances findById(Integer id) {
		return allowancesDao.find(id);
	}

	@Override
	public List<Allowances> findByCriteria(Allowances allowances) {
		return allowancesDao.findByCriteria(allowances);
	}

	@Override
	public Allowances deleteById(Integer id) {
		return allowancesDao.deleteById(id);
	}

}
