/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasAddressTypeDao;
import com.aug.hr.entity.MasAddressType;
import com.mysql.jdbc.StringUtils;

@Repository
public class AddressTypeDaoImpl extends GenericDaoImpl<MasAddressType, Integer> implements MasAddressTypeDao{

	public AddressTypeDaoImpl() {
		super(MasAddressType.class);
		
	}

	@SuppressWarnings("unchecked")
	public List<MasAddressType> findByCriteria(MasAddressType masAddressType) {
		
		Criteria c = getCurrentSession().createCriteria(MasAddressType.class);
		if (!StringUtils.isNullOrEmpty(masAddressType.getName())) {
			c.add(Restrictions.like("name", "%" + masAddressType.getName() + "%"));
		}
		return c.list();
		
	}

	
	public MasAddressType deleteById(Integer id) {
		
		MasAddressType masAddressType =(MasAddressType)getCurrentSession().load(MasAddressType.class, id);
		getCurrentSession().delete(masAddressType);
		return masAddressType;
	}

}
