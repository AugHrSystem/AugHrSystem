package com.aug.hr.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;


@Entity
@Table(name = "Specialty")
@Repository
public class Specialty extends BaseEntity{
	
	@Id
	@Column(name="SPEC_ID")
	@GeneratedValue
	private Integer id;

	
	@Column(name = "Spec_Name" ,nullable = false)
	private String name;
	
	
	
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
	
	
}
