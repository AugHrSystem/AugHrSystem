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
            		+ "YEAR(CURDATE()) - YEAR(dateofbirth) - IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(dateofbirth), '/', DAY(dateofbirth)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as year, "
            		+ "MONTH(curdate()) - MONTH(dateofbirth) - IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(dateofbirth), '/', DAY(dateofbirth)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as month, "
            		+ "DAY(curdate()) - DAY(dateofbirth) - IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(dateofbirth), '/', DAY(dateofbirth)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as day, "
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
            		+ "join mas_technology on emp.technology_id = mas_technology.id "
            		+ "where emp.name_eng like :name", 
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
	@Column(name = "year")
	private Integer year;
	@Column(name = "month")
	private Integer month;
	@Column(name = "day")
	private Integer day;
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
	public String getTechnologyName() {
		return technologyName;
	}
	public void setTechnologyName(String technologyName) {
		this.technologyName = technologyName;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public Integer getDay() {
		return day;
	}
	public void setDay(Integer day) {
		this.day = day;
	}
	
	
}
