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
	private String relation;
	private Official official;
	
	
	
	
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
	
	
	
	@Column(name="RELATION",length=40)
	@NotNull
	public String getRelation() {
		return relation;
	}
	
	
	public void setRelation(String relation) {
		this.relation = relation;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="OFFICIAL_ID",nullable=false)
	public Official getOfficial() {
		return official;
	}


	public void setOfficial(Official official) {
		this.official = official;
	}

	

	@Override
	public String toString() {
		return "Family [id=" + id + ", firstName=" + firstName + ", lastName="
				+ lastName + ", gender=" + gender + ", age=" + age
				+ ", mobile=" + mobile + ", address=" + address
				+ ", occupation=" + occupation + ", position=" + position
				+ ", relation=" + relation + ", official=" + official + "]";
	}
	
	
	
	
	


	

	


	
		

}
