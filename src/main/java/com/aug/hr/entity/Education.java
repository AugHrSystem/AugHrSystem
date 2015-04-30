/**
 *
 * @author Preeyaporn
 * @date 21 เม.ย. 2558
 */
package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "EDUCATION")
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
	
	@ManyToOne
	@JoinColumn(name = "EMP_ID")
	private Employee employee;
	
	@ManyToOne
	@JoinColumn(name = "DEGREE_ID")
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

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public MasDegreetype getMasdegreetype() {
		return masdegreetype;
	}

	public void setMasdegreetype(MasDegreetype masdegreetype) {
		this.masdegreetype = masdegreetype;
	}
	
}
