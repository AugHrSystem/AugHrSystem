/**
 *
 * @author Preeyaporn
 * @date 29 เม.ย. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.DivisionDao;
import com.aug.hr.entity.Division;
import com.aug.hr.services.DivisionService;

@Service("DivisionService")
@Transactional
public class DivisionServiceImpl implements DivisionService {

	@Autowired
	private DivisionDao divisionDao;
	
	@Override
	public List<Division> findAll() {
		return divisionDao.findAll();
	}

	@Override
	public void create(Division division) {
		divisionDao.create(division);
	}

	@Override
	public void update(Division division) {
		divisionDao.update(division);
	}

	@Override
	public void delete(Division division) {
		divisionDao.delete(division);
	}

	@Override
	public Division findById(Integer id) {
		return divisionDao.find(id);
	}

	@Override
	public List<Division> findByCriteria(Division division) {
		return null;
	}

	@Override
	public Division deleteById(Integer id) {
		return null;
	}

	
}
