/**
 *
 * @author natechanok
 * @date Apr 30, 2015
 */

package com.aug.hr.entity;

import java.util.Date;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "OFFICIAL")
public class Official {
		@Id
	    @GeneratedValue
	    @Column(name = "ID")
	    private Integer id;
		
		@Column(name = "DATE")
		private Date date;

	 	@Column(name = "POSITION_APPLIED_FOR", nullable = true)
		private String positionAppliedFor;
		
		@Column(name = "SALARY_EXPECTED", nullable = true)
		private Double salaryExpected;
	    
		
		 @OneToOne(fetch=FetchType.LAZY, mappedBy="official")
		 private Employee empOfficial;

		 
		 @OneToMany(mappedBy = "official")
		 private Set<Education> educations = new HashSet<Education>();

		 @OneToMany(fetch = FetchType.LAZY, mappedBy = "official", cascade=CascadeType.ALL, orphanRemoval=true)
		 private Set<MasCoreSkill> masCoreSkill = new HashSet<MasCoreSkill>();
			  
		    @ManyToOne
		    @JoinColumn(name= "EMPLOYMENT_ID")
		    private MasEmployment employment;
		    
		    @OneToMany(mappedBy = "official")
		    private Set<Ability> abilities = new HashSet<Ability>();
		    
		    @OneToMany(mappedBy = "official")
		    private Set<Reference> references = new HashSet<Reference>();
		    
		    @ManyToOne
		    @JoinColumn(name= "DIVISION_ID")
		    private MasDivision masDivision;
		    
		    @ManyToOne
		    @JoinColumn(name= "JOBLEVEL_ID")
		    private Joblevel joblevel;
		    
		    @OneToMany(mappedBy = "official")
		    private Set<Experience> experiences = new HashSet<Experience>();
		    
		 	@ManyToOne
		    @JoinColumn(name= "TECHNOLOGY_ID")
		    private TechnologyEmp technology;
		    
		   /* @OneToMany(mappedBy = "official", fetch = FetchType.LAZY, cascade=CascadeType.ALL,orphanRemoval=true)
		    private Set<EmpFamily> families = new HashSet<EmpFamily>();
*/		    

//---------------------------------------------- getter setter ---------------------------------------------//
		 
		public Integer getId() {
			return id;
		}


		public void setId(Integer id) {
			this.id = id;
		}


		public String getPositionAppliedFor() {
			return positionAppliedFor;
		}


		public void setPositionAppliedFor(String positionAppliedFor) {
			this.positionAppliedFor = positionAppliedFor;
		}


		public Double getSalaryExpected() {
			return salaryExpected;
		}


		public void setSalaryExpected(Double salaryExpected) {
			this.salaryExpected = salaryExpected;
		}


		public Employee getEmpOfficial() {
			return empOfficial;
		}


		public void setEmpOfficial(Employee empOfficial) {
			this.empOfficial = empOfficial;
		}


		public Set<Education> getEducations() {
			return educations;
		}


		public void setEducations(Set<Education> educations) {
			this.educations = educations;
		}


		public Set<MasCoreSkill> getMasCoreSkill() {
			return masCoreSkill;
		}


		public void setMasCoreSkill(Set<MasCoreSkill> masCoreSkill) {
			this.masCoreSkill = masCoreSkill;
		}


		public MasEmployment getEmployment() {
			return employment;
		}


		public void setEmployment(MasEmployment employment) {
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


		public MasDivision getMasDivision() {
			return masDivision;
		}


		public void setMasDivision(MasDivision masDivision) {
			this.masDivision = masDivision;
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


		public Date getDate() {
			return date;
		}


		public void setDate(Date date) {
			this.date = date;
		}


		/*public Set<EmpFamily> getFamilies() {
			return families;
		}


		public void setFamilies(Set<EmpFamily> families) {
			this.families = families;
		}*/


		
		 


}
