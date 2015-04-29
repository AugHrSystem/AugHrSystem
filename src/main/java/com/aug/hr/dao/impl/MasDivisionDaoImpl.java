/**
 *
 * @author Preeyaporn
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasDivisionDao;
import com.aug.hr.entity.MasDivision;

@Repository("masDivisionDao")
public class MasDivisionDaoImpl extends GenericDaoImpl<MasDivision, Integer> implements MasDivisionDao{

	public MasDivisionDaoImpl() {
		super(MasDivision.class);
	}

}
