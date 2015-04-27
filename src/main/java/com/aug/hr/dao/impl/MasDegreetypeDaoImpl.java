/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasDegreetypeDao;
import com.aug.hr.entity.Degreetype;


@Repository
public class MasDegreetypeDaoImpl extends GenericDaoImpl<Degreetype,Integer> implements MasDegreetypeDao{

	public MasDegreetypeDaoImpl() {
		super(Degreetype.class);
		// TODO Auto-generated constructor stub
	}

}
