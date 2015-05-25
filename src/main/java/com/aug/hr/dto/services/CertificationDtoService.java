/**
 *
 * @author Preeyaporn
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.CertificationDao;
import com.aug.hr.entity.dto.CertificationDto;

@Service("certificationDtoService")
@Transactional
public class CertificationDtoService {

	@Autowired private CertificationDao certificationDao;
	
	public List<CertificationDto> searchCertification(Integer id){
		return certificationDao.searchCertification(id);
	}
}
