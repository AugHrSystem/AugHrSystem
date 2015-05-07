package com.aug.hr.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Entity
@Table(name="TECHNOLOGYEMPLOYEE")
public class TechnologyEmployee extends BaseEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8765152508545202607L;
	private Integer id;
	private MasTechnology masTechnology;
	private Official official;
	
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	public Integer getTechnologyEmpId() {
		return id;
	}
	
	
	public void setTechnologyEmpId(Integer technologyEmpId) {
		this.id = technologyEmpId;
	}


	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="MASTECHNOLOGY_ID",nullable=false)
	public MasTechnology getMasTech() {
		return masTechnology;
	}


	public void setMasTech(MasTechnology masTech) {
		this.masTechnology = masTech;
	}

	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="OFFICIAL_ID",nullable=false)
	public Official getOfficial() {
		return official;
	}


	public void setOfficial(Official official) {
		this.official = official;
	}
	
	
	

}