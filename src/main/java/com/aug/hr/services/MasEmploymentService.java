/**
 *
 * @author natechanok
 * @date Apr 29, 2015
 */

package com.aug.hr.services;

import java.util.List;
import com.aug.hr.entity.MasEmployment;


public interface MasEmploymentService {
	
	public void create(MasEmployment masEmployment );
	public void update(MasEmployment masEmployment);
	public void delete(MasEmployment masEmployment);
	public MasEmployment findById(Integer Id);
	public List<MasEmployment> findAll();
	public List<MasEmployment> findByCriteria(MasEmployment masEmployment);
	public MasEmployment deleteById(Integer id);

}
