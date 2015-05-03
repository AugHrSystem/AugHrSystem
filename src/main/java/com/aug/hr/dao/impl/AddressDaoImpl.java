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

import com.aug.hr.dao.AddressDao;
import com.aug.hr.entity.Address;
import com.mysql.jdbc.StringUtils;

@Repository
public class AddressDaoImpl extends GenericDaoImpl<Address, Integer> implements AddressDao{

	public AddressDaoImpl() {
		super(Address.class);
	
	}

	@SuppressWarnings("unchecked")
	public List<Address> findByCriteria(Address address) {

		Criteria c = getCurrentSession().createCriteria(Address.class);
		if (!StringUtils.isNullOrEmpty(address.getAddress1())) {
			c.add(Restrictions.like("name", "%" + address.getAddress1() + "%"));
		}
		return c.list();
	}

	
	public Address deleteById(Integer id) {
		
		Address address =(Address)getCurrentSession().load(Address.class, id);
		getCurrentSession().delete(address);
		return address;
	}

}
