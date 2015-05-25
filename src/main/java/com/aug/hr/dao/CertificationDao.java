/**
 *
 * @author Preeyaporn
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Certification;
import com.aug.hr.entity.dto.CertificationDto;

public interface CertificationDao extends GenericDao<Certification, Integer>{
	
	public List<Certification> findByCriteria(Certification certification);

	public Certification deleteById(Integer id);

	public List<CertificationDto> searchCertification(Integer id);

}
