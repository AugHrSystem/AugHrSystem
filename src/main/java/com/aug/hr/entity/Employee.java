package com.aug.hr.entity;


import javax.persistence.*;

/**
 * Created by amanurat on 4/20/15 AD.
 */
@Entity
@Table(name = "EMPLOYEE")
public class Employee {

    @Id
    @GeneratedValue
    @Column(name = "ID")
    private Long id;

    @Column(name = "NAME")
    private String name;

    @ManyToOne
    @JoinColumn(name = "EDUCATION_ID")
    private Education education;

    @ManyToOne
    @JoinColumn(name = "CORESKILL_ID")
    private CoreSkill coreSkill;
    
    @ManyToOne
    @JoinColumn(name= "EXPERIENCE_ID")
    private Experience experience;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Education getEducation() {
        return education;
    }

	public CoreSkill getCoreSkill() {
		return coreSkill;
	}

	public void setCoreSkill(CoreSkill coreSkill) {
		this.coreSkill = coreSkill;
	}

	public Experience getExperience() {
		return experience;
	}

	public void setExperience(Experience experience) {
		this.experience = experience;
	}

	public void setEducation(Education education) {
		this.education = education;
	}

}
