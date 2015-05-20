/**
 *
 * @author Preeyaporn
 * @date 13 พ.ค. 2558
 */
package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.HistoryDao;
import com.aug.hr.dto.services.HistoryDtoService;
import com.aug.hr.entity.History;
import com.aug.hr.entity.dto.ExperienceDto;
import com.aug.hr.entity.dto.HistoryDto;
import com.mysql.jdbc.StringUtils;

@Repository
public class HistoryDaoImpl extends GenericDaoImpl<History, Integer> implements HistoryDao{

	public HistoryDaoImpl() {
		super(History.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<History> findByCriteria(History history) {
		Criteria c = getCurrentSession().createCriteria(History.class);
		if (!StringUtils.isNullOrEmpty(history.getPosition())) {
			c.add(Restrictions.like("position", "%" + history.getPosition() + "%"));
		}
		return c.list();
	}

	@Override
	public History deleteById(Integer id) {
		History history =(History)getCurrentSession().load(History.class, id);
		getCurrentSession().delete(history);
		return history;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HistoryDto> searchHistory(Integer id) {

		Query namedQuery = getCurrentSession().getNamedQuery("searchHistory").setInteger("empId" ,id);
		//namedQuery.executeUpdate();
		List<HistoryDto> expDto = namedQuery.list();
	     return expDto;
	}

}
