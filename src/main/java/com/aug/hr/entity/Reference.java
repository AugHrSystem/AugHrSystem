package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;



@Entity
@Table(name = "EMP_REFERENCE")
public class Reference {
	
	
	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "NAME" ,nullable = false)
	private String name;
	
	
	@Column(name = "ADDRESS" ,nullable = false)
	private String address;
	
	
	@Column(name = "TEL" ,nullable = false)
	private String tel;
	
	
	@Column(name = "OCCUPATION" ,nullable = false)
	private String oocupation;

	
	/*@ManyToOne(fetch=FetchType.EAGER)
	 @JoinColumn(name="OFFICIAL_ID" , referencedColumnName="id")
	 private Official official;*/
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "EMPLOYEE_ID")
	@JsonBackReference
//	@JsonIgnore
	private Employee employee;



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




	public Employee getEmployee() {
		return employee;
	}



	public void setEmployee(Employee employee) {
		this.employee = employee;
	}


	

}
