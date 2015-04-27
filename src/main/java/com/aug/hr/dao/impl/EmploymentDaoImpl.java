/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.EmploymentDao;
import com.aug.hr.entity.Employment;

@Repository
public class EmploymentDaoImpl extends GenericDaoImpl<Employment, Integer> implements EmploymentDao{

	public EmploymentDaoImpl() {
		super(Employment.class);
		// TODO Auto-generated constructor stub
	}

}
