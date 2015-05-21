/**
 *
 * @author Preeyaporn
 * @date 21 เม.ย. 2558
 */
package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "EMP_EDUCATION")
public class Education extends BaseEntity{
	
	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "UNIVERSITY" ,nullable = false)
	private String university;
	
	@Column(name = "GPA" ,nullable =false)
	private Double  gpa;
	
	@Column(name = "FACULTY" ,nullable =false)
	private String faculty;
	
	@Column(name = "MAJOR" ,nullable =false)
	private String major;
	
	/*@ManyToOne()
	@JoinColumn(name="OFFICIAL_ID")
	private Official official;*/
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "EMPLOYEE_ID",referencedColumnName="id" , nullable = false)
//	@JsonIgnore
	private Employee employee;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "DEGREETYPE_ID", nullable = false)
	private MasDegreetype masdegreetype;

	/*---------------------- getter / setter ----------------------*/
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public Double getGpa() {
		return gpa;
	}

	public void setGpa(Double gpa) {
		this.gpa = gpa;
	}

	public String getFaculty() {
		return faculty;
	}

	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}
	
	/*public Official getOfficial() {
		return official;
	}

	public void setOfficial(Official official) {
		this.official = official;
	}*/

	public MasDegreetype getMasdegreetype() {
		return masdegreetype;
	}

	public void setMasdegreetype(MasDegreetype masdegreetype) {
		this.masdegreetype = masdegreetype;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	
	
}
