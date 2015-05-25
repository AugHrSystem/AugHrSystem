package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;



 @NamedNativeQueries({
	@NamedNativeQuery(
            name = "listSkillLanguage",
              query = "select language.ID as ID,employee.ID as EMPLOYEE_ID,employee.EMPLOYEE_CODE as EMPLOYEE_CODE,maslanguage.ID as MAS_SKILLLANGUAGEID,maslanguage.SKILLLANGUAGE as MAS_SKILLLANGUAGENAME,language.SPEAKINGSKILL as SPEAKKING,"
            		+ "language.READINGSKILL as READING,language.UNDERSTANDINDSKILL as UNDERSTANDDING,language.WRITINGSKILL as WRITING  from EMP_SKILLLANGUAGE as language join EMP_EMPLOYEE as employee"
            		+ " on employee.ID=language.EMPLOYEE_ID"
            		+ " join MAS_SKILLLANGUAGE as maslanguage on maslanguage.ID=language.MASSKILLLANGUAGE_ID"
            		+ " where employee.ID=:empId", 
            resultClass = SkillLanguageDto.class)
  })


@Entity
public class SkillLanguageDto {
	
	@Id
	@Column(name="ID")
	private Integer id;
	@Column(name="EMPLOYEE_ID")
	private Integer employeeId;
	@Column(name="EMPLOYEE_CODE")
	private String  employeeCode;
	@Column(name="MAS_SKILLLANGUAGEID")
	private Integer masSkillLanguageId;
	@Column(name="MAS_SKILLLANGUAGENAME")
    private String  masSkillLanguageName;
	@Column(name="SPEAKKING")
	private String  abilitySpeaking;
	@Column(name="READING")
	private String  abilityReading;
	@Column(name="UNDERSTANDDING")
	private String  abilityUnderstanding;
	@Column(name="WRITING")
	private String  abilityWriting;
	
	
	
	public Integer getId() {
		return id;
	}
	
	
	public void setId(Integer id) {
		this.id = id;
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
	
	
	public Integer getMasSkillLanguageId() {
		return masSkillLanguageId;
	}
	
	
	public void setMasSkillLanguageId(Integer masSkillLanguageId) {
		this.masSkillLanguageId = masSkillLanguageId;
	}
	
	
	public String getMasSkillLanguageName() {
		return masSkillLanguageName;
	}
	
	
	public void setMasSkillLanguageName(String masSkillLanguageName) {
		this.masSkillLanguageName = masSkillLanguageName;
	}
	
	
	public String getAbilitySpeaking() {
		return abilitySpeaking;
	}
	
	
	public void setAbilitySpeaking(String abilitySpeaking) {
		this.abilitySpeaking = abilitySpeaking;
	}
	
	
	public String getAbilityReading() {
		return abilityReading;
	}
	
	
	public void setAbilityReading(String abilityReading) {
		this.abilityReading = abilityReading;
	}
	
	
	public String getAbilityUnderstanding() {
		return abilityUnderstanding;
	}
	
	
	public void setAbilityUnderstanding(String abilityUnderstanding) {
		this.abilityUnderstanding = abilityUnderstanding;
	}
	
	
	public String getAbilityWriting() {
		return abilityWriting;
	}
	
	
	public void setAbilityWriting(String abilityWriting) {
		this.abilityWriting = abilityWriting;
	}	

}
