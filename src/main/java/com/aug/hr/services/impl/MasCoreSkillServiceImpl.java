/**
 *
 * @author Pranrajit
 * @date 8 พ.ค. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.aug.hr.dao.MasCoreSkillDao;
import com.aug.hr.entity.MasCoreSkill;
import com.aug.hr.services.MasCoreSkillService;

public class MasCoreSkillServiceImpl implements MasCoreSkillService{

	
	
	@Autowired
	private MasCoreSkillDao masCoreSkillDao;
	
	@Override
	public void create(MasCoreSkill masCoreSkill) {
		masCoreSkillDao.create(masCoreSkill);
		
	}

	@Override
	public void update(MasCoreSkill masCoreSkill) {
		masCoreSkillDao.update(masCoreSkill);
		
	}

	@Override
	public void delete(MasCoreSkill masCoreSkill) {
		masCoreSkillDao.delete(masCoreSkill);
	}

	@Override
	public MasCoreSkill find(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MasCoreSkill> findAll() {
		// TODO Auto-generated method stub
		return masCoreSkillDao.findAll();
	}

	@Override
	public List<MasCoreSkill> findByCriteria(MasCoreSkill masCoreSkill) {
		// TODO Auto-generated method stub
		return masCoreSkillDao.findByCriteria(masCoreSkill);
	}

	@Override
	public void deleteById(Integer id) {
	
		masCoreSkillDao.deleteById(id);
	}

}
