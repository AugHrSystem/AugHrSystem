/**
 *
 * @author natechanok
 * @date Apr 21, 2015
 */

package com.aug.hr.entity;
 
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;



@Entity
@Table(name="employee")
@Repository
public class Employee extends BaseEntity implements Serializable {
	
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "Id", unique = true, nullable = false)	
		private Integer Id;
		
		@Column(name = "Name", nullable = false,length= 50)
		private String Name;
		
		@Column(name = "Address", nullable = false,length= 100)
	    private String Address;
		
		@Column(name = "Tel", nullable = false,length= 10)
	    private String Tel;
		
		@Column(name = "Salary", nullable = false)
	    private Float Salary;
		
		@Column(name = "DOB", nullable = false)
	    private Date DOB;
		
		@Column(name = "Age", nullable = false)
	    private Integer Age;
		
		@Column(name = "Religion", nullable = false,length= 20)
	    private String Religion;
		
		@Column(name = "PlaceDOB", nullable = false,length= 50)
	    private String PlaceDOB;
		
		@Column(name = "IdCard", nullable = false,length= 13)
		private Integer IdCard;
		
		@Column(name = "Heigh", nullable = false)
		private Integer Heigh;
		
		@Column(name = "Weigth", nullable = false)
		private Integer Weigth;
		
		@Column(name = "Gender", nullable = false)
		private String Gender;
		
		@Column(name = "Status", nullable = false)
		private String Status;
		
		@Column(name = "Military", nullable = false)
		private String Military;
		
		@Column(name = "Qualification", nullable = false)
		private String Qualification;
		
		@Column(name = "Code", nullable = false,length= 10)
		private String Code;
		
		@OneToMany(mappedBy = "Education", fetch = FetchType.LAZY, cascade=CascadeType.ALL,orphanRemoval=true)
		private Set<Education> educations = new HashSet<Education>();
		
		@ManyToOne(fetch=FetchType.EAGER)
		@JoinColumn(name="Employment_Id",referencedColumnName="Id")
		private Employment employment;
		
		@ManyToOne(fetch=FetchType.EAGER)
		@JoinColumn(name="Joblevel_Id",referencedColumnName="JoblavelId")
		private Joblevel joblevel;
		
		@ManyToOne(fetch=FetchType.EAGER)
		@JoinColumn(name="CoreSkill_Id",referencedColumnName="Id")
		private CoreSkill coreskill;
		
		@ManyToOne(fetch=FetchType.EAGER)
		@JoinColumn(name="Division_Id",referencedColumnName="Id")
		private Division division;
		
		/*@ManyToOne(fetch=FetchType.EAGER)
		@JoinColumn(name="Technology_Id",referencedColumnName="Id")
		private Technology technology;*/
		
		@ManyToOne(fetch=FetchType.EAGER)
		@JoinColumn(name="Ability_Id",referencedColumnName="Id")
		private Ability ability;
		
	
		public Integer getId() {
			return Id;
		}
		public void setId(Integer id) {
			Id = id;
		}
		public String getName() {
			return Name;
		}
		public void setName(String name) {
			Name = name;
		}
		public String getAddress() {
			return Address;
		}
		public void setAddress(String address) {
			Address = address;
		}
		public String getTel() {
			return Tel;
		}
		public void setTel(String tel) {
			Tel = tel;
		}
		public Float getSalary() {
			return Salary;
		}
		public void setSalary(Float salary) {
			Salary = salary;
		}
		public Date getDOB() {
			return DOB;
		}
		public void setDOB(Date dOB) {
			DOB = dOB;
		}
		public Integer getAge() {
			return Age;
		}
		public void setAge(Integer age) {
			Age = age;
		}
		public String getReligion() {
			return Religion;
		}
		public void setReligion(String religion) {
			Religion = religion;
		}
		public String getPlaceDOB() {
			return PlaceDOB;
		}
		public void setPlaceDOB(String placeDOB) {
			PlaceDOB = placeDOB;
		}
		public Integer getIdCard() {
			return IdCard;
		}
		public void setIdCard(Integer idCard) {
			IdCard = idCard;
		}
		public Integer getHeigh() {
			return Heigh;
		}
		public void setHeigh(Integer heigh) {
			Heigh = heigh;
		}
		public Integer getWeigth() {
			return Weigth;
		}
		public void setWeigth(Integer weigth) {
			Weigth = weigth;
		}
		public String getGender() {
			return Gender;
		}
		public void setGender(String gender) {
			Gender = gender;
		}
		public String getStatus() {
			return Status;
		}
		public void setStatus(String status) {
			Status = status;
		}
		public String getMilitary() {
			return Military;
		}
		public void setMilitary(String military) {
			Military = military;
		}
		public String getQualification() {
			return Qualification;
		}
		public void setQualification(String qualification) {
			Qualification = qualification;
		}
		public String getCode() {
			return Code;
		}
		public void setCode(String code) {
			Code = code;
		}
		public Set<Education> getEducations() {
			return educations;
		}
		public void setEducations(Set<Education> educations) {
			this.educations = educations;
		}
		
		
		
	

	
	
}
