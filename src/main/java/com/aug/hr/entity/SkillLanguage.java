package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="EMP_SKILLLANGUAGE")
public class SkillLanguage extends BaseEntity{
	
	private Integer id;
	private String  name;
	private String  abilityListen;
	private String  abilitySpeak;
	private String  abilityReading;
	private Employee employee;
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="SKILLNAME")
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="SKILL_LISTEN")
	public String getAbilityListen() {
		return abilityListen;
	}
	
	public void setAbilityListen(String abilityListen) {
		this.abilityListen = abilityListen;
	}
	
	@Column(name="SKILL_SPEAKING")
	public String getAbilitySpeak() {
		return abilitySpeak;
	}
	
	
	public void setAbilitySpeak(String abilitySpeak) {
		this.abilitySpeak = abilitySpeak;
	}
	
	@Column(name="SKILL_READING")
	public String getAbilityReading() {
		return abilityReading;
	}
	
	public void setAbilityReading(String abilityReading) {
		this.abilityReading = abilityReading;
	}

	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="EMPLOYEE_ID",nullable=false)
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	
	

}
