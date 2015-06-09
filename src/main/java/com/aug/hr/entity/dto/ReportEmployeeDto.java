package com.aug.hr.entity.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@NamedNativeQueries({
	@NamedNativeQuery(
            name = "reportEmployee",
            query = "Select emp.id, "
            		+ "emp.employee_code as employeeCode,"
            		+ "emp.dateofbirth as dateOfBirth, "
            		+ "emp.age as age, "
            		+ "emp.name_thai as nameThai, "
            		+ "emp.name_eng as nameEng, "
            		+ "emp.nickname_eng as nicknameEng, "
            		+ "emp.tel_mobile as telMobile, "
            		+ "emp.email as email, "
            		+ "mas_employment.name as employmentName, "
            		+ "mas_division.name as divisionName, "
            		+ "mas_technology.name as technologyName "
            		+ "from emp_employee as emp "
            		+ "join mas_employment on emp.employment_id = mas_employment.id "
            		+ "join mas_division on emp.division_id = mas_division.id "
            		+ "join mas_technology on emp.technology_id = mas_technology.id", 
            resultClass = ReportEmployeeDto.class)
  })
@Entity
public class ReportEmployeeDto {
	
	@Id
	@Column(name ="ID")
	private Integer id;
	@Column(name = "employeeCode")
	private String employeeCode;
	@Column(name = "dateOfBirth")
	private Date dateOfBirth;
	@Column(name = "nameEng")
	private String nameEng;
	@Column(name = "nameThai")
	private String nameThai;
	@Column(name = "nicknameEng")
	private String nicknameEng;
	@Column(name = "telMobile")
	private Integer telMobile;
	@Column(name = "age")
	private Integer age;
	@Column(name = "email")
	private String email;
	@Column(name = "employmentName")
	private String employmentName;
	@Column(name = "divisionName")
	private String divisionName;
	@Column(name = "technologyName")
	private String technologyName;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmployeeCode() {
		return employeeCode;
	}
	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getNameEng() {
		return nameEng;
	}
	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}
	public String getNameThai() {
		return nameThai;
	}
	public void setNameThai(String nameThai) {
		this.nameThai = nameThai;
	}
	public String getNicknameEng() {
		return nicknameEng;
	}
	public void setNicknameEng(String nicknameEng) {
		this.nicknameEng = nicknameEng;
	}
	public Integer getTelMobile() {
		return telMobile;
	}
	public void setTelMobile(Integer telMobile) {
		this.telMobile = telMobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmploymentName() {
		return employmentName;
	}
	public void setEmploymentName(String employmentName) {
		this.employmentName = employmentName;
	}
	public String getDivisionName() {
		return divisionName;
	}
	public void setDivisionName(String divisionName) {
		this.divisionName = divisionName;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getTechnologyName() {
		return technologyName;
	}
	public void setTechnologyName(String technologyName) {
		this.technologyName = technologyName;
	}
	
	
}
