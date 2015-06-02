/**
 *
 * @author Preeyaporn
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.CertificationDao;
import com.aug.hr.entity.Certification;
import com.aug.hr.entity.dto.CertificationDto;
import com.aug.hr.services.CertificationService;

@Service("certificationService")
@Transactional
public class CertificationServiceImpl implements CertificationService{

	@Autowired
	private CertificationDao certificationDao;
	
	@Override
	public List<Certification> findAll() {
		return certificationDao.findAll();
	}

	@Override
	public void create(Certification certification) {
		certificationDao.create(certification);
	}

	@Override
	public void update(Certification certification) {
		certificationDao.update(certification);
	}

	@Override
	public void delete(Certification certification) {
		certificationDao.delete(certification);
	}

	@Override
	public Certification findById(Integer id) {
		return certificationDao.find(id);
	}

	@Override
	public List<Certification> findByCriteria(Certification certification) {
		return certificationDao.findByCriteria(certification);
	}

	@Override
	public Certification deleteById(Integer id) {
		return certificationDao.deleteById(id);
	}

	@Override
	public List<CertificationDto> searchCertification(Integer id) {
		return certificationDao.searchCertification(id);
	}

}
