package com.aug.hr.dto;

import org.springframework.stereotype.Component;



@Component
public class FamilyDto {


	private Integer id;
	private String firstName;
	private String lastName;
	private String name;
	private Integer age;
	private String gender;
	private String occupation;
	private String mobile;
	private String relation;	
	private String position;
	private String address;
	private Integer relationId;
	


	
	
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

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}
	
	public void setAge(Integer age) {
		this.age = age;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getOccupation() {
		return occupation;
	}
	
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getRelation() {
		return relation;
	}
	
	
	public void setRelation(String relation) {
		this.relation = relation;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getRelationId() {
		return relationId;
	}

	public void setRelationId(Integer relationId) {
		this.relationId = relationId;
	}

	
	

	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FamilyDto [id=");
		builder.append(id);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", name=");
		builder.append(name);
		builder.append(", age=");
		builder.append(age);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", occupation=");
		builder.append(occupation);
		builder.append(", mobile=");
		builder.append(mobile);
		builder.append(", relation=");
		builder.append(relation);
		builder.append(", position=");
		builder.append(position);
		builder.append(", address=");
		builder.append(address);
		builder.append(", relationId=");
		builder.append(relationId);		
		builder.append("]");
		return builder.toString();
	}

	
	

}
