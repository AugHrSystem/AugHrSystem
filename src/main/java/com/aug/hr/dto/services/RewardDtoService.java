package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.RewardDao;
import com.aug.hr.entity.dto.RewardDto;


@Service("rewardDtoService")
@Transactional
public class RewardDtoService {
	
	@Autowired private RewardDao rewardDao;
	
	public List<RewardDto> searchReward(Integer id){
		return rewardDao.searchReward(id);
	}

}
