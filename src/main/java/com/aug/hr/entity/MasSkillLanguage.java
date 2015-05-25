package com.aug.hr.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
@Table(name="MAS_SKILLLANGUAGE")
public class MasSkillLanguage extends BaseEnityMasterData {
	
	private Integer id;
	private String  skillLanguageName;
	private Set<SkillLanguage> skillLanguage;
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	public Integer getId() {
		return id;
	}
	
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="SKILL_LANGUAGE")
	public String getSkillLanguageName() {
		return skillLanguageName;
	}
	
	
	public void setSkillLanguageName(String skillLanguageName) {
		this.skillLanguageName = skillLanguageName;
	}


    @OneToMany(mappedBy="masSkillLanguage",fetch=FetchType.LAZY)
    public Set<SkillLanguage> getSkillLanguage() {
        return skillLanguage;
    }

    public void setSkillLanguage(Set<SkillLanguage> skillLanguage) {
        this.skillLanguage = skillLanguage;
    }


}
