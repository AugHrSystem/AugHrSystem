package com.aug.hr.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.entity.Reward;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.RewardService;


@Controller
public class RewardController {
	
	@Autowired RewardService rewardService;
	
	@Autowired EmployeeService employeeService;
	
	
	@RequestMapping(value = "/reward", method = {RequestMethod.GET,RequestMethod.POST})
    public String list(HttpSession session,Locale locale, ModelMap model) {
		model.addAttribute("rewardList", rewardService.findAll());
		return "/reward/listreward";
	}
	
	
	@RequestMapping(value = "/reward/listAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<Reward> listAll() {
		Reward reward = new Reward();
		reward.setName("");
		return rewardService.findByCriteria(reward);
	}
	
	@RequestMapping(value = "/reward/add", method = RequestMethod.POST)
	public @ResponseBody Reward addReward(@RequestBody Reward reward) {
		rewardService.create(reward);
		return reward;
	}
	
	@RequestMapping(value = "/reward/update", method = RequestMethod.POST)
	public @ResponseBody Reward updateReward(@RequestBody Reward reward ) {
		rewardService.update(reward);
		return reward;
	}

	@RequestMapping(value = "/reward/findById", method = RequestMethod.POST)
	public @ResponseBody Reward findById(@RequestParam Integer id) {
		return rewardService.findById(id);
	}
	
	@RequestMapping(value = "/reward/delete", method = RequestMethod.POST)
	public @ResponseBody String deleteReward(@RequestParam Integer id) {
		rewardService.deleteById(id);
		
		return "{success:true}";
	}
	
	
	@ModelAttribute("reward")
	Reward setupForm() {
		return new Reward();
	}
	//
}