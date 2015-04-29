/**
 *
 * @author Pranrajit
 * @date 28 เม.ย. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AbilityDao;
import com.aug.hr.entity.Ability;
import com.aug.hr.entity.Employee;
import com.aug.hr.services.AbilityService;

@Service("AbilityService")
@Transactional
public class AbilityServiceImpl implements AbilityService{

	@Autowired
	private AbilityDao abilityDao;
	@Override
	public void create(Ability Ability) {
		abilityDao.create(Ability);
		
	}

	@Override
	public void update(Ability Ability) {
		abilityDao.update(Ability);
		
	}

	@Override
	public void delete(Ability Ability) {
		abilityDao.delete(Ability);
		
	}

	@Override
	public Ability find(Integer id) {
		
		return abilityDao.find(id);
	}

	@Override
	public List<Ability> findAll() {
		
		return abilityDao.findAll();
	}

	@Override
	public List<Employee> findByCriteria(Employee employee) {
		// TODO Auto-generated method stub
		return abilityDao.findByCriteria(employee);
	}

	@Override
	public Ability deleteById(Integer id) {
	return	 abilityDao.deleteById(id);
		
	}

	@Override
	public List<Ability> findByCriteria(Ability ability) {
		// TODO Auto-generated method stub
		return null;
	}	
	

}