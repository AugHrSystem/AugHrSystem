package com.aug.hr.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;



@Entity
@Table(name="MAS_TECHNOLOGY")
public class MasTechnology extends BaseEnityMasterData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 9016889793391444496L;
	private Integer id;
	private String name;

	private Set<Employee> Employee = new HashSet<Employee>();
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="NAME",nullable=false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@OneToMany(mappedBy="technology",fetch=FetchType.LAZY)
	@JsonManagedReference
	public Set<Employee> getEmployee() {
		return Employee;
	}
	
	public void setEmployee(Set<Employee> employee) {
		Employee = employee;
	}
	
	
	
	
	
}
