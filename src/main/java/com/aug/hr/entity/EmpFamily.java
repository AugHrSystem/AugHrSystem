package com.aug.hr.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Repository;


@Entity
@Table(name="EMPLOYEEFAMILY")
public class EmpFamily extends BaseEntity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5187864989377656419L;
	private Integer empFamilyId;
	private String empFamilyFirstName;
	private String empFamilyLastName;
	private String empFamilyGender;
	private Integer empFamilyAge;
	private String empFamilyMobile;
	private String empFamilyAddress;
	private String empFamilyOccupation;
	private String empFamilyPosition;
	private String empFamilyRelation;
	private Employee employee;
	
	
	
	
	@Id
	@GeneratedValue
	@Column(name="ID",length=6)
	public Integer getEmpFamilyId() {
		return empFamilyId;
	}
	
	
	public void setEmpFamilyId(Integer empFamilyId) {
		this.empFamilyId = empFamilyId;
	}

	
	
	@Column(name="FIRSTNAME",length=50)	
	@NotNull
	public String getEmpFamilyFirstName() {
		return empFamilyFirstName;
	}

	
	public void setEmpFamilyFirstName(String empFamilyFirstName) {
		this.empFamilyFirstName = empFamilyFirstName;
	}

	
	
	@Column(name="LASTNAME",length=50)
	@NotNull
	public String getEmpFamilyLastName() {
		return empFamilyLastName;
	}
	
	
	public void setEmpFamilyLastName(String empFamilyLastName) {
		this.empFamilyLastName = empFamilyLastName;
	}
	
	@Column(name="GENDER",length=10)
	@NotNull
	public String getEmpFamilyGender() {
		return empFamilyGender;
	}
	
	
	public void setEmpFamilyGender(String empFamilyGender) {
		this.empFamilyGender = empFamilyGender;
	}
	
	
	@Column(name="AGE",length=3)
	@NotNull
	public Integer getEmpFamilyAge() {
		return empFamilyAge;
	}
	
	
	public void setEmpFamilyAge(Integer empFamilyAge) {
		this.empFamilyAge = empFamilyAge;
	}
	
	
	
	
	@Column(name="TEL",length=10)
	@NotNull
	public String getEmpFamilyMobile() {
		return empFamilyMobile;
	}


	public void setEmpFamilyMobile(String empFamilyMobile) {
		this.empFamilyMobile = empFamilyMobile;
	}


	@Column(name="ADDRESS")
	@NotNull
	public String getEmpFamilyAddress() {
		return empFamilyAddress;
	}
	
	
	public void setEmpFamilyAddress(String empFamilyAddress) {
		this.empFamilyAddress = empFamilyAddress;
	}
	
	
	@Column(name="OCCUPATION")
	public String getEmpFamilyOccupation() {
		return empFamilyOccupation;
	}
	
	
	public void setEmpFamilyOccupation(String empFamilyOccupation) {
		this.empFamilyOccupation = empFamilyOccupation;
	}
	
	@Column(name="POSITION")
	public String getEmpFamilyPosition() {
		return empFamilyPosition;
	}
	
	
	public void setEmpFamilyPosition(String empFamilyPosition) {
		this.empFamilyPosition = empFamilyPosition;
	}
	
	
	
	@Column(name="RELATION",length=40)
	@NotNull
	public String getEmpFamilyRelation() {
		return empFamilyRelation;
	}
	
	
	public void setEmpFamilyRelation(String empFamilyRelation) {
		this.empFamilyRelation = empFamilyRelation;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="EMP_ID",nullable=false)
	
	public Employee getEmployee() {
		return employee;
	}


	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	
	
	
	
	
	
	
	
	
	
	

	
	

}
