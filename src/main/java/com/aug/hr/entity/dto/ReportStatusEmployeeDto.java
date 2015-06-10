package com.aug.hr.entity.dto;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;



@NamedNativeQueries({
		@NamedNativeQuery(
				name = "reportEmployeeStatus",
				query = "Select emp.id,"
						+"emp.EMPLOYEE_CODE as employeeCode,"
						+"emp.NAME_THAI as nameThai,"
						+"emp.NAME_ENG as nameEng,"
						+"emp.DATEOFBIRTH as dateOfBirth,"
						+"emp.AGE as age,"
						+"site.PROJECTOWNER as projectOwner,"
						+"site.STARTDATE as startDate,"
						+"site.ENDDATE as endDate,"
						+"from EMP_EMPLOYEE as emp"
						+"join EMP_SITE as site on site.employee_ID = emp.ID",
					resultClass = ReportStatusEmployeeDto.class)

})
public class ReportStatusEmployeeDto {
	
		@Id
		@Column(name ="ID")
		private Integer id;
		@Column(name = "employeeCode")
		private String employeeCode;
		@Column(name = "NAME_THAI")
		private String nameThai;
		@Column(name = "NAME_ENG")
		private String nameEng;
		@Column(name = "dateOfBirth")
		private Date dateOfBirth;
		@Column(name = "age")
		private Integer age;
		@Column(name="PROJECTOWNER")
		private String projectOwner;
		@Column(name="STARTDATE")
		public Date StartDate;
		@Column(name="ENDDATE")
		public Date endDate;
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
		public String getNameThai() {
			return nameThai;
		}
		public void setNameThai(String nameThai) {
			this.nameThai = nameThai;
		}
		public String getNameEng() {
			return nameEng;
		}
		public void setNameEng(String nameEng) {
			this.nameEng = nameEng;
		}
		public Date getDateOfBirth() {
			return dateOfBirth;
		}
		public void setDateOfBirth(Date dateOfBirth) {
			this.dateOfBirth = dateOfBirth;
		}
		public Integer getAge() {
			return age;
		}
		public void setAge(Integer age) {
			this.age = age;
		}
		public String getProjectOwner() {
			return projectOwner;
		}
		public void setProjectOwner(String projectOwner) {
			this.projectOwner = projectOwner;
		}
		public Date getStartDate() {
			return StartDate;
		}
		public void setStartDate(Date startDate) {
			StartDate = startDate;
		}
		public Date getEndDate() {
			return endDate;
		}
		public void setEndDate(Date endDate) {
			this.endDate = endDate;
		}
		
		

}
