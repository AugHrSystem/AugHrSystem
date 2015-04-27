/**
 *
 * @author Preeyaporn
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.DivisionDao;
import com.aug.hr.entity.Division;

@Repository("divisionDao")
public class DivisionDaoImpl extends GenericDaoImpl<Division, Integer> implements DivisionDao{

	public DivisionDaoImpl() {
		super(Division.class);
	}

}
