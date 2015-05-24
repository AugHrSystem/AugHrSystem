package com.aug.hr.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="EMP_SKILLLANGUAGE")
public class SkillLanguage extends BaseEntity{
	
	private Integer id;
	private String  abilityListening;
	private String  abilitySpeaking;
	private String  abilityReading;
	private String  abilityUnderstanding;
	private Employee employee;
	private MasSkillLanguage masSkillLanguage;
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	
    @Column(name="LISTENINGSKILL",nullable=false)
	public String getAbilityListening() {
		return abilityListening;
	}

	public void setAbilityListening(String abilityListening) {
		this.abilityListening = abilityListening;
	}

	
	@Column(name="SPEAKINGSKILL",nullable=false)
	public String getAbilitySpeaking() {
		return abilitySpeaking;
	}

	public void setAbilitySpeaking(String abilitySpeaking) {
		this.abilitySpeaking = abilitySpeaking;
	}

	
	@Column(name="READINGSKILL",nullable=false)
	public String getAbilityReading() {
		return abilityReading;
	}

	public void setAbilityReading(String abilityReading) {
		this.abilityReading = abilityReading;
	}

	
	@Column(name="UDERSTANDINDSKILL",nullable=false)
	public String getAbilityUnderstanding() {
		return abilityUnderstanding;
	}

	
	
	public void setAbilityUnderstanding(String abilityUnderstanding) {
		this.abilityUnderstanding = abilityUnderstanding;
	}
	
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="EMPLOYEE_ID",nullable=false)

	public Employee getEmployee() {
		return employee;
	}

	
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="MASSKILLLANGUAGE_ID",nullable=false)

//	@JsonIgnore
	public MasSkillLanguage getMasSkillLanguage() {
		return masSkillLanguage;
	}

	public void setMasSkillLanguage(MasSkillLanguage masSkillLanguage) {
		this.masSkillLanguage = masSkillLanguage;
	}

   

}
