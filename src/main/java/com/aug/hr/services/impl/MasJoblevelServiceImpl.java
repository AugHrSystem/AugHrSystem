/**
 *
 * @author Pranrajit
 * @date 11 พ.ค. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasJoblevelDao;
import com.aug.hr.entity.MasJoblevel;
import com.aug.hr.services.MasJoblevelService;



@Service("masJoblevelService")
@Transactional
public class MasJoblevelServiceImpl implements MasJoblevelService {

	
	@Autowired private MasJoblevelDao masJoblevelDao;
	
	@Override
	public void create(MasJoblevel masJoblevel) {
		masJoblevelDao.create(masJoblevel);
		
	}

	@Override
	public void update(MasJoblevel masJoblevel) {
		masJoblevelDao.update(masJoblevel);
		
	}

	@Override
	public void delete(MasJoblevel masJoblevel) {
		masJoblevelDao.delete(masJoblevel);
		
	}

	@Override
	public MasJoblevel find(Integer id) {
		
		return masJoblevelDao.find(id);
	}

	@Override
	public List<MasJoblevel> findAll() {
		// TODO Auto-generated method stub
		return masJoblevelDao.findAll();
	}

	@Override
	public List<MasJoblevel> findByCriteria(MasJoblevel masJoblevel) {
		// TODO Auto-generated method stub
		return masJoblevelDao.findByCriteria(masJoblevel);
	}

	@Override
	public MasJoblevel deleteById(Integer id) {
		// TODO Auto-generated method stub
		return masJoblevelDao.deleteById(id);
	}

}
