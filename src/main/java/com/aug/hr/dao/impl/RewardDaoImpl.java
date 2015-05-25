package com.aug.hr.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.aug.hr.dao.RewardDao;
import com.aug.hr.entity.Reference;
import com.aug.hr.entity.Reward;
import com.aug.hr.entity.dto.RewardDto;
import com.mysql.jdbc.StringUtils;


@Repository("RewardDao")
public class RewardDaoImpl extends GenericDaoImpl<Reward, Integer> implements RewardDao {

	
	public RewardDaoImpl(){
		super(Reward.class);
	}


	@Override
	public List<Reward> findByCriteria(Reward reward) {
		Criteria c = getCurrentSession().createCriteria(Reward.class);
		if (!StringUtils.isNullOrEmpty(reward.getName())) {
			c.add(Restrictions.like("name", "%" + reward.getName() + "%"));
		}
		return c.list();
	}

	@Override
	public Reward deleteById(Integer id) {
		Reward reward =(Reward)getCurrentSession().load(Reward.class, id);
		getCurrentSession().delete(reward);
		return reward;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RewardDto> searchReward(Integer id) {
		Query nameQuery = getCurrentSession().getNamedQuery("searchReward").setInteger("empId" ,id);
			List<RewardDto> rewardDto = nameQuery.list();
			return rewardDto;
	}
	
	
}
