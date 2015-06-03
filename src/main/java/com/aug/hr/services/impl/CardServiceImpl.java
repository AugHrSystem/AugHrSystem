package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.CardDao;
import com.aug.hr.entity.Card;
import com.aug.hr.services.CardService;


@Service("attendanceService")
@Transactional
public class CardServiceImpl implements CardService {

	@Autowired
	private CardDao cardDao;
	
	@Override
	public List<Card> findAll() {
		return cardDao.findAll();
	}

	
	
	@Override
	public void create(Card card) {
		cardDao.create(card);
		
	}

	@Override
	public void update(Card card) {
		cardDao.update(card);
		
	}

	@Override
	public void delete(Card card) {
		cardDao.delete(card);
		
	}

	@Override
	public Card findById(Integer id) {
		return cardDao.find(id);
	}

	
	@Override
	public List<Card> findByCriteria(Card card) {
		return cardDao.findByCriteria(card);
	}

	@Override
	public Card deleteById(Integer id) {
		return cardDao.deleteById(id);
	}

}
