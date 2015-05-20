/**
 *
 * @author Preeyaporn
 * @date 13 พ.ค. 2558
 */
package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.History;
import com.aug.hr.entity.dto.HistoryDto;

public interface HistoryDao extends GenericDao<History, Integer>{

	public List<History> findByCriteria(History history);

	public History deleteById(Integer id);

	public List<HistoryDto> searchHistory(Integer id);
}
