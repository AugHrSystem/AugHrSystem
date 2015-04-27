package com.aug.hr.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Repository;

@Entity
@Table(name="MASTECHNOLOGY")
public class MasTechnology extends BaseEnityMasterData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 9016889793391444496L;
	private Integer masTechnologyId;
	private String masTechnologyName;
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	public Integer getMasTechnologyId() {
		return masTechnologyId;
	}
	
	public void setMasTechnologyId(Integer masTechnologyId) {
		this.masTechnologyId = masTechnologyId;
	}
	
	@Column(name="NAME",nullable=false)
	public String getMasTechnologyName() {
		return masTechnologyName;
	}
	
	public void setMasTechnologyName(String masTechnologyName) {
		this.masTechnologyName = masTechnologyName;
	}
	
	
}
