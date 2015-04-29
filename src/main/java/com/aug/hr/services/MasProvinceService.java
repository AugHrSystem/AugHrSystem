/**
 *
 * @author Pranrajit
 * @date 29 เม.ย. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.MasProvince;

public interface MasProvinceService {
	
	public void create(MasProvince masProvince);
	public void update(MasProvince masProvince);
	public void delete(MasProvince masProvince);
	public MasProvince find(Integer Id);
	public List<MasProvince> findAll();
	public List<MasProvince> findByCriteria(MasProvince masProvince);
	public void deleteById(Integer id);

}
