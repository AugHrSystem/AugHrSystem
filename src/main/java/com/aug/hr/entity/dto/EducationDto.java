/**
 *
 * @author Pranrajit
 * @date 19 พ.ค. 2558
 */
package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

import com.aug.hr.entity.MasDegreetype;


@NamedNativeQueries({
	@NamedNativeQuery(
			name="searchEducation",
			query="select edu.id,edu.university,edu.gpa,edu.faculty,edu.major,mas_degreetype.name,edu.employee_id,emp.employee_code from emp_education as edu,emp_employee as emp,mas_degreetype where edu.employee_id=:empId  and edu.employee_id = emp.id and mas_degreetype.id = edu.degreetype_id",																																																																					
			resultClass = EducationDto.class)
			
})

@Entity
public class EducationDto {

	@Column(name ="ID")
	@Id
	private Integer id;
	@Column(name = "UNIVERSITY" ,nullable = false)
	private String university;
	@Column(name = "GPA" ,nullable =false)
	private Double  gpa;
	@Column(name = "FACULTY" ,nullable =false)
	private String faculty;
	@Column(name = "MAJOR" ,nullable =false)
	private String major;
	@Column(name = "NAME" )
	private String masdegreetype;
	@Column(name ="EMPLOYEE_ID")
	private String employeeId;
	
	@Column(name = "EMPLOYEE_CODE")
	private String employeeCode;

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

	
	

	public String getMasdegreetype() {
		return masdegreetype;
	}

	public void setMasdegreetype(String masdegreetype) {
		this.masdegreetype = masdegreetype;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}


	
	

}
