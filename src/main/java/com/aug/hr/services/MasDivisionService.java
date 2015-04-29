/**
 *
 * @author Preeyaporn
 * @date 29 เม.ย. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasDivision;

public interface MasDivisionService {

	public List<MasDivision> findAll();
	public void create(MasDivision masDivision);
	public void update(MasDivision masDivision);
	public void delete(MasDivision masDivision);
	public MasDivision findById(Integer id);
	public List<MasDivision> findByCriteria(MasDivision masDivision);
	public MasDivision deleteById(Integer id);
}
