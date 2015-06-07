package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@NamedNativeQueries({
	@NamedNativeQuery(
            name = "searchEmployee",
            query = "select emp.ID, emp.EMPLOYEE_CODE, emp.NAME_ENG, emp.SURNAME_ENG from EMP_EMPLOYEE as emp", 
            resultClass = EmployeeDto.class)
  })
@Entity
public class EmployeeDto {
	
	@Id
	@Column(name ="ID")
	private Integer id;
	@Column(name = "EMPLOYEE_CODE")
	private String employeeCode;
	@Column(name = "NAME_ENG")
	private String nameEng;
	@Column(name = "SURNAME_ENG")
	private String surnameEng;
	
	
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
	public String getNameEng() {
		return nameEng;
	}
	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}
	public String getSurnameEng() {
		return surnameEng;
	}
	public void setSurnameEng(String surnameEng) {
		this.surnameEng = surnameEng;
	}
	
	

}
