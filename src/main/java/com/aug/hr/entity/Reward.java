package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "EMP_REWARD")
public class Reward extends BaseEntity{

	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "NAME" ,nullable = false)
	private String name;
	
	@Column(name = "DETAILREWARD")
	private String detailreward;
	
	@Column(name = "BENEFIT")
	private String benefit;
	
	@Column(name = "ISACTIVE",nullable=true)
	private Boolean isActive;
	
	
	@ManyToOne
	@JoinColumn(name = "EMPLOYEE_ID")
	private Employee employee;


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


	public String getDetailreward() {
		return detailreward;
	}


	public void setDetailreward(String detailreward) {
		this.detailreward = detailreward;
	}


	public String getBenefit() {
		return benefit;
	}


	public void setBenefit(String benefit) {
		this.benefit = benefit;
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
	
	
	
	
	
}
