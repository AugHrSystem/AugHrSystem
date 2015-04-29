/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.AbilityDao;
import com.aug.hr.entity.Ability;

import com.aug.hr.entity.Employee;
import com.mysql.jdbc.StringUtils;

@Repository
public class AbilityDaoImpl extends GenericDaoImpl<Ability,Integer> implements AbilityDao{

	public AbilityDaoImpl() {
		super(Ability.class);
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("unchecked")
	public List<Employee> findByCriteria(Employee employee) {
		Criteria c = getCurrentSession().createCriteria(Employee.class);
		if (!StringUtils.isNullOrEmpty(employee.getName())) {
			c.add(Restrictions.like("Name", "%" + employee.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public Ability deleteById(Integer id) {
		Ability ability =(Ability)getCurrentSession().load(Ability.class, id);
		getCurrentSession().delete(ability);
		return ability;
	}
	}

	


