package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.aug.hr.entity.dto.RewardDto;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "EMP_REWARD")
public class Reward extends BaseEntity{

	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "TYPE_REWARD" ,nullable = false)
	private String typereward;
	
	@Column(name = "YEAR" ,nullable = false)
	private String year;
		
	@Column(name = "REASON" ,nullable = true)
	private String reason;
	
	
	@Column(name = "ISACTIVE",nullable=true)
	private Boolean isActive;
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "EMPLOYEE_ID",nullable = false)

//	@JsonIgnore
	private Employee employee;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getTypereward() {
		return typereward;
	}


	public void setTypereward(String typereward) {
		this.typereward = typereward;
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public Boolean getIsActive() {
		return isActive;
	}


	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}


	public Employee getEmployee() {
		return employee;
	}


	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	
	public RewardDto toRewardDto(){
		RewardDto rewardDto = new RewardDto();
		rewardDto.setId(id);
		rewardDto.setTypereward(typereward);
		rewardDto.setYear(year);
		rewardDto.setReason(reason);
		rewardDto.setIsActive(isActive);
		rewardDto.setEmployeeId(this.getId());
		return rewardDto;
		
	}
	
	
	public Reward fromRewardDto(RewardDto rewardDto){
		Reward reward = new Reward();
		reward.setId(rewardDto.getId());
		reward.setTypereward(rewardDto.getTypereward());
		reward.setYear(rewardDto.getYear());
		reward.setReason(rewardDto.getReason());
		reward.setIsActive(rewardDto.getIsActive());
		
		Employee employee = new Employee();
		employee.setId(rewardDto.getEmployeeId());
		reward.setEmployee(employee);
		return reward;
	}
	
	
	
}
