/**
 *
 * @author natechanok
 * @date Apr 27, 2015
 */

package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasEmploymentDao;
import com.aug.hr.entity.MasEmployment;

@Repository
public class MasEmploymentDaoImpl extends GenericDaoImpl<MasEmployment, Integer> implements MasEmploymentDao{

	public MasEmploymentDaoImpl() {
		super(MasEmployment.class);
		// TODO Auto-generated constructor stub
	}

}
