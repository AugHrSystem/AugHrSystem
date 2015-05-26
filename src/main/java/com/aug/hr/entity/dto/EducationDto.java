/**
 *
 * @author Preeyaporn
 * @date 22 พ.ค. 2558
 */
package com.aug.hr.entity.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;


@NamedNativeQueries({
	@NamedNativeQuery(
			name="searchEducation",
			query="select edu.id,edu.university,edu.gpa,edu.faculty,edu.major,mas_degreetype.name,edu.certificate,edu.description,edu.start_date,edu.graduated_date,edu.employee_id from emp_education as edu,emp_employee as emp,mas_degreetype where edu.employee_id=:empId  and edu.employee_id = emp.id and mas_degreetype.id = edu.degreetype_id",																																																																					
			resultClass = EducationDto.class)
			
})

@Entity
public class EducationDto {

	@Column(name ="ID")
	@Id
	private Integer id;
	@Column(name = "UNIVERSITY")
	private String university;
	@Column(name = "GPA")
	private Double  gpa;
	@Column(name = "FACULTY")
	private String faculty;
	@Column(name = "MAJOR")
	private String major;
	@Column(name = "NAME" )
	private String masdegreetype;
	@Column(name = "CERTIFICATE")
	private String certificate;
	@Column(name = "DESCRIPTION")
	private String description ;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "START_DATE")
	private Date startDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Graduated_DATE")
	private Date graduatedDate;
	@Column(name ="EMPLOYEE_ID")
	private Integer employeeId;
	@Column(name ="DEGREETYPE_ID")
	private Integer masDegreeTypeId;
	
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
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getGraduatedDate() {
		return graduatedDate;
	}
	public void setGraduatedDate(Date graduatedDate) {
		this.graduatedDate = graduatedDate;
	}
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public Integer getMasDegreeTypeId() {
		return masDegreeTypeId;
	}
	public void setMasDegreeTypeId(Integer masDegreeTypeId) {
		this.masDegreeTypeId = masDegreeTypeId;
	}
	
}
