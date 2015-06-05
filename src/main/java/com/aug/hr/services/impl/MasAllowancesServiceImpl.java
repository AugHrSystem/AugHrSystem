/**
 *
 * @author Preeyaporn
 * @date 5 มิ.ย. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasAllowancesDao;
import com.aug.hr.entity.MasAllowances;
import com.aug.hr.services.MasAllowancesService;

@Service("masAllowancesService")
@Transactional
public class MasAllowancesServiceImpl implements MasAllowancesService{

	@Autowired
	private MasAllowancesDao masAllowancesDao;
	
	@Override
	public void create(MasAllowances masAllowances) {
		masAllowancesDao.create(masAllowances);
	}

	@Override
	public void update(MasAllowances masAllowances) {
		masAllowancesDao.update(masAllowances);
	}

	@Override
	public void delete(MasAllowances masAllowances) {
		masAllowancesDao.delete(masAllowances);
	}

	@Override
	public MasAllowances find(Integer id) {
		return masAllowancesDao.find(id);
	}

	@Override
	public List<MasAllowances> findAll() {
		return masAllowancesDao.findAll();
	}

	@Override
	public List<MasAllowances> findByCriteria(MasAllowances masAllowances) {
		return masAllowancesDao.findByCriteria(masAllowances);
	}

	@Override
	public MasAllowances deleteById(Integer id) {
		return masAllowancesDao.deleteById(id);
	}

}
