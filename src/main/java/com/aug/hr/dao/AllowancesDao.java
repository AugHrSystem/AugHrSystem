/**
 *
 * @author Preeyaporn
 * @date 3 มิ.ย. 2558
 */
package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Allowances;
import com.aug.hr.entity.dto.AllowancesDto;

public interface AllowancesDao extends GenericDao<Allowances, Integer>{

	public List<Allowances> findByCriteria(Allowances allowances);

	public Allowances deleteById(Integer id);

	public List<AllowancesDto> searchAllowances(Integer id);

}
