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

import com.aug.hr.dao.MasDivisionDao;
import com.aug.hr.entity.MasDivision;
import com.aug.hr.services.MasDivisionService;

@Service("MasDivisionService")
@Transactional
public class MasDivisionServiceImpl implements MasDivisionService {

	@Autowired
	private MasDivisionDao masDivisionDao;
	
	@Override
	public List<MasDivision> findAll() {
		return masDivisionDao.findAll();
	}

	@Override
	public void create(MasDivision masDivision) {
		masDivisionDao.create(masDivision);
	}

	@Override
	public void update(MasDivision masDivision) {
		masDivisionDao.update(masDivision);
	}

	@Override
	public void delete(MasDivision masDivision) {
		masDivisionDao.delete(masDivision);
	}

	@Override
	public MasDivision findById(Integer id) {
		return masDivisionDao.find(id);
	}

	@Override
	public List<MasDivision> findByCriteria(MasDivision masDivision) {
		return null;
	}

	@Override
	public MasDivision deleteById(Integer id) {
		return null;
	}

	
}
