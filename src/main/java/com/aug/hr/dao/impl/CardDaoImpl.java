package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.CardDao;
import com.aug.hr.entity.Card;
import com.aug.hr.entity.Reward;
import com.aug.hr.entity.dto.CardDto;
import com.aug.hr.entity.dto.RewardDto;
import com.mysql.jdbc.StringUtils;


@Repository("AttendanceDao")
public class CardDaoImpl extends GenericDaoImpl<Card, Integer> implements CardDao{

	public CardDaoImpl() {
		super(Card.class);

	}

	@Override
	public List<Card> findByCriteria(Card card) {
		Criteria c = getCurrentSession().createCriteria(Card.class);
		if (!StringUtils.isNullOrEmpty(card.getCard_no())) {
			c.add(Restrictions.like("card_no", "%" + card.getCard_no() + "%"));
		}
		return c.list();
	}
	
	

	@Override
	public Card deleteById(Integer id) {
		Card card = (Card)getCurrentSession().load(Card.class, id);
		getCurrentSession().delete(card);
		return card;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CardDto> searchCard(Integer id){
		Query nameQuery = getCurrentSession().getNamedQuery("searchCard").setInteger("empId" ,id);
		List<CardDto> cardDto = nameQuery.list();
		return cardDto;
	}

}
