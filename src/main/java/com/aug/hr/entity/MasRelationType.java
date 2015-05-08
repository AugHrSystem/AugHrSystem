package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="MASRELATION")
public class MasRelationType {
	
	private Integer id;
	private String  relationType;
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	public Integer getId() {
		return id;
	}
	
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	@Column(name="RELATIONTYPE",nullable=false)
	public String getRelationType() {
		return relationType;
	}
	
	
	
	public void setRelationType(String relationType) {
		this.relationType = relationType;
	}



	
	 


}
