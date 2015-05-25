/**
 *
 * @author Preeyaporn
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.CertificationDao;
import com.aug.hr.entity.Certification;
import com.aug.hr.entity.dto.CertificationDto;
import com.mysql.jdbc.StringUtils;

@Repository
public class CertificationDaoImpl extends GenericDaoImpl<Certification, Integer> implements CertificationDao{

	public CertificationDaoImpl() {
		super(Certification.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Certification> findByCriteria(Certification certification) {
		
		Criteria c = getCurrentSession().createCriteria(Certification.class);
		if (!StringUtils.isNullOrEmpty(certification.getName())) {
			c.add(Restrictions.like("name", "%" + certification.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public Certification deleteById(Integer id) {
		Certification certification =(Certification)getCurrentSession().load(Certification.class, id);
		getCurrentSession().delete(certification);
		return certification;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CertificationDto> searchCertification(Integer id) {
		Query namedQuery = getCurrentSession().getNamedQuery("searchCertification").setInteger("empId" ,id);
		//namedQuery.executeUpdate();
		List<CertificationDto> cerDto = namedQuery.list();
	     return cerDto;
	}

}
