package com.aug.hr.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "EMP_EXPERIENCE")
public class Experience extends BaseEntity {
	
	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;
	@Column(name = "COMPANY_NAME")
	private String companyName;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Column(name = "DATE_FROM")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateFrom;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Column(name = "DATE_TO")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateTo;
	@Column(name = "ADDRESS")
	private String address;
	@Column(name = "TYPE_OF_BUSINESS")
	private String businessType;
	@Column(name = "POSITION")
	private String position;
	@Column(name = "REFERENCE")
	private String reference;
	@Column(name = "RESPONSIBILITY")
	private String responsibility;	
	@Column(name = "SALARY")
	private Integer salary;	
	@Column(name = "REASON_OF_REGISNATION")
	private String reason;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="EMPLOYEE_ID" , referencedColumnName="id", nullable=false)

//	@JsonIgnore
	private Employee employee;
	
	
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
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getResponsibility() {
		return responsibility;
	}
	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Integer getSalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}
