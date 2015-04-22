package com.aug.hr.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "EXPERIENCE")
public class Experience extends BaseEntity {
	
	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;
	@Column(name = "COMPANY_NAME")
	private String companyName;
	@Column(name = "DATE_FROM")
	private Date dateFrom;
	@Column(name = "DATE_TO")
	private Date dateTo;
	@Column(name = "ADDRESS")
	private String Address;
	@Column(name = "BUSINESS")
	private String business;
	@Column(name = "SUPERVISOR")
	private String superVisor;
	@Column(name = "DESCRIPTION")
	private String description;
	
	@ManyToOne
	@JoinColumn(name="EXPERIENCE_ID")
	private Employee employee;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "experience", cascade=CascadeType.ALL, orphanRemoval=true)
    private Set<Position> position = new HashSet<Position>();
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Date getDateFrom() {
		return dateFrom;
	}
	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}
	public Date getDateTo() {
		return dateTo;
	}
	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getSuperVisor() {
		return superVisor;
	}
	public void setSuperVisor(String superVisor) {
		this.superVisor = superVisor;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Set<Position> getPosition() {
		return position;
	}
	public void setPosition(Set<Position> position) {
		this.position = position;
	}	
	
}
