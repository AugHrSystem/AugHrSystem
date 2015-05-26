package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;

@NamedNativeQueries({
	@NamedNativeQuery(
            name = "listFamily",
              query = "select family.ID as ID,family.FIRSTNAME as FIRSTNAME,family.LASTNAME as LASTNAME, "
              		+ "family.GENDER as GENDER,family.AGE as AGE,family.TEL as TEL,family.ADDRESS as ADDRESS, "
              		+ "family.OCCUPATION as OCCUPATION,family.POSITION as POSITION,family.EMPLOYEE_ID as EMPLOYEE_ID, "
              		+ "employee.EMPLOYEE_CODE as EMPLOYEE_CODE,family.MASRELATION_ID as MASRELATIONTYPE_ID,mas_relation.RELATIONTYPE as MASRELATIONTYPENAME "
              		+ "from  EMP_EMPLOYEEFAMILY as family join MAS_RELATIONTYPE as mas_relation "
              		+ "on mas_relation.ID = family.MASRELATION_ID "
              		+ "join EMP_EMPLOYEE as employee on employee.ID = family.EMPLOYEE_ID "
              		+ "where family.EMPLOYEE_ID=:empId",
            resultClass = Family2Dto.class)
  })


@Entity
public class Family2Dto {
	
	@Id
	@Column(name="ID")
	private Integer id; 
	
	@Column(name="FIRSTNAME")	
	private String firstName;
	
	@Column(name="LASTNAME")
	private String lastName;
	
	@Column(name="GENDER")
	private String gender;
	
	@Column(name="AGE")
	private Integer age;
	
	@Column(name="TEL")
	private String mobile;
	
	@Column(name="ADDRESS")
	private String address;
	
	@Column(name="OCCUPATION")
	private String occupation; 
	
	@Column(name="POSITION")
	private String position; 
	
	@Column(name="EMPLOYEE_ID")
	private Integer employeeId;
	
	@Column(name="EMPLOYEE_CODE")
	private String  employeeCode;
	
	@Column(name="MASRELATIONTYPE_ID")
	private Integer masRelationTypeId;
	
	@Column(name="MASRELATIONTYPENAME")
	private String masRelationTypeName;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public Integer getMasRelationTypeId() {
		return masRelationTypeId;
	}

	public void setMasRelationTypeId(Integer masRelationTypeId) {
		this.masRelationTypeId = masRelationTypeId;
	}

	public String getMasRelationTypeName() {
		return masRelationTypeName;
	}

	public void setMasRelationTypeName(String masRelationTypeName) {
		this.masRelationTypeName = masRelationTypeName;
	}

}
