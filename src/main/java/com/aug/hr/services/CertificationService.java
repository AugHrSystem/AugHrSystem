/**
 *
 * @author Preeyaporn
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Certification;

public interface CertificationService {

	public List<Certification> findAll();
	public void create(Certification certification);
	public void update(Certification certification);
	public void delete(Certification certification);
	public Certification findById(Integer id);
	public List<Certification> findByCriteria(Certification certification);
	public Certification deleteById(Integer id);
	
}
