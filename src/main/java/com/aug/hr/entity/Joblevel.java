package com.aug.hr.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;


@Entity
@Table(name="joblevel")
@Repository
public class Joblevel extends BaseEntity implements Serializable {
	
	@Id
	@Column(name="JoblevelId",nullable=false,unique=true)
	@GeneratedValue
	private Integer id;
	
	@Column(name="JoblevelName",nullable = false,length= 50)
	private String name;
	
	@OneToMany(mappedBy="employee",fetch=FetchType.LAZY,cascade=CascadeType.ALL,orphanRemoval=true)
	private Set<Employee> employees = new HashSet<Employee>();

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

	public Set<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}

	
	
	

}
