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
import com.aug.hr.entity.Joblevel;
import com.aug.hr.services.JoblevelService;



@Service("JoblevelService")
@Transactional
public class JoblevelServiceImpl implements JoblevelService {

	
	@Autowired private JoblevelDao joblevelDao;
	
	@Override
	public void create(Joblevel joblevel) {
		joblevelDao.create(joblevel);
		
	}

	@Override
	public void update(Joblevel joblevel) {
		joblevelDao.update(joblevel);
		
	}

	@Override
	public void delete(Joblevel joblevel) {
		joblevelDao.delete(joblevel);
		
	}

	@Override
	public Joblevel find(Integer id) {
		
		return joblevelDao.find(id);
	}

	@Override
	public List<Joblevel> findAll() {
		// TODO Auto-generated method stub
		return joblevelDao.findAll();
	}

	@Override
	public List<Joblevel> findByCriteria(Joblevel joblevel) {
		// TODO Auto-generated method stub
		return joblevelDao.findByCriteria(joblevel);
	}

	@Override
	public Joblevel deleteById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
