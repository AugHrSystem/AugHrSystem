package com.aug.hr.entity.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;


@NamedNativeQueries({
	@NamedNativeQuery(
            name = "searchExperience",
            query = "select exp.id, exp.company_name, exp.date_from, exp.date_to, exp.address, exp.type_of_business, exp.position, exp.reference, exp.responsibility, exp.employee_id, emp.employee_code from emp_experience as exp, emp_employee as emp where exp.employee_id=:empId and emp.id = exp.employee_id", 
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
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateFrom;
	@Column(name ="DATE_TO")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateTo;
	@Column(name = "ADDRESS")
	private String address;
	@Column(name ="TYPE_OF_BUSINESS")
	private String businessType;
	@Column(name ="POSITION")
	private String position;
	@Column(name ="REFERENCE")
	private String reference;
	@Column(name = "RESPONSIBILITY")
	private String responsibility;
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
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
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
	
}
