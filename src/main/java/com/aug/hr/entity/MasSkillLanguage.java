package com.aug.hr.entity;

import java.io.Serializable;
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

import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
@Table(name="MAS_SKILLLANGUAGE")
public class MasSkillLanguage extends BaseEnityMasterData {
	
	private Integer id;
	private String  skillLanguageName;
	private Set<SkillLanguage> skillLanguageList;
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	public Integer getId() {
		return id;
	}
	
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="SKILLLANGUAGE")
	public String getSkillLanguageName() {
		return skillLanguageName;
	}
	
	
	public void setSkillLanguageName(String skillLanguageName) {
		this.skillLanguageName = skillLanguageName;
	}

  
	
	
	@OneToMany(mappedBy="masSkillLanguage",fetch=FetchType.LAZY)

	public Set<SkillLanguage> getSkillLanguageList() {
		return skillLanguageList;
	}


	public void setSkillLanguageList(Set<SkillLanguage> skillLanguageList) {
		this.skillLanguageList = skillLanguageList;
	}
	

	
	

}
