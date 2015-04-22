package com.aug.hr.entity;


import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

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
    
   /* @Column(name = "ADDRESS", nullable = false,length= 100)
    private String address;*/
	
	@Column(name = "TEL", nullable = false,length= 10)
    private String tel;
	
	@Column(name = "SALARY", nullable = false)
    private Float salary;
	
	@Column(name = "DOB", nullable = false)
    private Date dob;
	
	@Column(name = "AGE", nullable = false)
    private Integer age;
	
	@Column(name = "RELIGION", nullable = false,length= 20)
    private String religion;
	
	@Column(name = "PLACEDOB", nullable = false,length= 50)
    private String placedob;
	
	@Column(name = "IDCARD", nullable = false,length= 13)
	private Integer idcard;
	
	@Column(name = "HEIGH", nullable = false)
	private Integer heigh;
	
	@Column(name = "WEIGTH", nullable = false)
	private Integer weigth;
	
	@Column(name = "GENDER", nullable = false)
	private String gender;
	
	@Column(name = "STATUS", nullable = false)
	private String status;
	
	@Column(name = "MILITARY", nullable = false)
	private String military;
	
	@Column(name = "QUALIFICATION", nullable = false)
	private String qualification;
	
	@Column(name = "CODE", nullable = false,length= 10)
	private String code;

	
	@OneToMany(mappedBy = "employee")
	private Set<Education> educations = new HashSet<Education>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "employee", cascade=CascadeType.ALL, orphanRemoval=true)
    private Set<CoreSkill> coreSkill = new HashSet<CoreSkill>();
    
    @ManyToOne
    @JoinColumn(name= "EMPLOYMENT_ID")
    private Employment employment;
    
    @OneToMany(mappedBy = "employee")
    private Set<Ability> abilities = new HashSet<Ability>();
    
    @OneToMany(mappedBy = "employee")
    private Set<Reference> references = new HashSet<Reference>();
    
    @ManyToOne
    @JoinColumn(name= "DIVISION_ID")
    private Division division;
    
    @ManyToOne
    @JoinColumn(name= "JOBLEVEL_ID")
    private Joblevel joblevel;
    
    @OneToMany(mappedBy = "employee")
    private Set<Experience> experiences = new HashSet<Experience>();
    
 
    @ManyToOne
    @JoinColumn(name= "TECHNOLOGY_ID")
    private TechnologyEmp technology;
    
    @OneToMany(mappedBy = "employee", fetch = FetchType.LAZY, cascade=CascadeType.ALL,orphanRemoval=true)
    private Set<EmpFamily> families = new HashSet<EmpFamily>();
    
    

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

	public Set<CoreSkill> getCoreSkill() {
		return coreSkill;
	}

	public void setCoreSkill(Set<CoreSkill> coreSkill) {
		this.coreSkill = coreSkill;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Float getSalary() {
		return salary;
	}

	public void setSalary(Float salary) {
		this.salary = salary;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getPlacedob() {
		return placedob;
	}

	public void setPlacedob(String placedob) {
		this.placedob = placedob;
	}

	public Integer getIdcard() {
		return idcard;
	}

	public void setIdcard(Integer idcard) {
		this.idcard = idcard;
	}

	public Integer getHeigh() {
		return heigh;
	}

	public void setHeigh(Integer heigh) {
		this.heigh = heigh;
	}

	public Integer getWeigth() {
		return weigth;
	}

	public void setWeigth(Integer weigth) {
		this.weigth = weigth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMilitary() {
		return military;
	}

	public void setMilitary(String military) {
		this.military = military;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Set<Education> getEducations() {
		return educations;
	}

	public void setEducations(Set<Education> educations) {
		this.educations = educations;
	}

	public Employment getEmployment() {
		return employment;
	}

	public void setEmployment(Employment employment) {
		this.employment = employment;
	}

	public Set<Ability> getAbilities() {
		return abilities;
	}

	public void setAbilities(Set<Ability> abilities) {
		this.abilities = abilities;
	}

	public Set<Reference> getReferences() {
		return references;
	}

	public void setReferences(Set<Reference> references) {
		this.references = references;
	}

	public Division getDivision() {
		return division;
	}

	public void setDivision(Division division) {
		this.division = division;
	}

	public Joblevel getJoblevel() {
		return joblevel;
	}

	public void setJoblevel(Joblevel joblevel) {
		this.joblevel = joblevel;
	}

	public Set<Experience> getExperiences() {
		return experiences;
	}

	public void setExperiences(Set<Experience> experiences) {
		this.experiences = experiences;
	}

	public TechnologyEmp getTechnology() {
		return technology;
	}

	public void setTechnology(TechnologyEmp technology) {
		this.technology = technology;
	}

	public Set<EmpFamily> getFamilies() {
		return families;
	}

	public void setFamilies(Set<EmpFamily> families) {
		this.families = families;
	}
	

}
