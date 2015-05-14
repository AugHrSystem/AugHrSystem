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
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Repository;


@Entity
@Table(name="EMPLOYEEFAMILY")
public class Family extends BaseEntity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5187864989377656419L;
	private Integer id; //empFamilyId
	private String firstName;
	private String lastName;
	private String gender;
	private Integer age;
	private String mobile;
	private String address;
	private String occupation;
	private String position;
	private Employee employee;
	private MasRelationType masRelation;
	@Transient
	private String relationName;
	@Transient
	private String status;
	
	
	@Id
	@GeneratedValue
	@Column(name="ID",length=6)
	public Integer getId() {
		return id;
	}
	
	
	public void setId(Integer id) {
		this.id = id;
	}

	
	
	@Column(name="FIRSTNAME",length=50)	
	@NotNull
	public String getFirstName() {
		return firstName;
	}

	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	
	
	@Column(name="LASTNAME",length=50)
	@NotNull
	public String getLastName() {
		return lastName;
	}
	
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	@Column(name="GENDER",length=10)
	@NotNull
	public String getGender() {
		return gender;
	}
	
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	@Column(name="AGE",length=3)
	@NotNull
	public Integer getAge() {
		return age;
	}
	
	
	public void setAge(Integer age) {
		this.age = age;
	}
	
	
	
	
	@Column(name="TEL",length=10)
	@NotNull
	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	@Column(name="ADDRESS")
	@NotNull
	public String getAddress() {
		return address;
	}
	
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	@Column(name="OCCUPATION")
	public String getOccupation() {
		return occupation;
	}
	
	
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	
	@Column(name="POSITION")
	public String getPosition() {
		return position;
	}
	
	
	public void setPosition(String position) {
		this.position = position;
	}
	
	
   
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="MASRELATION_ID",nullable=false)
	public MasRelationType getMasRelation() {
		return masRelation;
	}


	public void setMasRelation(MasRelationType masRelation) {
		this.masRelation = masRelation;
	}
	
	
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="EMPLOYEE_ID",nullable=false)
	public Employee getEmployee() {
		return employee;
	}

	

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}


	public String getRelationName() {
		return relationName;
	}


	public void setRelationName(String relationName) {
		this.relationName = relationName;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Family [id=");
		builder.append(id);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", age=");
		builder.append(age);
		builder.append(", mobile=");
		builder.append(mobile);
		builder.append(", address=");
		builder.append(address);
		builder.append(", occupation=");
		builder.append(occupation);
		builder.append(", position=");
		builder.append(position);
		builder.append(", employee=");
		builder.append(employee);
		builder.append(", masRelation=");
		builder.append(masRelation);
		builder.append(", relationName=");
		builder.append(relationName);
		builder.append(", status=");
		builder.append(status);
		builder.append("]");
		return builder.toString();
	}
	
	
	
    

	
	
	
	


	

	


	
		

}
