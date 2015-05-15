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

import com.aug.hr.dao.HistoryDao;
import com.aug.hr.entity.History;
import com.aug.hr.services.HistoryService;

@Service("getPositionService")
@Transactional
public class HistoryServiceImpl implements HistoryService{

	@Autowired
	private HistoryDao historyDao;
	
	@Override
	public List<History> findAll() {
		return historyDao.findAll();
	}

	@Override
	public void create(History history) {
		historyDao.create(history);
	}

	@Override
	public void update(History history) {
		historyDao.update(history);
	}

	@Override
	public void delete(History history) {
		historyDao.delete(history);
	}

	@Override
	public History findById(Integer id) {
		return historyDao.find(id);
	}

	@Override
	public List<History> findByCriteria(History history) {
		return historyDao.findByCriteria(history);
	}

	@Override
	public History deleteById(Integer id) {
		return historyDao.deleteById(id);
	}

}
