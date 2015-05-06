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
	private Integer technologyEmpId;
	private MasTechnology masTech;
	private Employee employee;
	
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	public Integer getTechnologyEmpId() {
		return technologyEmpId;
	}
	
	
	public void setTechnologyEmpId(Integer technologyEmpId) {
		this.technologyEmpId = technologyEmpId;
	}


	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="MASTECH_ID",nullable=false)
	public MasTechnology getMasTech() {
		return masTech;
	}


	public void setMasTech(MasTechnology masTech) {
		this.masTech = masTech;
	}

	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="EMP_ID",nullable=false)
	public Employee getEmployee() {
		return employee;
	}


	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	
	

}
