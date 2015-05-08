/**
 *
 * @author Pranrajit
 * @date 8 พ.ค. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasCoreSkill;


public interface MasCoreSkillService {
	
	
	public void create(MasCoreSkill masCoreSkill);
	public void update(MasCoreSkill masCoreSkill);
	public void delete(MasCoreSkill masCoreSkill);
	public MasCoreSkill find(Integer id);
	public List<MasCoreSkill> findAll();
	public List<MasCoreSkill> findByCriteria(MasCoreSkill masCoreSkill);
	public MasCoreSkill deleteById(Integer id);
}
