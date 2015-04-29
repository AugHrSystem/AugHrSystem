/**
 *
 * @author Pranrajit
 * @date 29 เม.ย. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;





import com.aug.hr.dao.MasDegreetypeDao;
import com.aug.hr.entity.MasDegreetype;
import com.aug.hr.services.MasDegreetypeService;

@Service("MasDegreetypeService")
@Transactional
public class MasDegreeServiceImpl implements MasDegreetypeService{

	@Autowired
	private MasDegreetypeDao masDegreetypeDao;
	
	@Override
	public void create(MasDegreetype masDegreetype) {
		masDegreetypeDao.create(masDegreetype);
		
	}

	@Override
	public void update(MasDegreetype masDegreetype) {
		masDegreetypeDao.update(masDegreetype);
	}

	@Override
	public void delete(MasDegreetype masDegreetype) {
		masDegreetypeDao.delete(masDegreetype);
		
	}

	@Override
	public MasDegreetype find(Integer Id) {
		
		return masDegreetypeDao.find(Id);
	}

	@Override
	public List<MasDegreetype> findAll() {
		
		return masDegreetypeDao.findAll();
	}

	@Override
	public List<MasDegreetype> findByCriteria(MasDegreetype masDegreetype) {
		
		return null;
	}

	@Override
	public void deleteById(Integer id) {
		
		
	}

	

}
