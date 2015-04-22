package com.aug.hr.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "POSITION")
public class Position extends BaseEnityMasterData {

	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;
	@Column(name = "BUSINESS")
	private String business;
	@Column(name = "COMPANY_NAME")
	private String company_name;
	@Column(name = "DATE_FROM")
	private Date date_form;
	@Column(name = "DATE_TO")
	private Date date_to;
	@Column(name = "DESCRIPTION",nullable=false)
	private String description;
	@Column(name = "SUPERVISOR",nullable=false)
	private String supervisor;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public Date getDate_form() {
		return date_form;
	}
	public void setDate_form(Date date_form) {
		this.date_form = date_form;
	}
	public Date getDate_to() {
		return date_to;
	}
	public void setDate_to(Date date_to) {
		this.date_to = date_to;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSupervisor() {
		return supervisor;
	}
	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}
	
	
}
