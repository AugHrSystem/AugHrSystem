/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.AbilityDao;
import com.aug.hr.entity.Ability;

@Repository
public class AbilityDaoImpl extends GenericDaoImpl<Ability,Integer> implements AbilityDao{

	public AbilityDaoImpl() {
		super(Ability.class);
		// TODO Auto-generated constructor stub
	}

	


}
