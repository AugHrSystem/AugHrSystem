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

import com.aug.hr.dao.JoblevelDao;
import com.aug.hr.entity.MasJoblevel;
import com.aug.hr.services.JoblevelService;



@Service("JoblevelService")
@Transactional
public class JoblevelServiceImpl implements JoblevelService {

	
	@Autowired private JoblevelDao joblevelDao;
	
	@Override
	public void create(MasJoblevel masJoblevel) {
		joblevelDao.create(masJoblevel);
		
	}

	@Override
	public void update(MasJoblevel masJoblevel) {
		joblevelDao.update(masJoblevel);
		
	}

	@Override
	public void delete(MasJoblevel masJoblevel) {
		joblevelDao.delete(masJoblevel);
		
	}

	@Override
	public MasJoblevel find(Integer id) {
		
		return joblevelDao.find(id);
	}

	@Override
	public List<MasJoblevel> findAll() {
		// TODO Auto-generated method stub
		return joblevelDao.findAll();
	}

	@Override
	public List<MasJoblevel> findByCriteria(MasJoblevel masJoblevel) {
		// TODO Auto-generated method stub
		return joblevelDao.findByCriteria(masJoblevel);
	}

	@Override
	public MasJoblevel deleteById(Integer id) {
		// TODO Auto-generated method stub
		return joblevelDao.deleteById(id);
	}

}
