package com.aug.hr.entity.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;


@NamedNativeQueries({
	@NamedNativeQuery(
            name = "searchExperience",
            query = "select exp.id, exp.company_name, exp.date_from, exp.date_to, exp.address, exp.business, exp.position, exp.supervisor, exp.description, exp.employee_id, emp.employee_code from emp_experience as exp, emp_employee as emp where exp.employee_id = emp.id", 
            resultClass = ExperienceDto.class)
  })

@Entity
public class ExperienceDto {
	@Column(name ="ID")
	@Id
	private Integer id;
	@Column(name ="COMPANY_NAME")
	private String companyName;
	@Column(name ="DATE_FROM")
	private Date dateFrom;
	@Column(name ="DATE_TO")
	private Date dateTo;
	@Column(name = "ADDRESS")
	private String address;
	@Column(name ="BUSINESS")
	private String business;
	@Column(name ="POSITION")
	private String position;
	@Column(name ="SUPERVISOR")
	private String superVisor;
	@Column(name = "DESCRIPTION")
	private String description;
	@Column(name ="EMPLOYEE_ID")
	private String employeeId;
	
	@Column(name = "EMPLOYEE_CODE")
	private String employeeCode;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
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
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getSuperVisor() {
		return superVisor;
	}
	public void setSuperVisor(String superVisor) {
		this.superVisor = superVisor;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeeCode() {
		return employeeCode;
	}
	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}
	
}
