package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Card;

public interface CardService {
	
	public void create(Card card);
	public void update(Card card);
	public void delete(Card card);
	public Card findById(Integer id);
	public List<Card> findAll();
	public List<Card> findByCriteria(Card card);
	public Card deleteById(Integer id);

}
