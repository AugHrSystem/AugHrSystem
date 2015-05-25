package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@NamedNativeQueries({
	@NamedNativeQuery(
            name = "searchReward",
            query = "select reward.id,name,reward.year,reward.detailreward,reward.isActive ,reward.employee_id from emp_reward as reward ,emp_employee as emp where reward.employee_id =:empId and reward.employee_id=emp.id", 
            resultClass = RewardDto.class)
  })


@Entity
public class RewardDto {
	
	@Column(name = "ID")
	@Id
	private Integer id;
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "YEAR")
	private String year;
		
	@Column(name = "DETAILREWARD")
	private String detailreward;
	
	
	@Column(name = "ISACTIVE")
	private Boolean isActive;

	@Column(name ="EMPLOYEE_ID")
	private String employeeId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getDetailreward() {
		return detailreward;
	}

	public void setDetailreward(String detailreward) {
		this.detailreward = detailreward;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	
	
}
