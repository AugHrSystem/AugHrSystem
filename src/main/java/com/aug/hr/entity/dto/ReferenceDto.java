package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@NamedNativeQueries({
	@NamedNativeQuery(
            name = "searchReferent",
            query = "select ref.id,name,ref.address,ref.tel,ref.occupation ,ref.employee_id from emp_reference as ref,emp_employee as emp where ref.employee_id =:empId and ref.employee_id=emp.id", 
            resultClass = ReferenceDto.class)
  })

@Entity
public class ReferenceDto {
	@Column(name ="ID")
	@Id
	private Integer id;
	
	@Column(name = "NAME")
	private String name;
	
	
	@Column(name = "ADDRESS")
	private String address;
	
	
	@Column(name = "TEL")
	private String tel;
	
	
	@Column(name = "OCCUPATION" )
	private String oocupation;
	
	@Column(name ="EMPLOYEE_ID")
	private String employeeId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getOocupation() {
		return oocupation;
	}

	public void setOocupation(String oocupation) {
		this.oocupation = oocupation;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	
}
