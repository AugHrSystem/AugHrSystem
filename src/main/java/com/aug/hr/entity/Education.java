/**
 *
 * @author Preeyaporn
 * @date 21 เม.ย. 2558
 */
package com.aug.hr.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.aug.hr.entity.dto.EducationDto;
import com.fasterxml.jackson.annotation.JsonFormat;

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
	
	@Column(name = "CERTIFICATE" ,nullable =false)
	private String certificate;
	
	@Column(name = "DESCRIPTION" ,nullable =false)
	private String description ;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "START_DATE" ,nullable =false)
	private Date startDate;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "GRADUATED_DATE" ,nullable =false)
	private Date graduatedDate;
	
	@ManyToOne()
	@JoinColumn(name = "EMPLOYEE_ID", referencedColumnName="id", nullable = false)
	private Employee employee;
	
	@ManyToOne()
	@JoinColumn(name = "DEGREETYPE_ID", referencedColumnName="DEGREETYPE_ID", nullable = false)
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

	/*---------------------- DTO ----------------------*/
	
	public EducationDto toEducationDto() {
		
		EducationDto educationDto = new EducationDto();
		
		educationDto.setId(this.id);
		educationDto.setUniversity(this.university);
		educationDto.setGpa(this.gpa);
		educationDto.setFaculty(this.faculty);
		educationDto.setMajor(this.major);
		educationDto.setCertificate(this.certificate);
		educationDto.setDescription(this.description);
		educationDto.setStartDate(this.startDate);
		educationDto.setGraduatedDate(this.graduatedDate);
		educationDto.setEmployeeId(this.employee.getId());
		educationDto.setMasDegreeTypeId(this.masdegreetype.getId() );
		educationDto.setMasdegreetype(this.masdegreetype.getName() );
		
		return educationDto;
		
	}
	
	public Education fromEducationDto(EducationDto educationDto) {
		
		Education education = new Education();
		
		education.setId(educationDto.getId());
		education.setUniversity(educationDto.getUniversity());
		education.setGpa(educationDto.getGpa());
		education.setFaculty(educationDto.getFaculty());
		education.setMajor(educationDto.getMajor());
		education.setCertificate(educationDto.getCertificate());
		education.setDescription(educationDto.getDescription());
		education.setStartDate(educationDto.getStartDate());
		education.setGraduatedDate(educationDto.getGraduatedDate());
		
		Employee employee = new Employee();
		employee.setId(educationDto.getEmployeeId());
		education.setEmployee(employee);
		
		MasDegreetype masDegreetype = new MasDegreetype();
		masDegreetype.setId(educationDto.getMasDegreeTypeId());
		masDegreetype.setName(educationDto.getMasdegreetype());
		education.setMasdegreetype(masDegreetype);
		
		return education;
		
	}
	
	
}
