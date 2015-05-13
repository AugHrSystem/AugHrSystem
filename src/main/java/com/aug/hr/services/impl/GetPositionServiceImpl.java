/**
 *
 * @author Preeyaporn
 * @date 13 พ.ค. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.GetPositionDao;
import com.aug.hr.entity.GetPosition;
import com.aug.hr.services.GetPositionService;

@Service("getPositionService")
@Transactional
public class GetPositionServiceImpl implements GetPositionService{

	@Autowired
	private GetPositionDao getPositionDao;
	
	@Override
	public List<GetPosition> findAll() {
		return getPositionDao.findAll();
	}

	@Override
	public void create(GetPosition getPosition) {
		getPositionDao.create(getPosition);
	}

	@Override
	public void update(GetPosition getPosition) {
		getPositionDao.update(getPosition);
	}

	@Override
	public void delete(GetPosition getPosition) {
		getPositionDao.delete(getPosition);
	}

	@Override
	public GetPosition findById(Integer id) {
		return getPositionDao.find(id);
	}

	@Override
	public List<GetPosition> findByCriteria(GetPosition getPosition) {
		return getPositionDao.findByCriteria(getPosition);
	}

	@Override
	public GetPosition deleteById(Integer id) {
		return getPositionDao.deleteById(id);
	}

}
