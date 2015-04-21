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

import org.springframework.stereotype.Repository;

@Entity
@Table(name = "EDUCATION")
@Repository
public class Education extends BaseEntity{
	
	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "UNIVERSITY" ,nullable = false)
	private String university;
	
	@Column(name = "GPA" ,nullable =false)
	private String gpa;
	
	@Column(name = "FACULTY" ,nullable =false)
	private String faculty;
	
	@Column(name = "MAJOR" ,nullable =false)
	private String major;
	
	@Column(name = "DEGREE" ,nullable =false)
	private String degree;
	
	@ManyToOne
	@JoinColumn(name = "EMP_ID" ,referencedColumnName="id")
	private Employee employee;

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

	public String getGpa() {
		return gpa;
	}

	public void setGpa(String gpa) {
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

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
