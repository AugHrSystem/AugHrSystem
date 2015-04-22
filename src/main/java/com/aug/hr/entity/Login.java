package com.aug.hr.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Repository;



@Entity
@Table(name="LOGIN")
@Repository
public class Login extends BaseEnityMasterData implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5463453141490649784L;
	
	private Integer loginId;
	private String username;
	private String password;
	private Employee emp;
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")	
	public Integer getLoginId() {
		return loginId;
	}


	public void setLoginId(Integer loginId) {
		this.loginId = loginId;
	}
	
	@Column(name="USERNAME")
	@NotNull
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
	@JoinColumn(name="EMP_ID")
	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	
	

		
}
