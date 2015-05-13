/**
 *
 * @author Pranrajit
 * @date 29 เม.ย. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.MasProvinceDao;
import com.aug.hr.entity.MasProvince;
import com.aug.hr.services.MasProvinceService;
@Service("masProvinceService")
@Transactional
public class MasProvinceImpl implements MasProvinceService {

	@Autowired
	private MasProvinceDao masProvinceDao;
	
	@Override
	public void create(MasProvince masProvince) {
		masProvinceDao.create(masProvince);
	}

	@Override
	public void update(MasProvince masProvince) {
		
		masProvinceDao.update(masProvince);
		
	}

	@Override
	public void delete(MasProvince masProvince) {
		
		masProvinceDao.delete(masProvince);
	}

	@Override
	public MasProvince find(Integer Id) {
		
		return masProvinceDao.find(Id);
	}

	@Override
	public List<MasProvince> findAll() {
		
		return masProvinceDao.findAll();
	}

	@Override
	public List<MasProvince> findByCriteria(MasProvince masProvince) {
		
		return null;
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		
	}

}
