/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.AddressDao;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.dto.AddressDto;
import com.aug.hr.entity.dto.AllEmployeeDto;
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
	
	@SuppressWarnings("unchecked")
	public List<AddressDto> searchAddress(Integer id) {
		Query namedQuery = getCurrentSession().getNamedQuery("searchAddress").setInteger("empId" ,id);
		//namedQuery.executeUpdate();
		List<AddressDto> addreDto = namedQuery.list();
	     return addreDto;
	}
	

	@Override
	public void saveAddressByNameQuery(AddressDto addressDto) {
		
		Query query = getCurrentSession().getNamedQuery("insertAddress");
		query.setString("ADDRESS1", addressDto.getAddress1());
		query.setString("ADDRESS2", addressDto.getAddress2());
		query.setInteger("ZIPCODE", addressDto.getZipcode());
		query.setInteger("EMPLOYEE_ID", addressDto.getEmployeeId());
		query.setInteger("ADDRESSTYPE_ID", addressDto.getAddressTypeId());
		query.setInteger("PROVINCE_ID", addressDto.getMasprovinceId());
		
		query.executeUpdate();
		
	}

	@Override
	public List<Address> findAddressByEmployeeId(Integer id) {
		Criteria c = getCurrentSession().createCriteria(Address.class,"address");
		c.setFetchMode("employee", FetchMode.JOIN);
		c.createCriteria("employee", "employee");
		c.add(Restrictions.eq("address.employee.id", id));
		return c.list();
	}
	
	public void updateAddressByNameQuery(AddressDto addressDto){
		
		Query query = getCurrentSession().getNamedQuery("updateAddress");
		query.setString("ADDRESS1", addressDto.getAddress1());
		query.setString("ADDRESS2", addressDto.getAddress2());
		query.setInteger("ZIPCODE", addressDto.getZipcode());
		query.setInteger("EMPLOYEE_ID", addressDto.getEmployeeId());
		query.setInteger("ADDRESSTYPE_ID", addressDto.getAddressTypeId());
		query.setInteger("PROVINCE_ID", addressDto.getMasprovinceId());
		query.setInteger("ID", addressDto.getId());		
		query.setInteger("updatedBy", addressDto.getEmployeeId());
		query.executeUpdate();
	}

	@Override
	public void deleteAddressByNameQuery(AddressDto addressDto) {
		// TODO Auto-generated method stub
		Query query = getCurrentSession().getNamedQuery("deleteAddress");
		query.setInteger("ID", addressDto.getId());
		query.executeUpdate();
	}
		

}
