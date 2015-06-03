package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.CardDao;
import com.aug.hr.entity.dto.CardDto;


@Service("attendanceDtoService")
@Transactional
public class CardDtoService {
	
	@Autowired private CardDao cardDao;
	
	public List<CardDto> searchCard(Integer id){
		return cardDao.searchCard(id);
	}

}
