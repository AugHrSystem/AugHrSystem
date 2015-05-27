package com.aug.hr.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="EMP_SITE")
public class Site extends BaseEntity{
	
	
	private Integer id;
	private String projectName;
	private Date startDate;
	private Date endDate;
	private String projectOwner;
	private String  projectOwnerContact; 
    private Employee employee;
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	@Column(name="PROJECTNAME",nullable=false)
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	
	@Column(name="STARTDATE",nullable=false)
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	
	@Column(name="ENDDATE",nullable=false)
	public Date getEndDate() {
		return endDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
	@Column(name="PROJECTOWNER",nullable=false)
	public String getProjectOwner() {
		return projectOwner;
	}
	public void setProjectOwner(String projectOwner) {
		this.projectOwner = projectOwner;
	}
	
	
	@Column(name="PROJECTOWNERCONTACT",nullable=false)
	public String getProjectOwnerContact() {
		return projectOwnerContact;
	}
	
	
	public void setProjectOwnerContact(String projectOwnerContact) {
		this.projectOwnerContact = projectOwnerContact;
	}
	
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EMPLOYEE_ID", referencedColumnName = "id", nullable = false)
	public Employee getEmployee() {
		return employee;
	}
	
	
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	

}
