/**
 *
 * @author Preeyaporn
 * @date 20 พ.ค. 2558
 */
package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.HistoryDao;
import com.aug.hr.entity.dto.HistoryDto;

@Service("historyDtoService")
@Transactional
public class HistoryDtoService {

	@Autowired private HistoryDao historyDao;
	
	public List<HistoryDto> searchHistory(Integer id) {
		return historyDao.searchHistory(id);
		
		
		
	}
	
	
	
}
