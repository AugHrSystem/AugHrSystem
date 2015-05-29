package com.aug.hr.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;



@Entity
@Table(name="EMP_LOGIN")
@Repository
public class Login extends BaseEntity{

	
	private Integer id;
	private String username;
	private String password;
	private Employee empolyee;
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}	
	
	@Column(name="USERNAME",nullable=false)
	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	@Column(name="PASSWORD",length=13,nullable=false)
	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}

	@OneToOne
	@JoinColumn(name="EMPLOYEE_ID",nullable=true)
	public Employee getEmpolyee() {
		return empolyee;
	}


	public void setEmpolyee(Employee empolyee) {
		this.empolyee = empolyee;
	}

	
	

		
}
