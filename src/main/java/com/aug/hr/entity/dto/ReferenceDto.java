package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@NamedNativeQueries({
	@NamedNativeQuery(
            name = "searchReferent",
            query = "select ref.ID as ID ,ref.ADDRESS as ADDRESS,ref.OCCUPATION,ref.TEL as TELs from EMP_REFERENCE as ref,EMP_EMPLOYEE as emp where ref.EMPLOYEE_ID = emp.ID", 
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
	
	
	@Column(name = "OCCUPATION")
	private String oocupation;


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
	

	
}
