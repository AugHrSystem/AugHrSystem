package com.aug.hr.dao.impl;


import java.io.Serializable;
import java.util.List;










import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.FamilyDao;
import com.aug.hr.entity.Family;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.Family2Dto;
import com.aug.hr.entity.dto.SkillLanguageDto;

@Repository
public class FamilyDaoImpl extends GenericDaoImpl<Family, Integer> implements FamilyDao,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public FamilyDaoImpl() {
		super(Family.class);
		// TODO Auto-generated constructor stub
	}

	

	
	@Override
	public List<Family> findFamilyByEmployeeId(Integer Id) {
		// TODO Auto-generated method stub
		
		Criteria c = getCurrentSession().createCriteria(Family.class,"family");		
		c.setFetchMode("employee",FetchMode.JOIN);
		c.createAlias("employee", "employee");
		c.setFetchMode("masRelation",FetchMode.JOIN);
		c.createAlias("masRelation", "masRelation");
		c.add(Restrictions.eq("family.employee.id", Id));
	  
		return c.list();
		
	}

	
	

	@Override
	public Employee findEmployeeById(Integer Id) {
		// TODO Auto-generated method stub
		Employee employee = (Employee) getCurrentSession().get(Employee.class,Id);
		return employee;
	}

	
	
	@Override
	public Family findLastFamily(Integer Id) {
		// TODO Auto-generated method stub
		Criteria c = getCurrentSession().createCriteria(Family.class,"family");
		c.setFetchMode("employee",FetchMode.JOIN);
		c.createAlias("employee", "employee");
		c.setFetchMode("masRelation",FetchMode.JOIN);
		c.createAlias("masRelation", "masRelation");
		c.add(Restrictions.eq("id", Id));
		Family empFamily = (Family)c.uniqueResult();
		return empFamily;
	}




	@Override
	public void saveByNameQuery(Family2Dto family) {
		// TODO Auto-generated method stub
		
		Query query =  getCurrentSession().getNamedQuery("insertFamily");
				query.setString("FIRSTNAME" ,family.getFirstName());
				query.setString("LASTNAME", family.getLastName());
				query.setInteger("AGE", family.getAge());
				query.setString("ADDRESS", family.getAddress());
				query.setString("OCCUPATION", family.getOccupation());
				query.setString("POSITION", family.getPosition());
				query.setString("TEL", family.getMobile());
				query.setInteger("MASRELATION_ID", family.getMasRelationTypeId());
				query.setInteger("EMPLOYEE_ID", family.getEmployeeId());
				query.setString("GENDER", family.getGender());
				query.setInteger("CREATEDBY", family.getEmployeeId());
				query.executeUpdate();
			
	}




	@Override
	public void updateByNameQuery(Family2Dto family) {
		// TODO Auto-generated method stub
		Query query =  getCurrentSession().getNamedQuery("updateFamily");
		query.setString("FIRSTNAME" ,family.getFirstName());
		query.setString("LASTNAME", family.getLastName());
		query.setInteger("AGE", family.getAge());
		query.setString("ADDRESS", family.getAddress());
		query.setString("OCCUPATION", family.getOccupation());
		query.setString("POSITION", family.getPosition());
		query.setString("TEL", family.getMobile());
		query.setInteger("MASRELATION_ID", family.getMasRelationTypeId());
		//query.setInteger("EMPLOYEE_ID", family.getEmployeeId());
		query.setString("GENDER", family.getGender());
		query.setInteger("UPDATEDBY", family.getEmployeeId());
		query.setInteger("familyId", family.getId());
		query.executeUpdate();
	}




	@Override
	public void deleteByNameQuery(Family2Dto family) {
		// TODO Auto-generated method stub
		Query query =  getCurrentSession().getNamedQuery("deleteFamily");
		query.setInteger("familyId", family.getId());
		query.executeUpdate();
	}




	@Override
	public List<Family2Dto> findFamilyList(Integer id) {
		// TODO Auto-generated method stub
		Query query =  getCurrentSession().getNamedQuery("listFamily").setInteger("empId" ,id);
		List<Family2Dto> familyDtoList = query.list();
		return familyDtoList;
	}

}
