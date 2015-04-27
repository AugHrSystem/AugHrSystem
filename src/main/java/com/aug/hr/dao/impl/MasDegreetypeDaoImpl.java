/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasDegreetypeDao;
import com.aug.hr.entity.MasDegreetype;


@Repository
public class MasDegreetypeDaoImpl extends GenericDaoImpl<MasDegreetype,Integer> implements MasDegreetypeDao{

	public MasDegreetypeDaoImpl() {
		super(MasDegreetype.class);
		// TODO Auto-generated constructor stub
	}

}
