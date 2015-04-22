package com.aug.hr.entity;

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
@Table(name = "SPECIALTY")
public class Specialty extends BaseEntity{
	
	@Id
	@Column(name="SPEC_ID")
	@GeneratedValue
	private Integer id;

	
	@Column(name = "NAME" ,nullable = false)
	private String name;
	
	@Column(name = "CODE" ,nullable = false)
	private String code;
	
	@Column(name = "ISACTIVE")
	private Boolean isActive;
	
	
	
	
	@OneToMany(mappedBy = "specialty")
	private Set<Ability> abilities = new HashSet<Ability>();




	public Integer getId() {
		return id;
	}




	public void setId(Integer id) {
		this.id = id;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getCode() {
		return code;
	}




	public void setCode(String code) {
		this.code = code;
	}




	public Boolean getIsActive() {
		return isActive;
	}




	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}




	public Set<Ability> getAbilities() {
		return abilities;
	}




	public void setAbilities(Set<Ability> abilities) {
		this.abilities = abilities;
	}
	
	
	
	
}
