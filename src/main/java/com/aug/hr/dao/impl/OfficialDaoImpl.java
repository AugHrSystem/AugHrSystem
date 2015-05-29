/**
 *
 * @author natechanok
 * @date Apr 30, 2015
 */

package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.OfficialDao;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.AllEmployeeDto;
import com.aug.hr.entity.dto.OfficialDto;
import com.mysql.jdbc.StringUtils;
@Repository
public class OfficialDaoImpl extends GenericDaoImpl<Official, Integer> implements OfficialDao{

	public OfficialDaoImpl() {
		super(Official.class);
		// TODO Auto-generated constructor stub
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<Official> findByCriteria(Official official){
		
		Criteria c = getCurrentSession().createCriteria(Official.class);
		if (!StringUtils.isNullOrEmpty(official.getPositionAppliedFor())) {
			c.add(Restrictions.like("name", "%" + official.getPositionAppliedFor() + "%"));
		}
		return c.list();
		
	}
	
	public Official deleteById(Integer id){
		
		Official official =(Official)getCurrentSession().load(Official.class, id);
		getCurrentSession().delete(official);
		return official;
	}


	@Override
	public void saveOfficialByNameQuery(OfficialDto officialDto) {
		
		Query query = getCurrentSession().getNamedQuery("insertOfficial");
		query.setDate("START_DATE", officialDto.getStartDate());
		query.setString("POSITION_APPLIED_FOR", officialDto.getPositionAppliedFor());
		query.setDouble("SALARY_EXPECTED", officialDto.getSalaryExpected());
		//query.setInteger("EMPLOYEE_ID", officialDto.getEmployeeId());
		
		query.executeUpdate();
		
		
	}



	@SuppressWarnings("unchecked")
	public List<OfficialDto> searchOfficial() {
		Query namedQuery = getCurrentSession().getNamedQuery("searchOfficial");
		List<OfficialDto> offDto = namedQuery.list();
		return offDto;
	}



	@Override
	public Official searhEmpIdtoOfficial() {
		Query query = getCurrentSession().getNamedQuery("searchIdEmptoOfficial");
		List<Official> official = query.list();
		return official.get(0);
	}
	




}
