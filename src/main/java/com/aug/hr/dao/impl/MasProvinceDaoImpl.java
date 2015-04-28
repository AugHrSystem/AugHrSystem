/**
 *
 * @author Pranrajit
 * @date 27 เม.ย. 2558
 */
package com.aug.hr.dao.impl;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasProvinceDao;
import com.aug.hr.entity.MasProvince;
@Repository
public class MasProvinceDaoImpl extends GenericDaoImpl<MasProvince, Integer> implements MasProvinceDao{

	public MasProvinceDaoImpl() {
		super(MasProvince.class);
		// TODO Auto-generated constructor stub
	}

}
