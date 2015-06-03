package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Card;
import com.aug.hr.entity.dto.CardDto;


public interface CardDao extends GenericDao<Card, Integer>{

	public List<Card> findByCriteria(Card card);

	public Card deleteById(Integer id);

	public List<CardDto> searchCard(Integer id);

	

}
